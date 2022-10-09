pub trait U8Ext: Sized {
	// _p = polyfill
	fn carrying_add_p(self, rhs: Self, carry: bool) -> (Self, bool);
	fn borrowing_sub_p(self, rhs: Self, borrow: bool) -> (Self, bool);
}

impl U8Ext for u8 {
	fn carrying_add_p(self, rhs: Self, carry: bool) -> (Self, bool) {
		let (intermediate, carry_from_rhs) = self.overflowing_add(rhs);
		let (ret, carry_from_carry) = intermediate.overflowing_add(carry.into());
		(ret, carry_from_rhs || carry_from_carry)
	}

	fn borrowing_sub_p(self, rhs: Self, borrow: bool) -> (Self, bool) {
		let (intermediate, borrow_from_rhs) = self.overflowing_sub(rhs);
		let (ret, borrow_from_borrow) = intermediate.overflowing_sub(borrow.into());
		(ret, borrow_from_rhs || borrow_from_borrow)
	}
}
