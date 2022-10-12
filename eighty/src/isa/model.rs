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
	pub(in crate::isa) fn from_bits(bits: u8) -> Self {
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
	pub(in crate::isa) fn from_bits(bits: u8) -> Self {
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
	pub(in crate::isa) fn from_bits(bits: u8) -> Self {
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
	pub(in crate::isa) fn from_bits(bits: u8) -> Self {
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
	pub(in crate::isa) fn from_bits(bits: u8) -> Self {
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
	pub(in crate::isa) fn from_bits(bits: u8) -> Self {
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
	pub(in crate::isa) fn from_bits(bits: u8) -> Self {
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
	pub(in crate::isa) fn from_bits(bits: u8) -> Self {
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
