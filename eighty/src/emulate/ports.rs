use super::{Emulator, Sound};

impl<S: FnMut(Sound)> Emulator<S> {
	pub(in crate::emulate) fn read_port(&mut self, port: u8) -> Option<u8> {
		Some(match port {
			0 => 0b0000_1110,
			1 => self.buttons.port_1(),
			2 => 0,
			3 => self.shift_register.read(),
			_ => {
				log::warn!("unattached port 0x{port:02x}");
				return None;
			}
		})
	}

	pub(in crate::emulate) fn write_port(&mut self, port: u8, value: u8) {
		match port {
			2 => self.shift_register.write_offset(value),
			3 => self.sound_handler.write_3(value),
			4 => self.shift_register.write(value),
			5 => self.sound_handler.write_5(value),
			6 => log::debug!("debug port: {value} 0x{value:02x} {:?}", char::from(value)),
			_ => log::warn!("unattached port 0x{port:02x} (byte written was 0x{value:02x})"),
		}
	}
}
