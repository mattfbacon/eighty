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

use pixels::wgpu::TextureFormat;
use pixels::{PixelsBuilder, SurfaceTexture};
use winit::dpi::LogicalSize;
use winit::event::{ElementState, Event, ScanCode, WindowEvent};
use winit::event_loop::EventLoop;
use winit::window::WindowBuilder;

mod args;
mod decode;
mod emulate;
mod util;

use args::{Args, Command, DisassembleCommand, EmulateCommand};
use emulate::{Emulator, Sound};

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

const BUTTON_MAP: &[(ScanCode, emulate::Button)] = {
	use emulate::Button;
	&[
		(30, Button::Left),  // A
		(32, Button::Right), // D
		(17, Button::Shoot), // W
		(31, Button::Start), // S
		(46, Button::Coin),  // C
	]
};

const WIDTH: u16 = 224;
const HEIGHT: u16 = 256;

fn spawn_emulator<S: FnMut(Sound) + Send + 'static>(
	pixels: Arc<Mutex<pixels::Pixels>>,
	mut emulator: Emulator<S>,
) {
	std::thread::spawn(move || {
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
	});
}

fn stream_for(sound: Sound) -> &'static [u8] {
	match sound {
		Sound::UfoStart => include_bytes!("../../audio/ufo.ogg"),
		Sound::UfoStop => unreachable!(),
		Sound::Flash => include_bytes!("../../audio/flash.ogg"),
		Sound::Shot => include_bytes!("../../audio/shot.ogg"),
		Sound::InvaderDie => include_bytes!("../../audio/invader-die.ogg"),
		Sound::FleetMovement1 => include_bytes!("../../audio/fleet-movement1.ogg"),
		Sound::FleetMovement2 => include_bytes!("../../audio/fleet-movement2.ogg"),
		Sound::FleetMovement3 => include_bytes!("../../audio/fleet-movement3.ogg"),
		Sound::FleetMovement4 => include_bytes!("../../audio/fleet-movement4.ogg"),
		Sound::UfoHit => include_bytes!("../../audio/ufo-hit.ogg"),
	}
}

fn emulate(program: &[u8], start: u16) {
	let (button_sender, button_receiver) = std::sync::mpsc::channel();

	let sound_player = audio_engine::AudioEngine::new().unwrap();
	sound_player.set_group_volume((), 0.1);

	let emulator = Emulator::new(program, start, false, button_receiver, {
		let make_sound = |player: &audio_engine::AudioEngine<()>, sound| {
			player
				.new_sound(audio_engine::OggDecoder::new(std::io::Cursor::new(stream_for(sound))).unwrap())
				.unwrap()
		};

		let mut ufo_sound = make_sound(&sound_player, Sound::UfoStart);
		move |sound| match sound {
			Sound::UfoStart => {
				ufo_sound.set_loop(true);
				ufo_sound.play();
			}
			Sound::UfoStop => {
				ufo_sound.set_loop(false);
				ufo_sound.stop();
			}
			other => make_sound(&sound_player, other).play(),
		}
	});

	let event_loop = EventLoop::new();
	let window = WindowBuilder::new()
		.with_min_inner_size(LogicalSize {
			width: WIDTH,
			height: HEIGHT,
		})
		.with_title("8080 Emulator")
		.build(&event_loop)
		.unwrap();
	let window_size = window.inner_size();
	let surface_texture = SurfaceTexture::new(window_size.width, window_size.height, &window);
	let pixels = PixelsBuilder::new(WIDTH.into(), HEIGHT.into(), surface_texture)
		.render_texture_format(TextureFormat::Bgra8UnormSrgb)
		.build()
		.unwrap();

	let pixels = Arc::new(Mutex::new(pixels));

	spawn_emulator(Arc::clone(&pixels), emulator);

	let mut focused = true;
	event_loop.run(move |event, _, control_flow| {
		if focused {
			control_flow.set_wait_until(Instant::now() + Duration::from_secs_f32(1.0 / 60.0));
		} else {
			control_flow.set_wait();
		}

		match event {
			Event::RedrawRequested(..) => {
				pixels.lock().unwrap().render().unwrap();
			}
			Event::WindowEvent { event, .. } => match event {
				WindowEvent::KeyboardInput { input, .. } => {
					if let Some((_key, button)) = BUTTON_MAP
						.iter()
						.copied()
						.find(|&(key, _button)| key == input.scancode)
					{
						button_sender
							.send(emulate::ButtonEvent {
								button,
								pressed: match input.state {
									ElementState::Pressed => true,
									ElementState::Released => false,
								},
							})
							.unwrap();
					}
				}
				WindowEvent::CloseRequested => {
					control_flow.set_exit();
				}
				WindowEvent::Resized(new_size) => {
					pixels
						.lock()
						.unwrap()
						.resize_surface(new_size.width, new_size.height);
				}
				WindowEvent::Focused(value) => {
					focused = value;
				}
				_ => (),
			},
			Event::MainEventsCleared => {
				window.request_redraw();
			}
			_ => (),
		}
	});
}
