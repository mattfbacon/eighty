use byte_pattern::byte_pattern;

#[derive(Debug, Clone, Copy)]
pub enum Register {
	B,
	C,
	D,
	E,
	H,
	L,
	MemoryRef,
	A,
}

impl Register {
	fn from_bits(bits: u8) -> Self {
		match bits & 0b111 {
			0b000 => Self::B,
			0b001 => Self::C,
			0b010 => Self::D,
			0b011 => Self::E,
			0b100 => Self::H,
			0b101 => Self::L,
			0b110 => Self::MemoryRef,
			0b111 => Self::A,
			_ => unreachable!(),
		}
	}
}

#[derive(Debug, Clone, Copy)]
pub enum SmallRegisterPair {
	Bc,
	De,
}

impl SmallRegisterPair {
	fn from_bits(bits: u8) -> Self {
		match bits & 0b1 {
			0b0 => Self::Bc,
			0b1 => Self::De,
			_ => unreachable!(),
		}
	}
}

#[derive(Debug, Clone, Copy)]
pub enum StackOpRegPair {
	Bc,
	De,
	Hl,
	FlagsA,
}

impl StackOpRegPair {
	fn from_bits(bits: u8) -> Self {
		match bits & 0b11 {
			0b00 => Self::Bc,
			0b01 => Self::De,
			0b10 => Self::Hl,
			0b11 => Self::FlagsA,
			_ => unreachable!(),
		}
	}
}

#[derive(Debug, Clone, Copy)]
pub enum LargeRegPair {
	Bc,
	De,
	Hl,
	Sp,
}

impl LargeRegPair {
	fn from_bits(bits: u8) -> Self {
		match bits & 0b11 {
			0b00 => Self::Bc,
			0b01 => Self::De,
			0b10 => Self::Hl,
			0b11 => Self::Sp,
			_ => unreachable!(),
		}
	}
}

#[derive(Debug, Clone, Copy)]
pub enum ToAccumulatorOperation {
	Add,
	AddWithCarry,
	Subtract,
	SubtractWithBorrow,
	And,
	Xor,
	Or,
	Compare,
}

impl ToAccumulatorOperation {
	fn from_bits(bits: u8) -> Self {
		match bits & 0b111 {
			0b000 => Self::Add,
			0b001 => Self::AddWithCarry,
			0b010 => Self::Subtract,
			0b011 => Self::SubtractWithBorrow,
			0b100 => Self::And,
			0b101 => Self::Xor,
			0b110 => Self::Or,
			0b111 => Self::Compare,
			_ => unreachable!(),
		}
	}
}

#[derive(Debug, Clone, Copy)]
pub enum RotateAccumulatorOperation {
	Left,
	Right,
	LeftThroughCarry,
	RightThroughCarry,
}

impl RotateAccumulatorOperation {
	fn from_bits(bits: u8) -> Self {
		match bits & 0b11 {
			0b00 => Self::Left,
			0b01 => Self::Right,
			0b10 => Self::LeftThroughCarry,
			0b11 => Self::RightThroughCarry,
			_ => unreachable!(),
		}
	}
}

#[derive(Debug, Clone, Copy)]
pub enum DirectAddressOperation {
	StoreHl,
	LoadHl,
	StoreAccumulator,
	LoadAccumulator,
}

impl DirectAddressOperation {
	fn from_bits(bits: u8) -> Self {
		match bits & 0b11 {
			0b00 => Self::StoreHl,
			0b01 => Self::LoadHl,
			0b10 => Self::StoreAccumulator,
			0b11 => Self::LoadAccumulator,
			_ => unreachable!(),
		}
	}
}

#[derive(Debug, Clone, Copy)]
pub enum Condition {
	Unconditional,
	Zero,
	NoCarry,
	Carry,
	ParityOdd,
	ParityEven,
	Plus,
	Minus,
	NonZero,
}

impl Condition {
	fn from_bits(bits: u8) -> Self {
		match bits & 0b111 {
			0b000 => Self::NonZero,
			0b001 => Self::Zero,
			0b010 => Self::NoCarry,
			0b011 => Self::Carry,
			0b100 => Self::ParityOdd,
			0b101 => Self::ParityEven,
			0b110 => Self::Plus,
			0b111 => Self::Minus,
			_ => unreachable!(),
		}
	}
}

#[derive(Debug, Clone, Copy)]
pub enum Instruction {
	ComplementCarry,
	SetCarry,
	Increment(Register),
	Decrement(Register),
	ComplementAccumulator,
	DecimalAdjustAccumulator,
	Nop,
	Move {
		destination: Register,
		source: Register,
	},
	StoreAccumulator(SmallRegisterPair),
	LoadAccumulator(SmallRegisterPair),
	ToAccumulator(ToAccumulatorOperation, Register),
	RotateAccumulator(RotateAccumulatorOperation),
	Push(StackOpRegPair),
	Pop(StackOpRegPair),
	AddToHl(LargeRegPair),
	IncrementPair(LargeRegPair),
	DecrementPair(LargeRegPair),
	ExchangeRegisters,
	ExchangeStack,
	LoadSpFromHl,
	LoadLargeImmediate(LargeRegPair, u16),
	LoadImmediate(Register, u8),
	ToAccumulatorImmediate(ToAccumulatorOperation, u8),
	DirectAddress(DirectAddressOperation, u16),
	LoadProgramCounter,
	Jump(Condition, u16),
	Call(Condition, u16),
	ReturnFromSubroutine(Condition),
	Restart(u8),
	EnableInterrupts,
	DisableInterrupts,
	In(u8),
	Out(u8),
	Halt,
	Invalid(u8),
}

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

	#[byte_pattern]
	pub fn decode(buffer: &mut InstructionBuffer<'_>) -> Self {
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

pub struct InstructionBuffer<'a> {
	data: &'a [u8],
	cursor: usize,
}

impl<'a> InstructionBuffer<'a> {
	pub fn new(data: &'a [u8]) -> Self {
		Self::new_at(data, 0)
	}

	pub fn new_at(data: &'a [u8], cursor: usize) -> Self {
		Self { data, cursor }
	}
}

impl InstructionBuffer<'_> {
	pub fn cursor(&self) -> usize {
		self.cursor
	}

	pub fn is_empty(&self) -> bool {
		self.cursor == self.data.len()
	}

	pub fn decode(&mut self) -> Instruction {
		Instruction::decode(self)
	}

	fn read_u8(&mut self) -> u8 {
		let ret = self.data[self.cursor];
		self.cursor += std::mem::size_of::<u8>();
		ret
	}

	fn read_u16(&mut self) -> u16 {
		let ret = u16::from_le_bytes(self.data[self.cursor..][..2].try_into().unwrap());
		self.cursor += std::mem::size_of::<u16>();
		ret
	}
}
