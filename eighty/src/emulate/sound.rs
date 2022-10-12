#[derive(Debug, Clone, Copy)]
pub enum Sound {
	UfoStart,
	UfoStop,
	Shot,
	Flash,
	InvaderDie,
	FleetMovement1,
	FleetMovement2,
	FleetMovement3,
	FleetMovement4,
	UfoHit,
}

pub struct Handler<S> {
	play_sound: S,
	last_port_3: u8,
	last_port_5: u8,
}

impl<S: FnMut(Sound)> Handler<S> {
	pub fn new(play_sound: S) -> Self {
		Self {
			play_sound,
			last_port_3: 0,
			last_port_5: 0,
		}
	}

	pub fn write_3(&mut self, value: u8) {
		let new = value & !self.last_port_3;

		if new & (1 << 0) > 0 {
			(self.play_sound)(Sound::UfoStart);
		} else if (!value & self.last_port_3) & (1 << 0) > 0 {
			(self.play_sound)(Sound::UfoStop);
		}
		if new & (1 << 1) > 0 {
			(self.play_sound)(Sound::Shot);
		}
		if new & (1 << 2) > 0 {
			(self.play_sound)(Sound::Flash);
		}
		if new & (1 << 3) > 0 {
			(self.play_sound)(Sound::InvaderDie);
		}

		self.last_port_3 = value;
	}

	pub fn write_5(&mut self, value: u8) {
		let new = value & !self.last_port_5;

		if new & (1 << 0) > 0 {
			(self.play_sound)(Sound::FleetMovement1);
		}
		if new & (1 << 1) > 0 {
			(self.play_sound)(Sound::FleetMovement2);
		}
		if new & (1 << 2) > 0 {
			(self.play_sound)(Sound::FleetMovement3);
		}
		if new & (1 << 3) > 0 {
			(self.play_sound)(Sound::FleetMovement4);
		}
		if new & (1 << 4) > 0 {
			(self.play_sound)(Sound::UfoHit);
		}

		self.last_port_5 = value;
	}
}
