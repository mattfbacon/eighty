use std::time::{Duration, Instant};

use super::{Emulator, Sound};
use crate::isa::model::{
	DirectAddressOperation, Instruction, LargeRegPair, Register, RotateAccumulatorOperation,
	StackOpRegPair, ToAccumulatorOperation,
};
use crate::isa::Buffer as InstructionBuffer;
use crate::util::U8Ext as _;

pub enum ExecuteResult {
	Normal,
	Halt { interrupts_enabled: bool },
}

impl<S: FnMut(Sound)> Emulator<S> {
	const CYCLE_TIME: Duration = Duration::from_nanos(500); // 2 mhz

	#[allow(clippy::too_many_lines)] // giant match
	pub(in crate::emulate) fn execute_one(&mut self) -> ExecuteResult {
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
			let num_cycles = instruction.num_cycles(condition_was_true);
			let to_sleep = Self::CYCLE_TIME * num_cycles.into();
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

	pub(in crate::emulate) fn handle_interrupt(&mut self, interrupt_number: u8) {
		self.interrupts_enabled = false;
		self
			.regs_and_mem
			.push(self.regs_and_mem.registers.program_counter);
		self.regs_and_mem.registers.program_counter = u16::from(interrupt_number) << 3;
	}
}
