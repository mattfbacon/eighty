use crate::isa::model::LargeRegPair;

#[derive(Default, Debug)]
pub struct Registers {
	pub b: u8,
	pub c: u8,
	pub d: u8,
	pub e: u8,
	pub h: u8,
	pub l: u8,
	pub a: u8,
	pub stack_pointer: u16,
	pub program_counter: u16,
}

impl Registers {
	pub fn hl(&self) -> u16 {
		u16::from_le_bytes([self.l, self.h])
	}

	pub fn set_hl(&mut self, value: u16) {
		[self.l, self.h] = value.to_le_bytes();
	}

	pub fn get_pair(&self, pair: LargeRegPair) -> u16 {
		use LargeRegPair as L;

		u16::from_le_bytes(match pair {
			L::Bc => [self.c, self.b],
			L::De => [self.e, self.d],
			L::Hl => [self.l, self.h],
			L::Sp => return self.stack_pointer,
		})
	}

	pub fn set_pair(&mut self, pair: LargeRegPair, value: u16) {
		use LargeRegPair as L;

		let bytes = value.to_le_bytes();

		match pair {
			L::Bc => [self.c, self.b] = bytes,
			L::De => [self.e, self.d] = bytes,
			L::Hl => [self.l, self.h] = bytes,
			L::Sp => self.stack_pointer = value,
		}
	}

	pub fn map_pair(&mut self, pair: LargeRegPair, f: impl FnOnce(u16) -> u16) {
		self.set_pair(pair, f(self.get_pair(pair)));
	}
}
