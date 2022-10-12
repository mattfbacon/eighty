#[derive(Default)]
pub struct ShiftRegister {
	low: u8,
	high: u8,
	offset: u8,
}

impl ShiftRegister {
	#[allow(clippy::cast_possible_truncation)] // intentional
	pub fn read(&self) -> u8 {
		let combined = (u16::from(self.high) << 8) | u16::from(self.low);
		(combined >> (8 - self.offset)) as u8
	}

	pub fn write(&mut self, value: u8) {
		self.low = self.high;
		self.high = value;
	}

	pub fn write_offset(&mut self, offset: u8) {
		self.offset = offset;
	}
}
