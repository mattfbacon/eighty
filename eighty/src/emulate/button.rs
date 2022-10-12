#[derive(Debug, Clone, Copy)]
pub enum Button {
	Start,
	Left,
	Right,
	Shoot,
	Coin,
}

#[derive(Debug, Clone, Copy)]
pub struct Event {
	pub button: Button,
	pub pressed: bool,
}

impl Event {
	fn to_bit(self) -> u8 {
		match self.button {
			Button::Start => 2,
			Button::Shoot => 4,
			Button::Left => 5,
			Button::Right => 6,
			Button::Coin => 0,
		}
	}
}

#[derive(Clone, Copy)]
pub struct Buttons {
	port_1: u8,
}

#[allow(clippy::derivable_impls)] // may change this
impl Default for Buttons {
	fn default() -> Self {
		Self { port_1: 0 }
	}
}

impl Buttons {
	pub fn port_1(self) -> u8 {
		self.port_1
	}

	fn set_bit(&mut self, bit: u8, value: bool) {
		let byte = &mut self.port_1;

		let mask = 1u8 << bit;
		if value {
			*byte |= mask;
		} else {
			*byte &= !mask;
		}
	}

	pub fn update(&mut self, event: Event) {
		self.set_bit(event.to_bit(), event.pressed);
	}
}
