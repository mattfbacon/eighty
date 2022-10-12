use std::sync::mpsc::Receiver;

mod button;
mod execute;
mod execute_one;
mod flags;
mod ports;
mod registers;
mod regs_and_mem;
mod shift_register;
mod sound;

use self::button::Buttons;
pub use self::button::{Button, Event as ButtonEvent};
use self::flags::Flags;
use self::registers::Registers;
use self::regs_and_mem::RegistersAndMemory;
use self::shift_register::ShiftRegister;
use self::sound::Handler as SoundHandler;
pub use self::sound::Sound;

pub struct Emulator<S> {
	flags: Flags,
	cycle_accurate: bool,
	interrupts_enabled: bool,
	regs_and_mem: RegistersAndMemory,
	shift_register: ShiftRegister,
	buttons: Buttons,
	button_receiver: Receiver<ButtonEvent>,
	sound_handler: SoundHandler<S>,
}

const MEMORY_SIZE: usize = 64 * 1024; // 64 kb

impl<S: FnMut(Sound)> Emulator<S> {
	pub fn new(
		program: &[u8],
		start: u16,
		cycle_accurate: bool,
		button_receiver: Receiver<ButtonEvent>,
		play_sound: S,
	) -> Self {
		assert!(program.len() < MEMORY_SIZE - usize::from(start));

		let mut memory = Box::new([0u8; MEMORY_SIZE]);
		memory[usize::from(start)..][..program.len()].copy_from_slice(program);

		Self {
			flags: Flags::default(),
			cycle_accurate,
			interrupts_enabled: true,
			regs_and_mem: RegistersAndMemory {
				registers: Registers {
					program_counter: start,
					..Default::default()
				},
				memory,
			},
			shift_register: ShiftRegister::default(),
			buttons: Buttons::default(),
			button_receiver,
			sound_handler: SoundHandler::new(play_sound),
		}
	}
}
