#![deny(
	absolute_paths_not_starting_with_crate,
	future_incompatible,
	keyword_idents,
	macro_use_extern_crate,
	meta_variable_misuse,
	missing_abi,
	missing_copy_implementations,
	non_ascii_idents,
	nonstandard_style,
	noop_method_call,
	pointer_structural_match,
	private_in_public,
	rust_2018_idioms,
	unused_qualifications
)]
#![warn(clippy::pedantic)]
#![allow(clippy::let_underscore_drop)]
#![forbid(unsafe_code)]

mod args;
mod emulate;
mod isa;
mod ui;
mod util;

use self::args::{Args, Command, DisassembleCommand, EmulateCommand};

fn main() {
	let Args {
		command,
		start,
		verbose,
	} = args::get();

	simplelog::TermLogger::init(
		if verbose {
			simplelog::LevelFilter::Debug
		} else {
			simplelog::LevelFilter::Info
		},
		simplelog::Config::default(),
		simplelog::TerminalMode::Stderr,
		simplelog::ColorChoice::Auto,
	)
	.unwrap();

	match command {
		Command::Disassemble(DisassembleCommand {}) => {
			let mut program = vec![0u8; usize::from(start)];
			std::io::Read::read_to_end(&mut std::io::stdin().lock(), &mut program).unwrap();

			let mut buffer = isa::Buffer::new_at(&program, usize::from(start));
			while !buffer.is_empty() {
				let cursor = buffer.cursor();
				let instruction = isa::Instruction::decode(&mut buffer);
				println!("{cursor:04x} | {instruction:04x?}");
			}
		}
		Command::Emulate(EmulateCommand {}) => {
			let mut program = Vec::new();
			std::io::Read::read_to_end(&mut std::io::stdin().lock(), &mut program).unwrap();

			ui::emulate(&program, start);
		}
	}
}
