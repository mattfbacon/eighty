use super::registers::Registers;
use crate::isa::model::{Register, SmallRegisterPair};

pub struct RegistersAndMemory {
	pub registers: Registers,
	pub memory: Box<[u8]>,
}

impl RegistersAndMemory {
	pub fn get_at_hl(&self) -> &u8 {
		&self.memory[usize::from(self.registers.hl())]
	}

	pub fn get_mut_at_hl(&mut self) -> &mut u8 {
		let idx = usize::from(self.registers.hl());
		&mut self.memory[idx]
	}

	pub fn get_u16_at(&self, addr: u16) -> u16 {
		u16::from_le_bytes(self.memory[usize::from(addr)..][..2].try_into().unwrap())
	}

	pub fn set_u16_at(&mut self, addr: u16, value: u16) {
		self.memory[usize::from(addr)..][..2].copy_from_slice(&value.to_le_bytes());
	}

	pub fn get_at_stack(&self) -> u16 {
		self.get_u16_at(self.registers.stack_pointer)
	}

	pub fn set_at_stack(&mut self, value: u16) {
		self.set_u16_at(self.registers.stack_pointer, value);
	}

	pub fn get_small_pair(&self, pair: SmallRegisterPair) -> u16 {
		let pair = match pair {
			SmallRegisterPair::Bc => (self.registers.b, self.registers.c),
			SmallRegisterPair::De => (self.registers.d, self.registers.e),
		};
		(u16::from(pair.0) << 8) | u16::from(pair.1)
	}

	pub fn push(&mut self, value: u16) {
		self.registers.stack_pointer = self.registers.stack_pointer.wrapping_sub(2);
		self.set_at_stack(value);
	}

	pub fn pop(&mut self) -> u16 {
		let ret = self.get_at_stack();
		self.registers.stack_pointer = self.registers.stack_pointer.wrapping_add(2);
		ret
	}
}

impl std::ops::Index<Register> for RegistersAndMemory {
	type Output = u8;

	fn index(&self, reg: Register) -> &Self::Output {
		match reg {
			Register::A => &self.registers.a,
			Register::B => &self.registers.b,
			Register::C => &self.registers.c,
			Register::D => &self.registers.d,
			Register::E => &self.registers.e,
			Register::H => &self.registers.h,
			Register::L => &self.registers.l,
			Register::MemoryRef => self.get_at_hl(),
		}
	}
}

impl std::ops::IndexMut<Register> for RegistersAndMemory {
	fn index_mut(&mut self, reg: Register) -> &mut u8 {
		match reg {
			Register::A => &mut self.registers.a,
			Register::B => &mut self.registers.b,
			Register::C => &mut self.registers.c,
			Register::D => &mut self.registers.d,
			Register::E => &mut self.registers.e,
			Register::H => &mut self.registers.h,
			Register::L => &mut self.registers.l,
			Register::MemoryRef => self.get_mut_at_hl(),
		}
	}
}
