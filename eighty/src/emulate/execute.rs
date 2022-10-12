use std::time::{Duration, Instant};

use super::execute_one::ExecuteResult;
use super::{Emulator, Sound};

impl<S: FnMut(Sound)> Emulator<S> {
	pub fn execute(&mut self, mut copy_video: impl FnMut(&[u8])) {
		let mut last_interrupt = Instant::now();
		let mut middle_scan = false;
		loop {
			if self.interrupts_enabled && last_interrupt.elapsed() > Duration::from_secs_f32(1.0 / 120.0)
			{
				if !middle_scan {
					copy_video(&self.regs_and_mem.memory[0x2400..=0x3fff]);
				}
				self.handle_interrupt(if middle_scan { 1 } else { 2 });
				middle_scan = !middle_scan;
				last_interrupt = Instant::now();
			}

			while let Ok(event) = self.button_receiver.try_recv() {
				self.buttons.update(event);
			}

			match self.execute_one() {
				ExecuteResult::Normal => continue,
				ExecuteResult::Halt {
					interrupts_enabled: false,
				} => {
					log::debug!("halt with interrupts disabled. done.");
					break;
				}
				ExecuteResult::Halt {
					interrupts_enabled: true,
				} => {
					log::debug!("halt with interrupts enabled. waiting for interrupt.");
					spin_sleep::sleep(
						(last_interrupt + Duration::from_secs_f32(1.0 / 120.0)) - Instant::now(),
					);
				}
			}
		}
	}
}
