#![deny(
	absolute_paths_not_starting_with_crate,
	future_incompatible,
	keyword_idents,
	macro_use_extern_crate,
	meta_variable_misuse,
	missing_abi,
	missing_copy_implementations,
	non_ascii_idents,
	nonstandard_style,
	noop_method_call,
	pointer_structural_match,
	private_in_public,
	rust_2018_idioms,
	unused_qualifications
)]
#![warn(clippy::pedantic)]
#![allow(clippy::let_underscore_drop)]
#![forbid(unsafe_code)]

use std::sync::{Arc, Mutex};
use std::time::{Duration, Instant};

use args::{Args, Command, DisassembleCommand, EmulateCommand};
use winit::event::{Event, VirtualKeyCode};

mod args;
mod decode;
mod emulate;
mod util;

fn main() {
	let Args {
		command,
		start,
		verbose,
	} = args::get();

	simplelog::TermLogger::init(
		if verbose {
			simplelog::LevelFilter::Debug
		} else {
			simplelog::LevelFilter::Info
		},
		simplelog::Config::default(),
		simplelog::TerminalMode::Stderr,
		simplelog::ColorChoice::Auto,
	)
	.unwrap();

	match command {
		Command::Disassemble(DisassembleCommand {}) => {
			let mut program = vec![0u8; usize::from(start)];
			std::io::Read::read_to_end(&mut std::io::stdin().lock(), &mut program).unwrap();

			let mut buffer = decode::InstructionBuffer::new_at(&program, usize::from(start));
			while !buffer.is_empty() {
				let cursor = buffer.cursor();
				let instruction = decode::Instruction::decode(&mut buffer);
				println!("{cursor:04x} | {instruction:04x?}");
			}
		}
		Command::Emulate(EmulateCommand {}) => {
			let mut program = Vec::new();
			std::io::Read::read_to_end(&mut std::io::stdin().lock(), &mut program).unwrap();

			emulate(&program, start);
		}
	}
}

const BUTTON_MAP: &[(VirtualKeyCode, emulate::Button)] = {
	use emulate::Button;
	&[
		(VirtualKeyCode::A, Button::Left),
		(VirtualKeyCode::D, Button::Right),
		(VirtualKeyCode::W, Button::Shoot),
		(VirtualKeyCode::S, Button::Start),
		(VirtualKeyCode::C, Button::Coin),
	]
};

fn emulate(program: &[u8], start: u16) {
	const WIDTH: u16 = 224;
	const HEIGHT: u16 = 256;

	let (button_sender, button_receiver) = std::sync::mpsc::channel();

	let mut emulator = emulate::Emulator::new(program, start, false, button_receiver);

	let event_loop = winit::event_loop::EventLoop::new();
	let window = winit::window::WindowBuilder::new()
		.with_min_inner_size(winit::dpi::LogicalSize {
			width: WIDTH,
			height: HEIGHT,
		})
		.with_title("8080 Emulator")
		.build(&event_loop)
		.unwrap();
	let window_size = window.inner_size();
	let surface_texture = pixels::SurfaceTexture::new(window_size.width, window_size.height, &window);
	let pixels = pixels::PixelsBuilder::new(WIDTH.into(), HEIGHT.into(), surface_texture)
		.render_texture_format(pixels::wgpu::TextureFormat::Bgra8UnormSrgb)
		.build()
		.unwrap();

	let mut input = winit_input_helper::WinitInputHelper::new();

	let pixels = Arc::new(Mutex::new(pixels));

	std::thread::spawn({
		let pixels = Arc::clone(&pixels);
		move || {
			emulator.execute(|video_mem| {
				let mut pixels = pixels.lock().unwrap();
				let frame = pixels.get_frame();
				for (idx, on) in video_mem
					.iter()
					.flat_map(|byte| {
						[
							byte & 0x80 > 0,
							byte & 0x40 > 0,
							byte & 0x20 > 0,
							byte & 0x10 > 0,
							byte & 0x8 > 0,
							byte & 0x4 > 0,
							byte & 0x2 > 0,
							byte & 0x1 > 0,
						]
					})
					.enumerate()
				{
					let x = idx / usize::from(HEIGHT);
					let y = idx % usize::from(HEIGHT);
					let idx: usize = y * usize::from(WIDTH) + x;
					frame[idx * 4..][..4].copy_from_slice(&if on {
						[0xff, 0xff, 0xff, 0xff]
					} else {
						[0x00, 0x00, 0x00, 0xff]
					});
				}
			});
		}
	});

	event_loop.run(move |event, _, control_flow| {
		control_flow.set_wait_until(Instant::now() + Duration::from_secs_f32(1.0 / 60.0));

		if let Event::RedrawRequested(..) = event {
			pixels.lock().unwrap().render().unwrap();
		}

		if input.update(&event) {
			if input.quit() {
				control_flow.set_exit();
			}

			if let Some(new_size) = input.window_resized() {
				pixels
					.lock()
					.unwrap()
					.resize_surface(new_size.width, new_size.height);
			}

			for &(key, button) in BUTTON_MAP {
				if input.key_pressed(key) {
					button_sender
						.send(emulate::ButtonEvent {
							button,
							state: emulate::ButtonState::Pressed,
						})
						.unwrap();
				} else if input.key_released(key) {
					button_sender
						.send(emulate::ButtonEvent {
							button,
							state: emulate::ButtonState::Released,
						})
						.unwrap();
				}
			}

			window.request_redraw();
		}
	});
}
