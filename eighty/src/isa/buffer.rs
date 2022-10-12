use super::Instruction;

pub struct Buffer<'a> {
	data: &'a [u8],
	cursor: usize,
}

impl<'a> Buffer<'a> {
	pub fn new_at(data: &'a [u8], cursor: usize) -> Self {
		Self { data, cursor }
	}
}

impl Buffer<'_> {
	pub fn cursor(&self) -> usize {
		self.cursor
	}

	pub fn is_empty(&self) -> bool {
		self.cursor == self.data.len()
	}

	pub fn decode(&mut self) -> Instruction {
		Instruction::decode(self)
	}

	pub(in crate::isa) fn read_u8(&mut self) -> u8 {
		let ret = self.data[self.cursor];
		self.cursor += std::mem::size_of::<u8>();
		ret
	}

	pub(in crate::isa) fn read_u16(&mut self) -> u16 {
		let ret = u16::from_le_bytes(self.data[self.cursor..][..2].try_into().unwrap());
		self.cursor += std::mem::size_of::<u16>();
		ret
	}
}
