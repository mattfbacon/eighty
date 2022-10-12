use byte_pattern::byte_pattern;

use super::model::{
	Condition, DirectAddressOperation, LargeRegPair, Register, RotateAccumulatorOperation,
	SmallRegisterPair, StackOpRegPair, ToAccumulatorOperation,
};
use super::{Buffer, Instruction};

impl Instruction {
	#[byte_pattern]
	pub fn decode(buffer: &mut Buffer<'_>) -> Self {
		let opcode = buffer.read_u8();
		#[byte_pattern]
		match opcode {
			"0011_1111" => Instruction::ComplementCarry,
			"0011_0111" => Instruction::SetCarry,
			"0010_1111" => Instruction::ComplementAccumulator,
			"0010_0111" => Instruction::DecimalAdjustAccumulator,
			"0000_0000" => Instruction::Nop,
			"1110_1011" => Instruction::ExchangeRegisters,
			"1110_0011" => Instruction::ExchangeStack,
			"1111_1001" => Instruction::LoadSpFromHl,
			"1110_1001" => Instruction::LoadProgramCounter,
			"1111_1011" => Instruction::EnableInterrupts,
			"1111_0011" => Instruction::DisableInterrupts,
			"1101_1011" => Instruction::In(buffer.read_u8()),
			"1101_0011" => Instruction::Out(buffer.read_u8()),
			"0111_0110" => Instruction::Halt,
			"00xx_x100" => Instruction::Increment(Register::from_bits(x)),
			"00xx_x101" => Instruction::Decrement(Register::from_bits(x)),
			#[not("0111_0110")]
			"01dd_dsss" => Instruction::Move {
				destination: Register::from_bits(d),
				source: Register::from_bits(s),
			},
			"000p_0010" => Instruction::StoreAccumulator(SmallRegisterPair::from_bits(p)),
			"000p_1010" => Instruction::LoadAccumulator(SmallRegisterPair::from_bits(p)),
			"10oo_orrr" => {
				Instruction::ToAccumulator(ToAccumulatorOperation::from_bits(o), Register::from_bits(r))
			}
			"000o_o111" => Instruction::RotateAccumulator(RotateAccumulatorOperation::from_bits(o)),
			"11pp_0101" => Instruction::Push(StackOpRegPair::from_bits(p)),
			"11pp_0001" => Instruction::Pop(StackOpRegPair::from_bits(p)),
			"00pp_1001" => Instruction::AddToHl(LargeRegPair::from_bits(p)),
			"00pp_0011" => Instruction::IncrementPair(LargeRegPair::from_bits(p)),
			"00pp_1011" => Instruction::DecrementPair(LargeRegPair::from_bits(p)),
			"00pp_0001" => Instruction::LoadLargeImmediate(LargeRegPair::from_bits(p), buffer.read_u16()),
			"00rr_r110" => Instruction::LoadImmediate(Register::from_bits(r), buffer.read_u8()),
			"11oo_o110" => {
				Instruction::ToAccumulatorImmediate(ToAccumulatorOperation::from_bits(o), buffer.read_u8())
			}
			"001o_o010" => {
				Instruction::DirectAddress(DirectAddressOperation::from_bits(o), buffer.read_u16())
			}
			"11ee_e111" => Instruction::Restart(e),
			"0000_1000" | "0001_0000" | "0001_1000" | "0010_0000" | "0010_1000" | "0011_0000"
			| "0011_1000" => Instruction::Invalid(opcode),
			"11oo_o010" => Instruction::Jump(Condition::from_bits(o), buffer.read_u16()),
			"1100_?011" => Instruction::Jump(Condition::Unconditional, buffer.read_u16()),
			"11oo_o100" => Instruction::Call(Condition::from_bits(o), buffer.read_u16()),
			"11??_1101" => Instruction::Call(Condition::Unconditional, buffer.read_u16()),
			"11oo_o000" => Instruction::ReturnFromSubroutine(Condition::from_bits(o)),
			"110?_1001" => Instruction::ReturnFromSubroutine(Condition::Unconditional),
		}
	}
}
