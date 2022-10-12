use super::model::{Condition, DirectAddressOperation, Register};
use super::Instruction;

impl Instruction {
	#[allow(clippy::match_same_arms)] // clarity
	pub fn num_cycles(self, condition_was_true: bool) -> u8 {
		match self {
			Self::ComplementCarry => 4,
			Self::SetCarry => 4,
			Self::Increment(Register::MemoryRef) | Self::Decrement(Register::MemoryRef) => 10,
			Self::Increment(..) | Self::Decrement(..) => 5,
			Self::ComplementAccumulator => 4,
			Self::DecimalAdjustAccumulator => 4,
			Self::Nop => 4,
			Self::Move {
				source: Register::MemoryRef,
				..
			}
			| Self::Move {
				destination: Register::MemoryRef,
				..
			} => 7,
			Self::Move { .. } => 5,
			Self::StoreAccumulator(..) => 7,
			Self::LoadAccumulator(..) => 7,
			Self::ToAccumulator(_op, Register::MemoryRef) => 7,
			Self::ToAccumulator(..) => 4,
			Self::RotateAccumulator(..) => 4,
			Self::Push(..) => 11,
			Self::Pop(..) => 11,
			Self::AddToHl(..) => 10,
			Self::IncrementPair(..) | Self::DecrementPair(..) => 5,
			Self::ExchangeRegisters => 5,
			Self::ExchangeStack => 18,
			Self::LoadSpFromHl => 5,
			Self::LoadLargeImmediate(..) => 10,
			Self::LoadImmediate(Register::MemoryRef, _value) => 10,
			Self::LoadImmediate(..) => 7,
			Self::ToAccumulatorImmediate(..) => 7,
			Self::DirectAddress(
				DirectAddressOperation::LoadAccumulator | DirectAddressOperation::StoreAccumulator,
				_,
			) => 13,
			Self::DirectAddress(DirectAddressOperation::LoadHl | DirectAddressOperation::StoreHl, _) => {
				13
			}
			Self::LoadProgramCounter => 5,
			Self::Jump(..) => 10,
			Self::Call(..) => {
				if condition_was_true {
					17
				} else {
					11
				}
			}
			Self::ReturnFromSubroutine(Condition::Unconditional) => 10,
			Self::ReturnFromSubroutine(..) => {
				if condition_was_true {
					11
				} else {
					5
				}
			}
			Self::Restart(..) => 11,
			Self::EnableInterrupts | Self::DisableInterrupts => 4,
			Self::In(..) | Self::Out(..) => 10,
			Self::Halt => 7,
			Self::Invalid(..) => 4, // treat as NOP
		}
	}
}
