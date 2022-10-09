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

use std::collections::{HashMap, HashSet};

use proc_macro2::Span;
use proc_macro_error::{abort, emit_error, proc_macro_error, ResultExt as _};
use quote::{quote, ToTokens as _};
use syn::spanned::Spanned as _;
use syn::visit_mut::VisitMut;
use syn::{
	parse_quote, parse_quote_spanned, Arm, Attribute, Expr, ExprMatch, Ident, Item, Lit, LitStr, Pat,
	PatOr,
};

#[derive(Default, Clone, Copy)]

enum Ternary {
	True,
	#[default]
	False,
	Capture(u8),
	Wild,
}

impl Ternary {
	fn is_wild(self) -> bool {
		match self {
			Self::True | Self::False => false,
			Self::Capture(..) | Self::Wild => true,
		}
	}
}

/// inclusive
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
struct Range {
	start: u8,
	end: u8,
}

impl Range {
	fn len(self) -> u8 {
		self.end - self.start + 1
	}
}

/// bits are in LSB to MSB order
#[derive(Default, Clone, Copy)]
struct TernaryByte([Ternary; 8]);

impl TernaryByte {
	fn captures(self) -> Result<Captures, String> {
		struct Current {
			ch: char,
			range: Range,
		}

		let mut ret = HashMap::new();
		let mut current: Option<Current> = None;

		for (idx, bit) in self.0.into_iter().enumerate() {
			let idx: u8 = idx.try_into().unwrap();
			match bit {
				Ternary::False | Ternary::True | Ternary::Wild => continue,
				Ternary::Capture(ch) => {
					let ch: char = ch.into();

					if let Some(current) = &mut current {
						if ch == current.ch {
							current.range.end += 1;
							continue;
						} else if ret.insert(current.ch, current.range).is_some() {
							return Err(format!("multiple separate captures with name {ch:?}"));
						}
					}

					current = Some(Current {
						ch,
						range: Range {
							start: idx,
							end: idx,
						},
					});
				}
			}
		}

		if let Some(last) = current.take() {
			if ret.insert(last.ch, last.range).is_some() {
				return Err(format!(
					"multiple separate captures with name {:?}",
					last.ch
				));
			}
		}

		Ok(ret)
	}

	fn fill_with_counter(self, mut counter: u8) -> u8 {
		let mut ret = 0u8;

		// MSB first
		for bit in self.0.iter().rev() {
			ret <<= 1;
			ret |= u8::from(match bit {
				Ternary::True => true,
				Ternary::False => false,
				Ternary::Wild | Ternary::Capture(..) => {
					let this_bit = counter & 0b1 > 0;
					counter >>= 1;
					this_bit
				}
			});
		}

		ret
	}

	fn byte(byte: u8) -> Self {
		fn f(byte: u8, offset: usize) -> Ternary {
			if byte & (1 << offset) > 0 {
				Ternary::True
			} else {
				Ternary::False
			}
		}

		Self(std::array::from_fn(|index| f(byte, index)))
	}

	fn from_str(s: &str) -> Result<TernaryByte, String> {
		let mut ternary = Self::default();

		for (idx, ch) in s.chars().filter(|&ch| ch != '_').rev().enumerate() {
			*ternary
				.0
				.get_mut(idx)
				.ok_or_else(|| "too many digits".to_owned())? = match ch {
				'0' => Ternary::False,
				'1' => Ternary::True,
				'a'..='z' | 'A'..='Z' => Ternary::Capture(ch.try_into().unwrap()),
				'?' => Ternary::Wild,
				other => return Err(format!("invalid character {other:?} in pattern. only 0, 1, ?, alphabetic characters, and underscores are allowed"))
			}
		}

		Ok(ternary)
	}

	fn from_lit(lit: &Lit) -> Self {
		match lit {
			Lit::Int(lit) => Self::byte(lit.base10_parse().unwrap_or_abort()),
			Lit::Str(lit) => match Self::from_str(&lit.value()) {
				Ok(ternary) => ternary,
				Err(err) => abort!(lit.span(), err),
			},
			other => abort!(
				other.span(),
				"only string and integer literals are supported"
			),
		}
	}

	fn possibilities(self) -> impl Iterator<Item = u8> {
		struct Helper {
			ternary: TernaryByte,
			counter: u8,
		}

		impl Iterator for Helper {
			type Item = u8;

			fn next(&mut self) -> Option<u8> {
				self.counter = self.counter.checked_sub(1)?;
				Some(self.ternary.fill_with_counter(self.counter))
			}
		}

		let counter = 1 << self.0.into_iter().filter(|bit| bit.is_wild()).count();

		Helper {
			ternary: self,
			counter,
		}
	}
}

struct Visitor;

fn check_conflict(
	global_bytes: &HashMap<u8, Span>,
	bytes: &Bytes,
	pat_span: Span,
	conflict_number: &mut u64,
) {
	let mut was_conflict = false;
	for (conflict_sub_number, (&duplicate, &first_span)) in bytes
		.iter()
		.filter_map(|byte| global_bytes.get_key_value(byte))
		.enumerate()
	{
		was_conflict = true;
		emit_error!(
			first_span,
			format!("first possibility of 0b{duplicate:08b} here (conflict number {conflict_number}.{conflict_sub_number})"),
		);
		emit_error!(
			pat_span,
			format!("unreachable possibility 0b{duplicate:08b} here (conflict number {conflict_number}.{conflict_sub_number})")
		);
	}

	if was_conflict {
		*conflict_number += 1;
	}
}

fn rewrite_pattern(pat_span: Span, captures: &Captures, bytes: &Bytes) -> Pat {
	let possibilities = bytes.iter();
	if captures.is_empty() {
		Pat::Or(PatOr {
			attrs: vec![],
			leading_vert: None,
			cases: bytes
				.iter()
				.map(|byte| -> Pat { parse_quote!(#byte) })
				.collect(),
		})
	} else {
		parse_quote_spanned!(pat_span=> byte @ (#(#possibilities)|*))
	}
}

fn rewrite_body(old_body: &Expr, captures: &Captures) -> Expr {
	let captures = captures.iter().map(|(name, range)| {
		let ident = Ident::new(&name.to_string(), Span::call_site());
		let shift = range.start;
		let len = range.len();
		let mask = (1u8 << len) - 1; // `len` ones
		let shifted = if shift == 0 {
			quote!(byte)
		} else {
			quote!((byte >> #shift))
		};
		let masked = if mask == u8::MAX {
			shifted
		} else {
			quote!(#shifted & #mask)
		};
		quote!(let #ident: u8 = #masked;)
	});

	parse_quote!({
		#(#captures)*
		#old_body
	})
}

type Captures = HashMap<char, Range>;
type Bytes = HashSet<u8>;

fn get_captures_and_bytes(arm: &Arm) -> Option<(Captures, Bytes)> {
	let mut bytes = HashSet::new();

	let captures = match &arm.pat {
		Pat::Lit(pat) => match &*pat.expr {
			Expr::Lit(expr) => {
				let ternary = TernaryByte::from_lit(&expr.lit);
				// no need to check for overlapping here.
				bytes.extend(ternary.possibilities());
				ternary
					.captures()
					.unwrap_or_else(|err| abort!(expr.span(), err))
			}
			other => abort!(other.span(), "expected literal"),
		},
		Pat::Or(pat) => {
			let mut captures = None;

			for case in &pat.cases {
				match case {
					Pat::Lit(pat) => match &*pat.expr {
						Expr::Lit(expr) => {
							let ternary = TernaryByte::from_lit(&expr.lit);
							for possibility in ternary.possibilities() {
								if !bytes.insert(possibility) {
									abort!(expr.span(), format!("unreachable repetition here. the repeated possibility is 0b{possibility:08b}"));
								}
							}

							let this_captures = ternary.captures().unwrap_or_else(|err| abort!(expr.span(), err));

							if let Some(captures) = &captures {
								if captures != &this_captures {
									abort!(expr.span(), format!("disjoint captures. the captures of this expression ({this_captures:#?}) do not match the previously established ones ({captures:?})"));
								}
							}

							captures = Some(this_captures);
						}
						unary @ Expr::Unary(..) => abort!(unary.span(), "unary negation not allowed"),
						_ => unreachable!(),
					}
					supported_outer @ (Pat::Wild(..) | Pat::Or(..)) => abort!(supported_outer.span(), "this type of pattern is not supported at this level. expected only literals at this level"),
					other => abort!(other.span(), "this type of pattern is not supported. expected only literals at this level"),
				}
			}

			captures.unwrap()
		}
		Pat::Wild(..) => return None,
		other => abort!(
			other.span(),
			"this type of pattern is not supported. expected wildcard, or-pattern, or literal"
		),
	};

	Some((captures, bytes))
}

fn handle_arm(arm: &mut Arm, global_bytes: &mut HashMap<u8, Span>, conflict_number: &mut u64) {
	if let Some(guard) = &arm.guard {
		abort!(guard.0.span(), "guards not supported");
	}

	let (captures, mut bytes) = match get_captures_and_bytes(arm) {
		Some(ret) => ret,
		None => return,
	};

	let is_not = |attr: &&Attribute| attr.path.get_ident().map_or(false, |ident| ident == "not");
	for not in arm
		.attrs
		.iter()
		.filter(is_not)
		.map(|attr| attr.parse_args::<LitStr>().unwrap_or_abort())
	{
		let ternary = match TernaryByte::from_str(&not.value()) {
			Ok(ternary) => ternary,
			Err(error) => abort!(not.span(), error),
		};

		for possibility in ternary.possibilities() {
			if !bytes.remove(&possibility) {
				emit_error!(
					not.span(),
					format!("0b{possibility:08b} not present in initial pattern")
				);
			}
		}
	}
	arm.attrs.retain(|attr| !is_not(&attr));

	let pat_span = arm.pat.span();

	arm.pat = rewrite_pattern(pat_span, &captures, &bytes);
	*arm.body = rewrite_body(&arm.body, &captures);

	check_conflict(global_bytes, &bytes, pat_span, conflict_number);
	// don't overwrite existing spans, since we want the spans to hold the *first* possibility.
	bytes.retain(|&byte| !global_bytes.contains_key(&byte));
	global_bytes.extend(bytes.into_iter().map(|byte| (byte, pat_span)));
}

impl VisitMut for Visitor {
	fn visit_expr_match_mut(&mut self, expr: &mut ExprMatch) {
		match expr.attrs.iter().position(|attr| {
			attr
				.path
				.get_ident()
				.map_or(false, |ident| ident == "byte_pattern")
		}) {
			Some(position) => {
				expr.attrs.remove(position);
			}
			None => return,
		}

		let mut global_bytes: HashMap<u8, Span> = HashMap::new();
		let mut conflict_number = 1; // for easy matching of conflicts

		for arm in &mut expr.arms {
			handle_arm(arm, &mut global_bytes, &mut conflict_number);
		}
	}
}

#[proc_macro_error]
#[proc_macro_attribute]
pub fn byte_pattern(
	attr: proc_macro::TokenStream,
	item: proc_macro::TokenStream,
) -> proc_macro::TokenStream {
	if let Some(garbage) = attr.into_iter().next() {
		abort!(garbage.span(), "garbage after attribute");
	}

	let item = syn::parse_macro_input!(item as Item);

	let mut item = match item {
		Item::Fn(item) => item,
		other => abort!(
			other.span(),
			"this attribute can only be placed on functions"
		),
	};

	Visitor.visit_item_fn_mut(&mut item);

	item.into_token_stream().into()
}
