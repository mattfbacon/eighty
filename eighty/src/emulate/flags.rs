use crate::isa::model::Condition;

#[allow(clippy::struct_excessive_bools)]
#[derive(Default, Debug)]
pub struct Flags {
	pub carry: bool,
	pub auxiliary_carry: bool,
	pub sign_positive: bool,
	pub zero: bool,
	pub parity_even: bool,
}

impl Flags {
	pub fn set_from_arithmetic(&mut self, result: u8) {
		self.sign_positive = result & 0b1000_0000 == 0;
		self.zero = result == 0;
		self.parity_even = result.count_ones() % 2 == 0;
	}

	#[allow(clippy::identity_op)] // consistency
	pub fn as_byte(&self) -> u8 {
		u8::from(self.carry) << 0
			| u8::from(self.auxiliary_carry) << 4
			| u8::from(self.sign_positive) << 7
			| u8::from(self.zero) << 6
			| u8::from(self.parity_even) << 2
			| 0b0000_0010
	}

	pub fn set_byte(&mut self, byte: u8) {
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

	pub fn evaluate(&self, condition: Condition) -> bool {
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
