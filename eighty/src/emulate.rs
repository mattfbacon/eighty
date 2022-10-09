use std::time::{Duration, Instant};

use crate::decode::{
	Condition, DirectAddressOperation, Instruction, InstructionBuffer, LargeRegPair, Register,
	RotateAccumulatorOperation, SmallRegisterPair, StackOpRegPair, ToAccumulatorOperation,
};
use crate::util::U8Ext as _;

#[allow(clippy::struct_excessive_bools)]
#[derive(Default, Debug)]
struct Flags {
	carry: bool,
	auxiliary_carry: bool,
	sign_positive: bool,
	zero: bool,
	parity_even: bool,
}

impl Flags {
	fn set_from_arithmetic(&mut self, result: u8) {
		self.sign_positive = result & 0b1000_0000 == 0;
		self.zero = result == 0;
		self.parity_even = result.count_ones() % 2 == 0;
	}

	#[allow(clippy::identity_op)] // consistency
	fn as_byte(&self) -> u8 {
		u8::from(self.carry) << 0
			| u8::from(self.auxiliary_carry) << 4
			| u8::from(self.sign_positive) << 7
			| u8::from(self.zero) << 6
			| u8::from(self.parity_even) << 2
			| 0b0000_0010
	}

	fn set_byte(&mut self, byte: u8) {
		macro_rules! set {
			($field:ident, $pos:expr) => {
				self.$field = (byte & (1 << $pos)) > 0;
			};
		}
		set!(carry, 0);
		set!(auxiliary_carry, 4);
		set!(sign_positive, 7);
		set!(zero, 6);
		set!(parity_even, 2);
	}

	fn evaluate(&self, condition: Condition) -> bool {
		use Condition as C;

		match condition {
			C::Unconditional => true,
			C::Zero => self.zero,
			C::NoCarry => !self.carry,
			C::Carry => self.carry,
			C::ParityOdd => !self.parity_even,
			C::ParityEven => self.parity_even,
			C::Plus => self.sign_positive,
			C::Minus => !self.sign_positive,
			C::NonZero => !self.zero,
		}
	}
}

#[derive(Default, Debug)]
struct Registers {
	b: u8,
	c: u8,
	d: u8,
	e: u8,
	h: u8,
	l: u8,
	a: u8,
	stack_pointer: u16,
	program_counter: u16,
}

impl Registers {
	fn hl(&self) -> u16 {
		u16::from_le_bytes([self.l, self.h])
	}

	fn set_hl(&mut self, value: u16) {
		[self.l, self.h] = value.to_le_bytes();
	}

	fn get_pair(&self, pair: LargeRegPair) -> u16 {
		use LargeRegPair as L;

		u16::from_le_bytes(match pair {
			L::Bc => [self.c, self.b],
			L::De => [self.e, self.d],
			L::Hl => [self.l, self.h],
			L::Sp => return self.stack_pointer,
		})
	}

	fn set_pair(&mut self, pair: LargeRegPair, value: u16) {
		use LargeRegPair as L;

		let bytes = value.to_le_bytes();

		match pair {
			L::Bc => [self.c, self.b] = bytes,
			L::De => [self.e, self.d] = bytes,
			L::Hl => [self.l, self.h] = bytes,
			L::Sp => self.stack_pointer = value,
		}
	}

	fn map_pair(&mut self, pair: LargeRegPair, f: impl FnOnce(u16) -> u16) {
		self.set_pair(pair, f(self.get_pair(pair)));
	}
}

pub struct RegistersAndMemory {
	registers: Registers,
	memory: Box<[u8]>,
}

impl RegistersAndMemory {
	fn get_at_hl(&self) -> &u8 {
		&self.memory[usize::from(self.registers.hl())]
	}

	fn get_mut_at_hl(&mut self) -> &mut u8 {
		let idx = usize::from(self.registers.hl());
		&mut self.memory[idx]
	}

	fn get_u16_at(&self, addr: u16) -> u16 {
		u16::from_le_bytes(self.memory[usize::from(addr)..][..2].try_into().unwrap())
	}

	fn set_u16_at(&mut self, addr: u16, value: u16) {
		self.memory[usize::from(addr)..][..2].copy_from_slice(&value.to_le_bytes());
	}

	fn get_at_stack(&self) -> u16 {
		self.get_u16_at(self.registers.stack_pointer)
	}

	fn set_at_stack(&mut self, value: u16) {
		self.set_u16_at(self.registers.stack_pointer, value);
	}

	fn get_small_pair(&self, pair: SmallRegisterPair) -> u16 {
		let pair = match pair {
			SmallRegisterPair::Bc => (self.registers.b, self.registers.c),
			SmallRegisterPair::De => (self.registers.d, self.registers.e),
		};
		(u16::from(pair.0) << 8) | u16::from(pair.1)
	}

	fn push(&mut self, value: u16) {
		self.registers.stack_pointer = self.registers.stack_pointer.wrapping_sub(2);
		self.set_at_stack(value);
	}

	fn pop(&mut self) -> u16 {
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

#[derive(Default)]
pub struct ShiftRegister {
	low: u8,
	high: u8,
	offset: u8,
}

impl ShiftRegister {
	#[allow(clippy::cast_possible_truncation)] // intentional
	fn read(&self) -> u8 {
		let combined = (u16::from(self.high) << 8) | u16::from(self.low);
		(combined >> (8 - self.offset)) as u8
	}

	fn write(&mut self, value: u8) {
		self.low = self.high;
		self.high = value;
	}

	fn write_offset(&mut self, offset: u8) {
		self.offset = offset;
	}
}

pub struct Emulator {
	flags: Flags,
	cycle_accurate: bool,
	interrupts_enabled: bool,
	regs_and_mem: RegistersAndMemory,
	shift_register: ShiftRegister,
}

const MEMORY_SIZE: usize = 64 * 1024; // 64 kb

pub enum ExecuteResult {
	Normal,
	Halt { interrupts_enabled: bool },
}

impl Emulator {
	pub fn new(program: &[u8], start: u16, cycle_accurate: bool) -> Self {
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
		}
	}

	#[allow(clippy::too_many_lines)] // giant match
	pub fn execute_one(&mut self) -> ExecuteResult {
		let start_time = Instant::now();

		let old_pc = self.regs_and_mem.registers.program_counter;
		let instruction = self.next_instruction();
		log::debug!("at pc {old_pc:04x}, got instruction {instruction:02x?}");

		let mut condition_was_true = false;

		match instruction {
			Instruction::ComplementCarry => self.flags.carry = !self.flags.carry,
			Instruction::SetCarry => self.flags.carry = true,
			Instruction::Increment(register) => {
				self.do_operation(ToAccumulatorOperation::Add, register, 1);
			}
			Instruction::Decrement(register) => {
				self.do_operation(ToAccumulatorOperation::Subtract, register, 1);
			}
			Instruction::ComplementAccumulator => {
				*self.a() = !*self.a();
			}
			Instruction::DecimalAdjustAccumulator => {
				let a = &mut self.regs_and_mem.registers.a;
				let mut low = *a & 0b1111;
				let mut high = *a >> 4;
				if low > 9 || self.flags.auxiliary_carry {
					low += 6;
					self.flags.auxiliary_carry = low > 0b1111;
					high += low >> 4; // make sure it flows over
				}
				if high > 9 || self.flags.carry {
					high += 6;
					self.flags.carry = high > 0b1111;
				}
				*a = (high << 4) | (low & 0b1111);
				self.flags.set_from_arithmetic(*a);
			}
			Instruction::Nop => (),
			Instruction::Move {
				destination,
				source,
			} => self.regs_and_mem[destination] = self.regs_and_mem[source],
			Instruction::StoreAccumulator(addr_pair) => {
				let address: usize = self.regs_and_mem.get_small_pair(addr_pair).into();
				self.regs_and_mem.memory[address] = *self.a();
			}
			Instruction::LoadAccumulator(addr_pair) => {
				let address: usize = self.regs_and_mem.get_small_pair(addr_pair).into();
				*self.a() = self.regs_and_mem.memory[address];
			}
			Instruction::ToAccumulator(operation, register) => {
				self.do_operation(operation, Register::A, self.regs_and_mem[register]);
			}
			Instruction::RotateAccumulator(RotateAccumulatorOperation::Left) => {
				let a = &mut self.regs_and_mem.registers.a;
				self.flags.carry = (*a & 0b1000_0000) > 0;
				*a = a.rotate_left(1);
			}
			Instruction::RotateAccumulator(RotateAccumulatorOperation::Right) => {
				let a = &mut self.regs_and_mem.registers.a;
				self.flags.carry = (*a & 0b0000_0001) > 0;
				*a = a.rotate_right(1);
			}
			Instruction::RotateAccumulator(RotateAccumulatorOperation::LeftThroughCarry) => {
				let a = &mut self.regs_and_mem.registers.a;
				let carry = self.flags.carry;
				self.flags.carry = (*a & 0b1000_0000) > 0;
				*a = (*a << 1) | u8::from(carry);
			}
			Instruction::RotateAccumulator(RotateAccumulatorOperation::RightThroughCarry) => {
				let a = &mut self.regs_and_mem.registers.a;
				let carry = self.flags.carry;
				self.flags.carry = (*a & 0b0000_0001) > 0;
				*a = (*a >> 1) | (u8::from(carry) << 7);
			}
			Instruction::Push(pair) => {
				let value = self.get_stack_op_pair(pair);
				self.regs_and_mem.push(value);
			}
			Instruction::Pop(pair) => {
				let value = self.regs_and_mem.pop();
				self.set_stack_op_pair(pair, value);
			}
			Instruction::AddToHl(pair) => {
				let regs = &mut self.regs_and_mem.registers;
				let value = regs.get_pair(pair);
				let hl;
				(hl, self.flags.carry) = regs.hl().overflowing_add(value);
				regs.set_hl(hl);
			}
			Instruction::IncrementPair(pair) => {
				self
					.regs_and_mem
					.registers
					.map_pair(pair, |value| value.wrapping_add(1));
			}
			Instruction::DecrementPair(pair) => {
				self
					.regs_and_mem
					.registers
					.map_pair(pair, |value| value.wrapping_sub(1));
			}
			Instruction::ExchangeRegisters => {
				let regs = &mut self.regs_and_mem.registers;
				let hl = regs.hl();
				let de = regs.get_pair(LargeRegPair::De);
				regs.set_hl(de);
				regs.set_pair(LargeRegPair::De, hl);
			}
			Instruction::ExchangeStack => {
				let hl = self.regs_and_mem.registers.hl();
				let at_stack = self.regs_and_mem.get_at_stack();
				self.regs_and_mem.registers.set_hl(at_stack);
				self.regs_and_mem.set_at_stack(hl);
			}
			Instruction::LoadSpFromHl => {
				self.regs_and_mem.registers.stack_pointer = self.regs_and_mem.registers.hl();
			}
			Instruction::LoadLargeImmediate(pair, value) => {
				self.regs_and_mem.registers.set_pair(pair, value);
			}
			Instruction::LoadImmediate(reg, value) => {
				self.regs_and_mem[reg] = value;
			}
			Instruction::ToAccumulatorImmediate(operation, value) => {
				self.do_operation(operation, Register::A, value);
			}
			Instruction::DirectAddress(DirectAddressOperation::LoadAccumulator, addr) => {
				self.regs_and_mem.registers.a = self.regs_and_mem.memory[usize::from(addr)];
			}
			Instruction::DirectAddress(DirectAddressOperation::StoreAccumulator, addr) => {
				self.regs_and_mem.memory[usize::from(addr)] = self.regs_and_mem.registers.a;
			}
			Instruction::DirectAddress(DirectAddressOperation::LoadHl, addr) => {
				self
					.regs_and_mem
					.registers
					.set_hl(self.regs_and_mem.get_u16_at(addr));
			}
			Instruction::DirectAddress(DirectAddressOperation::StoreHl, addr) => {
				self
					.regs_and_mem
					.set_u16_at(addr, self.regs_and_mem.registers.hl());
			}
			Instruction::LoadProgramCounter => {
				self.regs_and_mem.registers.program_counter = self.regs_and_mem.registers.hl();
			}
			Instruction::Jump(condition, addr) => {
				condition_was_true = self.flags.evaluate(condition);
				if condition_was_true {
					self.regs_and_mem.registers.program_counter = addr;
				}
			}
			Instruction::Call(condition, addr) => {
				condition_was_true = self.flags.evaluate(condition);
				if condition_was_true {
					self
						.regs_and_mem
						.push(self.regs_and_mem.registers.program_counter);
					self.regs_and_mem.registers.program_counter = addr;
				}
			}
			Instruction::ReturnFromSubroutine(condition) => {
				condition_was_true = self.flags.evaluate(condition);
				if condition_was_true {
					self.regs_and_mem.registers.program_counter = self.regs_and_mem.pop();
				}
			}
			Instruction::Restart(routine_number) => {
				self.handle_interrupt(routine_number);
			}
			Instruction::EnableInterrupts => self.interrupts_enabled = true,
			Instruction::DisableInterrupts => self.interrupts_enabled = false,
			Instruction::In(port) => {
				if let Some(ret) = self.read_port(port) {
					self.regs_and_mem.registers.a = ret;
				}
			}
			Instruction::Out(port) => {
				self.write_port(port, self.regs_and_mem.registers.a);
			}
			Instruction::Halt => {
				return ExecuteResult::Halt {
					interrupts_enabled: self.interrupts_enabled,
				}
			}
			Instruction::Invalid(opcode) => log::warn!("invalid opcode 0x{opcode:02x}"),
		}

		if self.cycle_accurate {
			let cycle_time = Duration::from_secs_f32(1.0 / 2_000_000.0); // 2 mhz
			let num_cycles = instruction.num_cycles(condition_was_true);
			let to_sleep = cycle_time * num_cycles.into();
			log::trace!("cycle-accurate, sleeping for {num_cycles} cycles = {to_sleep:?}");
			let until = start_time + to_sleep;
			let duration = until - Instant::now();
			// no sleep_until
			spin_sleep::sleep(duration);
		}

		log::debug!(
			"registers: {:02x?}. flags: {:02x?}",
			self.regs_and_mem.registers,
			self.flags
		);

		ExecuteResult::Normal
	}

	fn read_port(&mut self, port: u8) -> Option<u8> {
		Some(match port {
			1 => 0b0000_0001, // attract mode, TODO actual function
			2 => 0b0000_0000,
			3 => self.shift_register.read(),
			_ => {
				log::warn!("unattached port 0x{port:02x}");
				return None;
			}
		})
	}

	fn write_port(&mut self, port: u8, value: u8) {
		match port {
			2 => self.shift_register.write_offset(value),
			// 3 => todo!("something related to sound"),
			4 => self.shift_register.write(value),
			// 5 => todo!("something related to sound"),
			6 => log::debug!("debug port: {value} 0x{value:02x} {:?}", char::from(value)),
			_ => log::warn!("unattached port 0x{port:02x} (byte written was 0x{value:02x})"),
		}
	}

	fn handle_interrupt(&mut self, interrupt_number: u8) {
		self.interrupts_enabled = false;
		self
			.regs_and_mem
			.push(self.regs_and_mem.registers.program_counter);
		self.regs_and_mem.registers.program_counter = u16::from(interrupt_number) << 3;
	}

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
						(last_interrupt + Duration::from_secs_f32(1.0 / 60.0)) - Instant::now(),
					);
				}
			}
		}
	}

	fn next_instruction(&mut self) -> Instruction {
		let mut buffer = InstructionBuffer::new_at(
			&self.regs_and_mem.memory,
			usize::from(self.regs_and_mem.registers.program_counter),
		);
		let instruction = buffer.decode();
		#[allow(clippy::cast_possible_truncation)] // intentional
		{
			self.regs_and_mem.registers.program_counter = buffer.cursor() as u16;
		}
		instruction
	}

	fn a(&mut self) -> &mut u8 {
		&mut self.regs_and_mem.registers.a
	}

	fn get_stack_op_pair(&self, pair: StackOpRegPair) -> u16 {
		use StackOpRegPair as S;

		let regs = &self.regs_and_mem.registers;

		// order swapped, little-endian
		u16::from_le_bytes(match pair {
			S::Bc => [regs.c, regs.b],
			S::De => [regs.e, regs.d],
			S::Hl => [regs.l, regs.h],
			S::FlagsA => [regs.a, self.flags.as_byte()],
		})
	}

	fn set_stack_op_pair(&mut self, pair: StackOpRegPair, value: u16) {
		use StackOpRegPair as S;

		let regs = &mut self.regs_and_mem.registers;

		let bytes = value.to_le_bytes();
		match pair {
			S::Bc => {
				[regs.c, regs.b] = bytes;
			}
			S::De => {
				[regs.e, regs.d] = bytes;
			}
			S::Hl => {
				[regs.l, regs.h] = bytes;
			}
			S::FlagsA => {
				regs.a = bytes[0];
				self.flags.set_byte(bytes[1]);
			}
		}
	}

	fn do_operation(&mut self, operation: ToAccumulatorOperation, reg: Register, value: u8) {
		use ToAccumulatorOperation as T;

		let reg = &mut self.regs_and_mem[reg];
		match operation {
			T::Add => {
				self.flags.auxiliary_carry = (*reg & 0b1111) + (value & 0b1111) > 0b1111;
				(*reg, self.flags.carry) = reg.overflowing_add(value);
				self.flags.set_from_arithmetic(*reg);
			}
			T::AddWithCarry => {
				let carry = self.flags.carry;
				self.flags.auxiliary_carry = (*reg & 0b1111) + (value & 0b1111) + u8::from(carry) > 0b1111;
				(*reg, self.flags.carry) = reg.carrying_add_p(value, carry);
				self.flags.set_from_arithmetic(*reg);
			}
			T::Subtract => {
				(_, self.flags.auxiliary_carry) = (*reg >> 4).borrowing_sub_p(value >> 4, false);
				(*reg, self.flags.carry) = reg.borrowing_sub_p(value, false);
				self.flags.set_from_arithmetic(*reg);
			}
			T::SubtractWithBorrow => {
				let carry = self.flags.carry;
				(_, self.flags.auxiliary_carry) = (*reg >> 4).borrowing_sub_p(value >> 4, carry);
				(*reg, self.flags.carry) = reg.borrowing_sub_p(value, carry);
				self.flags.set_from_arithmetic(*reg);
			}
			T::And => {
				*reg &= value;
				self.flags.carry = false;
				// this is not specified in the 8080 manual, but is required to pass cpudiag.
				self.flags.auxiliary_carry = false;
				self.flags.set_from_arithmetic(*reg);
			}
			T::Or => {
				*reg |= value;
				self.flags.carry = false;
				// this is not specified in the 8080 manual, but is required to pass cpudiag.
				self.flags.auxiliary_carry = false;
				self.flags.set_from_arithmetic(*reg);
			}
			T::Xor => {
				*reg ^= value;
				self.flags.carry = false;
				self.flags.auxiliary_carry = false;
				self.flags.set_from_arithmetic(*reg);
			}
			T::Compare => {
				(_, self.flags.auxiliary_carry) = (*reg & 0b1111_0000).borrowing_sub_p(value, false);
				let new_value;
				(new_value, self.flags.carry) = reg.borrowing_sub_p(value, false);
				self.flags.set_from_arithmetic(new_value);
			}
		}
	}
}
