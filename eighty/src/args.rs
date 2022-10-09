use argh::FromArgs;

/// Disassemble and emulate 8080 programs.
#[derive(FromArgs)]
pub struct Args {
	/// place the program data at `start` in memory, and initialize the program counter to `start`
	#[argh(option, default = "0")]
	pub start: u16,
	/// print debugging information
	#[argh(switch)]
	pub verbose: bool,
	#[argh(subcommand)]
	pub command: Command,
}

#[derive(FromArgs)]
#[argh(subcommand)]
pub enum Command {
	Disassemble(DisassembleCommand),
	Emulate(EmulateCommand),
}

/// Disassemble
#[derive(FromArgs)]
#[argh(subcommand, name = "disassemble")]
pub struct DisassembleCommand {}

/// Emulate
#[derive(FromArgs)]
#[argh(subcommand, name = "emulate")]
pub struct EmulateCommand {}

pub fn get() -> Args {
	argh::from_env()
}
