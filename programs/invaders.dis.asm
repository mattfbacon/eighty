0000 | Nop
0001 | Nop
0002 | Nop
0003 | Jump(Unconditional, 18d4)
0006 | Nop
0007 | Nop
0008 | Push(FlagsA)
0009 | Push(Bc)
000a | Push(De)
000b | Push(Hl)
000c | Jump(Unconditional, 008c)
000f | Nop
0010 | Push(FlagsA)
0011 | Push(Bc)
0012 | Push(De)
0013 | Push(Hl)
0014 | LoadImmediate(A, 0080)
0016 | DirectAddress(StoreAccumulator, 2072)
0019 | LoadLargeImmediate(Hl, 20c0)
001c | Decrement(MemoryRef)
001d | Call(Unconditional, 17cd)
0020 | In(0001)
0022 | RotateAccumulator(Right)
0023 | Jump(Carry, 0067)
0026 | DirectAddress(LoadAccumulator, 20ea)
0029 | ToAccumulator(And, A)
002a | Jump(Zero, 0042)
002d | DirectAddress(LoadAccumulator, 20eb)
0030 | ToAccumulatorImmediate(Compare, 0099)
0032 | Jump(Zero, 003e)
0035 | ToAccumulatorImmediate(Add, 0001)
0037 | DecimalAdjustAccumulator
0038 | DirectAddress(StoreAccumulator, 20eb)
003b | Call(Unconditional, 1947)
003e | ToAccumulator(Xor, A)
003f | DirectAddress(StoreAccumulator, 20ea)
0042 | DirectAddress(LoadAccumulator, 20e9)
0045 | ToAccumulator(And, A)
0046 | Jump(Zero, 0082)
0049 | DirectAddress(LoadAccumulator, 20ef)
004c | ToAccumulator(And, A)
004d | Jump(NonZero, 006f)
0050 | DirectAddress(LoadAccumulator, 20eb)
0053 | ToAccumulator(And, A)
0054 | Jump(NonZero, 005d)
0057 | Call(Unconditional, 0abf)
005a | Jump(Unconditional, 0082)
005d | DirectAddress(LoadAccumulator, 2093)
0060 | ToAccumulator(And, A)
0061 | Jump(NonZero, 0082)
0064 | Jump(Unconditional, 0765)
0067 | LoadImmediate(A, 0001)
0069 | DirectAddress(StoreAccumulator, 20ea)
006c | Jump(Unconditional, 003f)
006f | Call(Unconditional, 1740)
0072 | DirectAddress(LoadAccumulator, 2032)
0075 | DirectAddress(StoreAccumulator, 2080)
0078 | Call(Unconditional, 0100)
007b | Call(Unconditional, 0248)
007e | Call(Unconditional, 0913)
0081 | Nop
0082 | Pop(Hl)
0083 | Pop(De)
0084 | Pop(Bc)
0085 | Pop(FlagsA)
0086 | EnableInterrupts
0087 | ReturnFromSubroutine(Unconditional)
0088 | Nop
0089 | Nop
008a | Nop
008b | Nop
008c | ToAccumulator(Xor, A)
008d | DirectAddress(StoreAccumulator, 2072)
0090 | DirectAddress(LoadAccumulator, 20e9)
0093 | ToAccumulator(And, A)
0094 | Jump(Zero, 0082)
0097 | DirectAddress(LoadAccumulator, 20ef)
009a | ToAccumulator(And, A)
009b | Jump(NonZero, 00a5)
009e | DirectAddress(LoadAccumulator, 20c1)
00a1 | RotateAccumulator(Right)
00a2 | Jump(NoCarry, 0082)
00a5 | LoadLargeImmediate(Hl, 2020)
00a8 | Call(Unconditional, 024b)
00ab | Call(Unconditional, 0141)
00ae | Jump(Unconditional, 0082)
00b1 | Call(Unconditional, 0886)
00b4 | Push(Hl)
00b5 | Move { destination: A, source: MemoryRef }
00b6 | IncrementPair(Hl)
00b7 | Move { destination: H, source: MemoryRef }
00b8 | Move { destination: L, source: A }
00b9 | DirectAddress(StoreHl, 2009)
00bc | DirectAddress(StoreHl, 200b)
00bf | Pop(Hl)
00c0 | DecrementPair(Hl)
00c1 | Move { destination: A, source: MemoryRef }
00c2 | ToAccumulatorImmediate(Compare, 0003)
00c4 | Jump(NonZero, 00c8)
00c7 | Decrement(A)
00c8 | DirectAddress(StoreAccumulator, 2008)
00cb | ToAccumulatorImmediate(Compare, 00fe)
00cd | LoadImmediate(A, 0000)
00cf | Jump(NonZero, 00d3)
00d2 | Increment(A)
00d3 | DirectAddress(StoreAccumulator, 200d)
00d6 | ReturnFromSubroutine(Unconditional)
00d7 | LoadImmediate(A, 0002)
00d9 | DirectAddress(StoreAccumulator, 21fb)
00dc | DirectAddress(StoreAccumulator, 22fb)
00df | Jump(Unconditional, 08e4)
00e2 | Nop
00e3 | Nop
00e4 | Nop
00e5 | Nop
00e6 | Nop
00e7 | Nop
00e8 | Nop
00e9 | Nop
00ea | Nop
00eb | Nop
00ec | Nop
00ed | Nop
00ee | Nop
00ef | Nop
00f0 | Nop
00f1 | Nop
00f2 | Nop
00f3 | Nop
00f4 | Nop
00f5 | Nop
00f6 | Nop
00f7 | Nop
00f8 | Nop
00f9 | Nop
00fa | Nop
00fb | Nop
00fc | Nop
00fd | Nop
00fe | Nop
00ff | Nop
0100 | LoadLargeImmediate(Hl, 2002)
0103 | Move { destination: A, source: MemoryRef }
0104 | ToAccumulator(And, A)
0105 | Jump(NonZero, 1538)
0108 | Push(Hl)
0109 | DirectAddress(LoadAccumulator, 2006)
010c | Move { destination: L, source: A }
010d | DirectAddress(LoadAccumulator, 2067)
0110 | Move { destination: H, source: A }
0111 | Move { destination: A, source: MemoryRef }
0112 | ToAccumulator(And, A)
0113 | Pop(Hl)
0114 | Jump(Zero, 0136)
0117 | IncrementPair(Hl)
0118 | IncrementPair(Hl)
0119 | Move { destination: A, source: MemoryRef }
011a | IncrementPair(Hl)
011b | Move { destination: B, source: MemoryRef }
011c | ToAccumulatorImmediate(And, 00fe)
011e | RotateAccumulator(Left)
011f | RotateAccumulator(Left)
0120 | RotateAccumulator(Left)
0121 | Move { destination: E, source: A }
0122 | LoadImmediate(D, 0000)
0124 | LoadLargeImmediate(Hl, 1c00)
0127 | AddToHl(De)
0128 | ExchangeRegisters
0129 | Move { destination: A, source: B }
012a | ToAccumulator(And, A)
012b | Call(NonZero, 013b)
012e | DirectAddress(LoadHl, 200b)
0131 | LoadImmediate(B, 0010)
0133 | Call(Unconditional, 15d3)
0136 | ToAccumulator(Xor, A)
0137 | DirectAddress(StoreAccumulator, 2000)
013a | ReturnFromSubroutine(Unconditional)
013b | LoadLargeImmediate(Hl, 0030)
013e | AddToHl(De)
013f | ExchangeRegisters
0140 | ReturnFromSubroutine(Unconditional)
0141 | DirectAddress(LoadAccumulator, 2068)
0144 | ToAccumulator(And, A)
0145 | ReturnFromSubroutine(Zero)
0146 | DirectAddress(LoadAccumulator, 2000)
0149 | ToAccumulator(And, A)
014a | ReturnFromSubroutine(NonZero)
014b | DirectAddress(LoadAccumulator, 2067)
014e | Move { destination: H, source: A }
014f | DirectAddress(LoadAccumulator, 2006)
0152 | LoadImmediate(D, 0002)
0154 | Increment(A)
0155 | ToAccumulatorImmediate(Compare, 0037)
0157 | Call(Zero, 01a1)
015a | Move { destination: L, source: A }
015b | Move { destination: B, source: MemoryRef }
015c | Decrement(B)
015d | Jump(NonZero, 0154)
0160 | DirectAddress(StoreAccumulator, 2006)
0163 | Call(Unconditional, 017a)
0166 | Move { destination: H, source: C }
0167 | DirectAddress(StoreHl, 200b)
016a | Move { destination: A, source: L }
016b | ToAccumulatorImmediate(Compare, 0028)
016d | Jump(Carry, 1971)
0170 | Move { destination: A, source: D }
0171 | DirectAddress(StoreAccumulator, 2004)
0174 | LoadImmediate(A, 0001)
0176 | DirectAddress(StoreAccumulator, 2000)
0179 | ReturnFromSubroutine(Unconditional)
017a | LoadImmediate(D, 0000)
017c | Move { destination: A, source: L }
017d | LoadLargeImmediate(Hl, 2009)
0180 | Move { destination: B, source: MemoryRef }
0181 | IncrementPair(Hl)
0182 | Move { destination: C, source: MemoryRef }
0183 | ToAccumulatorImmediate(Compare, 000b)
0185 | Jump(Minus, 0194)
0188 | ToAccumulatorImmediate(SubtractWithBorrow, 000b)
018a | Move { destination: E, source: A }
018b | Move { destination: A, source: B }
018c | ToAccumulatorImmediate(Add, 0010)
018e | Move { destination: B, source: A }
018f | Move { destination: A, source: E }
0190 | Increment(D)
0191 | Jump(Unconditional, 0183)
0194 | Move { destination: L, source: B }
0195 | ToAccumulator(And, A)
0196 | ReturnFromSubroutine(Zero)
0197 | Move { destination: E, source: A }
0198 | Move { destination: A, source: C }
0199 | ToAccumulatorImmediate(Add, 0010)
019b | Move { destination: C, source: A }
019c | Move { destination: A, source: E }
019d | Decrement(A)
019e | Jump(Unconditional, 0195)
01a1 | Decrement(D)
01a2 | Jump(Zero, 01cd)
01a5 | LoadLargeImmediate(Hl, 2006)
01a8 | LoadImmediate(MemoryRef, 0000)
01aa | IncrementPair(Hl)
01ab | Move { destination: C, source: MemoryRef }
01ac | LoadImmediate(MemoryRef, 0000)
01ae | Call(Unconditional, 01d9)
01b1 | LoadLargeImmediate(Hl, 2005)
01b4 | Move { destination: A, source: MemoryRef }
01b5 | Increment(A)
01b6 | ToAccumulatorImmediate(And, 0001)
01b8 | Move { destination: MemoryRef, source: A }
01b9 | ToAccumulator(Xor, A)
01ba | LoadLargeImmediate(Hl, 2067)
01bd | Move { destination: H, source: MemoryRef }
01be | ReturnFromSubroutine(Unconditional)
01bf | Nop
01c0 | LoadLargeImmediate(Hl, 2100)
01c3 | LoadImmediate(B, 0037)
01c5 | LoadImmediate(MemoryRef, 0001)
01c7 | IncrementPair(Hl)
01c8 | Decrement(B)
01c9 | Jump(NonZero, 01c5)
01cc | ReturnFromSubroutine(Unconditional)
01cd | Pop(Hl)
01ce | ReturnFromSubroutine(Unconditional)
01cf | LoadImmediate(A, 0001)
01d1 | LoadImmediate(B, 00e0)
01d3 | LoadLargeImmediate(Hl, 2402)
01d6 | Jump(Unconditional, 14cc)
01d9 | IncrementPair(Hl)
01da | Move { destination: B, source: MemoryRef }
01db | IncrementPair(Hl)
01dc | Move { destination: A, source: C }
01dd | ToAccumulator(Add, MemoryRef)
01de | Move { destination: MemoryRef, source: A }
01df | IncrementPair(Hl)
01e0 | Move { destination: A, source: B }
01e1 | ToAccumulator(Add, MemoryRef)
01e2 | Move { destination: MemoryRef, source: A }
01e3 | ReturnFromSubroutine(Unconditional)
01e4 | LoadImmediate(B, 00c0)
01e6 | LoadLargeImmediate(De, 1b00)
01e9 | LoadLargeImmediate(Hl, 2000)
01ec | Jump(Unconditional, 1a32)
01ef | LoadLargeImmediate(Hl, 2142)
01f2 | Jump(Unconditional, 01f8)
01f5 | LoadLargeImmediate(Hl, 2242)
01f8 | LoadImmediate(C, 0004)
01fa | LoadLargeImmediate(De, 1d20)
01fd | Push(De)
01fe | LoadImmediate(B, 002c)
0200 | Call(Unconditional, 1a32)
0203 | Pop(De)
0204 | Decrement(C)
0205 | Jump(NonZero, 01fd)
0208 | ReturnFromSubroutine(Unconditional)
0209 | LoadImmediate(A, 0001)
020b | Jump(Unconditional, 021b)
020e | LoadImmediate(A, 0001)
0210 | Jump(Unconditional, 0214)
0213 | ToAccumulator(Xor, A)
0214 | LoadLargeImmediate(De, 2242)
0217 | Jump(Unconditional, 021e)
021a | ToAccumulator(Xor, A)
021b | LoadLargeImmediate(De, 2142)
021e | DirectAddress(StoreAccumulator, 2081)
0221 | LoadLargeImmediate(Bc, 1602)
0224 | LoadLargeImmediate(Hl, 2806)
0227 | LoadImmediate(A, 0004)
0229 | Push(FlagsA)
022a | Push(Bc)
022b | DirectAddress(LoadAccumulator, 2081)
022e | ToAccumulator(And, A)
022f | Jump(NonZero, 0242)
0232 | Call(Unconditional, 1a69)
0235 | Pop(Bc)
0236 | Pop(FlagsA)
0237 | Decrement(A)
0238 | ReturnFromSubroutine(Zero)
0239 | Push(De)
023a | LoadLargeImmediate(De, 02e0)
023d | AddToHl(De)
023e | Pop(De)
023f | Jump(Unconditional, 0229)
0242 | Call(Unconditional, 147c)
0245 | Jump(Unconditional, 0235)
0248 | LoadLargeImmediate(Hl, 2010)
024b | Move { destination: A, source: MemoryRef }
024c | ToAccumulatorImmediate(Compare, 00ff)
024e | ReturnFromSubroutine(Zero)
024f | ToAccumulatorImmediate(Compare, 00fe)
0251 | Jump(Zero, 0281)
0254 | IncrementPair(Hl)
0255 | Move { destination: B, source: MemoryRef }
0256 | Move { destination: C, source: A }
0257 | ToAccumulator(Or, B)
0258 | Move { destination: A, source: C }
0259 | Jump(NonZero, 0277)
025c | IncrementPair(Hl)
025d | Move { destination: A, source: MemoryRef }
025e | ToAccumulator(And, A)
025f | Jump(NonZero, 0288)
0262 | IncrementPair(Hl)
0263 | Move { destination: E, source: MemoryRef }
0264 | IncrementPair(Hl)
0265 | Move { destination: D, source: MemoryRef }
0266 | Push(Hl)
0267 | ExchangeRegisters
0268 | Push(Hl)
0269 | LoadLargeImmediate(Hl, 026f)
026c | ExchangeStack
026d | Push(De)
026e | LoadProgramCounter
026f | Pop(Hl)
0270 | LoadLargeImmediate(De, 000c)
0273 | AddToHl(De)
0274 | Jump(Unconditional, 024b)
0277 | Decrement(B)
0278 | Increment(B)
0279 | Jump(NonZero, 027d)
027c | Decrement(A)
027d | Decrement(B)
027e | Move { destination: MemoryRef, source: B }
027f | DecrementPair(Hl)
0280 | Move { destination: MemoryRef, source: A }
0281 | LoadLargeImmediate(De, 0010)
0284 | AddToHl(De)
0285 | Jump(Unconditional, 024b)
0288 | Decrement(MemoryRef)
0289 | DecrementPair(Hl)
028a | DecrementPair(Hl)
028b | Jump(Unconditional, 0281)
028e | Pop(Hl)
028f | IncrementPair(Hl)
0290 | Move { destination: A, source: MemoryRef }
0291 | ToAccumulatorImmediate(Compare, 00ff)
0293 | Jump(Zero, 033b)
0296 | IncrementPair(Hl)
0297 | Decrement(MemoryRef)
0298 | ReturnFromSubroutine(NonZero)
0299 | Move { destination: B, source: A }
029a | ToAccumulator(Xor, A)
029b | DirectAddress(StoreAccumulator, 2068)
029e | DirectAddress(StoreAccumulator, 2069)
02a1 | LoadImmediate(A, 0030)
02a3 | DirectAddress(StoreAccumulator, 206a)
02a6 | Move { destination: A, source: B }
02a7 | LoadImmediate(MemoryRef, 0005)
02a9 | IncrementPair(Hl)
02aa | Decrement(MemoryRef)
02ab | Jump(NonZero, 039b)
02ae | DirectAddress(LoadHl, 201a)
02b1 | LoadImmediate(B, 0010)
02b3 | Call(Unconditional, 1424)
02b6 | LoadLargeImmediate(Hl, 2010)
02b9 | LoadLargeImmediate(De, 1b10)
02bc | LoadImmediate(B, 0010)
02be | Call(Unconditional, 1a32)
02c1 | LoadImmediate(B, 0000)
02c3 | Call(Unconditional, 19dc)
02c6 | DirectAddress(LoadAccumulator, 206d)
02c9 | ToAccumulator(And, A)
02ca | ReturnFromSubroutine(NonZero)
02cb | DirectAddress(LoadAccumulator, 20ef)
02ce | ToAccumulator(And, A)
02cf | ReturnFromSubroutine(Zero)
02d0 | LoadLargeImmediate(Sp, 2400)
02d3 | EnableInterrupts
02d4 | Call(Unconditional, 19d7)
02d7 | Call(Unconditional, 092e)
02da | ToAccumulator(And, A)
02db | Jump(Zero, 166d)
02de | Call(Unconditional, 18e7)
02e1 | Move { destination: A, source: MemoryRef }
02e2 | ToAccumulator(And, A)
02e3 | Jump(Zero, 032c)
02e6 | DirectAddress(LoadAccumulator, 20ce)
02e9 | ToAccumulator(And, A)
02ea | Jump(Zero, 032c)
02ed | DirectAddress(LoadAccumulator, 2067)
02f0 | Push(FlagsA)
02f1 | RotateAccumulator(Right)
02f2 | Jump(Carry, 0332)
02f5 | Call(Unconditional, 020e)
02f8 | Call(Unconditional, 0878)
02fb | Move { destination: MemoryRef, source: E }
02fc | IncrementPair(Hl)
02fd | Move { destination: MemoryRef, source: D }
02fe | DecrementPair(Hl)
02ff | DecrementPair(Hl)
0300 | Move { destination: MemoryRef, source: B }
0301 | Nop
0302 | Call(Unconditional, 01e4)
0305 | Pop(FlagsA)
0306 | RotateAccumulator(Right)
0307 | LoadImmediate(A, 0021)
0309 | LoadImmediate(B, 0000)
030b | Jump(NoCarry, 0312)
030e | LoadImmediate(B, 0020)
0310 | LoadImmediate(A, 0022)
0312 | DirectAddress(StoreAccumulator, 2067)
0315 | Call(Unconditional, 0ab6)
0318 | ToAccumulator(Xor, A)
0319 | DirectAddress(StoreAccumulator, 2011)
031c | Move { destination: A, source: B }
031d | Out(0005)
031f | Increment(A)
0320 | DirectAddress(StoreAccumulator, 2098)
0323 | Call(Unconditional, 09d6)
0326 | Call(Unconditional, 1a7f)
0329 | Jump(Unconditional, 07f9)
032c | Call(Unconditional, 1a7f)
032f | Jump(Unconditional, 0817)
0332 | Call(Unconditional, 0209)
0335 | Jump(Unconditional, 02f8)
0338 | Nop
0339 | Nop
033a | Nop
033b | LoadLargeImmediate(Hl, 2068)
033e | LoadImmediate(MemoryRef, 0001)
0340 | IncrementPair(Hl)
0341 | Move { destination: A, source: MemoryRef }
0342 | ToAccumulator(And, A)
0343 | Jump(Unconditional, 03b0)
0346 | Nop
0347 | DecrementPair(Hl)
0348 | LoadImmediate(MemoryRef, 0001)
034a | DirectAddress(LoadAccumulator, 201b)
034d | Move { destination: B, source: A }
034e | DirectAddress(LoadAccumulator, 20ef)
0351 | ToAccumulator(And, A)
0352 | Jump(NonZero, 0363)
0355 | DirectAddress(LoadAccumulator, 201d)
0358 | RotateAccumulator(Right)
0359 | Jump(Carry, 0381)
035c | RotateAccumulator(Right)
035d | Jump(Carry, 038e)
0360 | Jump(Unconditional, 036f)
0363 | Call(Unconditional, 17c0)
0366 | RotateAccumulator(Left)
0367 | RotateAccumulator(Left)
0368 | Jump(Carry, 0381)
036b | RotateAccumulator(Left)
036c | Jump(Carry, 038e)
036f | LoadLargeImmediate(Hl, 2018)
0372 | Call(Unconditional, 1a3b)
0375 | Call(Unconditional, 1a47)
0378 | Call(Unconditional, 1439)
037b | LoadImmediate(A, 0000)
037d | DirectAddress(StoreAccumulator, 2012)
0380 | ReturnFromSubroutine(Unconditional)
0381 | Move { destination: A, source: B }
0382 | ToAccumulatorImmediate(Compare, 00d9)
0384 | Jump(Zero, 036f)
0387 | Increment(A)
0388 | DirectAddress(StoreAccumulator, 201b)
038b | Jump(Unconditional, 036f)
038e | Move { destination: A, source: B }
038f | ToAccumulatorImmediate(Compare, 0030)
0391 | Jump(Zero, 036f)
0394 | Decrement(A)
0395 | DirectAddress(StoreAccumulator, 201b)
0398 | Jump(Unconditional, 036f)
039b | Increment(A)
039c | ToAccumulatorImmediate(And, 0001)
039e | DirectAddress(StoreAccumulator, 2015)
03a1 | RotateAccumulator(Left)
03a2 | RotateAccumulator(Left)
03a3 | RotateAccumulator(Left)
03a4 | RotateAccumulator(Left)
03a5 | LoadLargeImmediate(Hl, 1c70)
03a8 | ToAccumulator(Add, L)
03a9 | Move { destination: L, source: A }
03aa | DirectAddress(StoreHl, 2018)
03ad | Jump(Unconditional, 036f)
03b0 | Jump(NonZero, 034a)
03b3 | IncrementPair(Hl)
03b4 | Decrement(MemoryRef)
03b5 | Jump(NonZero, 034a)
03b8 | Jump(Unconditional, 0346)
03bb | LoadLargeImmediate(De, 202a)
03be | Call(Unconditional, 1a06)
03c1 | Pop(Hl)
03c2 | ReturnFromSubroutine(NoCarry)
03c3 | IncrementPair(Hl)
03c4 | Move { destination: A, source: MemoryRef }
03c5 | ToAccumulator(And, A)
03c6 | ReturnFromSubroutine(Zero)
03c7 | ToAccumulatorImmediate(Compare, 0001)
03c9 | Jump(Zero, 03fa)
03cc | ToAccumulatorImmediate(Compare, 0002)
03ce | Jump(Zero, 040a)
03d1 | IncrementPair(Hl)
03d2 | ToAccumulatorImmediate(Compare, 0003)
03d4 | Jump(NonZero, 042a)
03d7 | Decrement(MemoryRef)
03d8 | Jump(Zero, 0436)
03db | Move { destination: A, source: MemoryRef }
03dc | ToAccumulatorImmediate(Compare, 000f)
03de | ReturnFromSubroutine(NonZero)
03df | Push(Hl)
03e0 | Call(Unconditional, 0430)
03e3 | Call(Unconditional, 1452)
03e6 | Pop(Hl)
03e7 | IncrementPair(Hl)
03e8 | Increment(MemoryRef)
03e9 | IncrementPair(Hl)
03ea | IncrementPair(Hl)
03eb | Decrement(MemoryRef)
03ec | Decrement(MemoryRef)
03ed | IncrementPair(Hl)
03ee | Decrement(MemoryRef)
03ef | Decrement(MemoryRef)
03f0 | Decrement(MemoryRef)
03f1 | IncrementPair(Hl)
03f2 | LoadImmediate(MemoryRef, 0008)
03f4 | Call(Unconditional, 0430)
03f7 | Jump(Unconditional, 1400)
03fa | Increment(A)
03fb | Move { destination: MemoryRef, source: A }
03fc | DirectAddress(LoadAccumulator, 201b)
03ff | ToAccumulatorImmediate(Add, 0008)
0401 | DirectAddress(StoreAccumulator, 202a)
0404 | Call(Unconditional, 0430)
0407 | Jump(Unconditional, 1400)
040a | Call(Unconditional, 0430)
040d | Push(De)
040e | Push(Hl)
040f | Push(Bc)
0410 | Call(Unconditional, 1452)
0413 | Pop(Bc)
0414 | Pop(Hl)
0415 | Pop(De)
0416 | DirectAddress(LoadAccumulator, 202c)
0419 | ToAccumulator(Add, L)
041a | Move { destination: L, source: A }
041b | DirectAddress(StoreAccumulator, 2029)
041e | Call(Unconditional, 1491)
0421 | DirectAddress(LoadAccumulator, 2061)
0424 | ToAccumulator(And, A)
0425 | ReturnFromSubroutine(Zero)
0426 | DirectAddress(StoreAccumulator, 2002)
0429 | ReturnFromSubroutine(Unconditional)
042a | ToAccumulatorImmediate(Compare, 0005)
042c | ReturnFromSubroutine(Zero)
042d | Jump(Unconditional, 0436)
0430 | LoadLargeImmediate(Hl, 2027)
0433 | Jump(Unconditional, 1a3b)
0436 | Call(Unconditional, 0430)
0439 | Call(Unconditional, 1452)
043c | LoadLargeImmediate(Hl, 2025)
043f | LoadLargeImmediate(De, 1b25)
0442 | LoadImmediate(B, 0007)
0444 | Call(Unconditional, 1a32)
0447 | DirectAddress(LoadHl, 208d)
044a | Increment(L)
044b | Move { destination: A, source: L }
044c | ToAccumulatorImmediate(Compare, 0063)
044e | Jump(Carry, 0453)
0451 | LoadImmediate(L, 0054)
0453 | DirectAddress(StoreHl, 208d)
0456 | DirectAddress(LoadHl, 208f)
0459 | Increment(L)
045a | DirectAddress(StoreHl, 208f)
045d | DirectAddress(LoadAccumulator, 2084)
0460 | ToAccumulator(And, A)
0461 | ReturnFromSubroutine(NonZero)
0462 | Move { destination: A, source: MemoryRef }
0463 | ToAccumulatorImmediate(And, 0001)
0465 | LoadLargeImmediate(Bc, 0229)
0468 | Jump(NonZero, 046e)
046b | LoadLargeImmediate(Bc, fee0)
046e | LoadLargeImmediate(Hl, 208a)
0471 | Move { destination: MemoryRef, source: C }
0472 | IncrementPair(Hl)
0473 | IncrementPair(Hl)
0474 | Move { destination: MemoryRef, source: B }
0475 | ReturnFromSubroutine(Unconditional)
0476 | Pop(Hl)
0477 | DirectAddress(LoadAccumulator, 1b32)
047a | DirectAddress(StoreAccumulator, 2032)
047d | DirectAddress(LoadHl, 2038)
0480 | Move { destination: A, source: L }
0481 | ToAccumulator(Or, H)
0482 | Jump(NonZero, 048a)
0485 | DecrementPair(Hl)
0486 | DirectAddress(StoreHl, 2038)
0489 | ReturnFromSubroutine(Unconditional)
048a | LoadLargeImmediate(De, 2035)
048d | LoadImmediate(A, 00f9)
048f | Call(Unconditional, 0550)
0492 | DirectAddress(LoadAccumulator, 2046)
0495 | DirectAddress(StoreAccumulator, 2070)
0498 | DirectAddress(LoadAccumulator, 2056)
049b | DirectAddress(StoreAccumulator, 2071)
049e | Call(Unconditional, 0563)
04a1 | DirectAddress(LoadAccumulator, 2078)
04a4 | ToAccumulator(And, A)
04a5 | LoadLargeImmediate(Hl, 2035)
04a8 | Jump(NonZero, 055b)
04ab | LoadLargeImmediate(De, 1b30)
04ae | LoadLargeImmediate(Hl, 2030)
04b1 | LoadImmediate(B, 0010)
04b3 | Jump(Unconditional, 1a32)
04b6 | Pop(Hl)
04b7 | DirectAddress(LoadAccumulator, 206e)
04ba | ToAccumulator(And, A)
04bb | ReturnFromSubroutine(NonZero)
04bc | DirectAddress(LoadAccumulator, 2080)
04bf | ToAccumulatorImmediate(Compare, 0001)
04c1 | ReturnFromSubroutine(NonZero)
04c2 | LoadLargeImmediate(De, 2045)
04c5 | LoadImmediate(A, 00ed)
04c7 | Call(Unconditional, 0550)
04ca | DirectAddress(LoadAccumulator, 2036)
04cd | DirectAddress(StoreAccumulator, 2070)
04d0 | DirectAddress(LoadAccumulator, 2056)
04d3 | DirectAddress(StoreAccumulator, 2071)
04d6 | Call(Unconditional, 0563)
04d9 | DirectAddress(LoadAccumulator, 2076)
04dc | ToAccumulatorImmediate(Compare, 0010)
04de | Jump(Carry, 04e7)
04e1 | DirectAddress(LoadAccumulator, 1b48)
04e4 | DirectAddress(StoreAccumulator, 2076)
04e7 | DirectAddress(LoadAccumulator, 2078)
04ea | ToAccumulator(And, A)
04eb | LoadLargeImmediate(Hl, 2045)
04ee | Jump(NonZero, 055b)
04f1 | LoadLargeImmediate(De, 1b40)
04f4 | LoadLargeImmediate(Hl, 2040)
04f7 | LoadImmediate(B, 0010)
04f9 | Call(Unconditional, 1a32)
04fc | DirectAddress(LoadAccumulator, 2082)
04ff | Decrement(A)
0500 | Jump(NonZero, 0508)
0503 | LoadImmediate(A, 0001)
0505 | DirectAddress(StoreAccumulator, 206e)
0508 | DirectAddress(LoadHl, 2076)
050b | Jump(Unconditional, 067e)
050e | Pop(Hl)
050f | LoadLargeImmediate(De, 2055)
0512 | LoadImmediate(A, 00db)
0514 | Call(Unconditional, 0550)
0517 | DirectAddress(LoadAccumulator, 2046)
051a | DirectAddress(StoreAccumulator, 2070)
051d | DirectAddress(LoadAccumulator, 2036)
0520 | DirectAddress(StoreAccumulator, 2071)
0523 | Call(Unconditional, 0563)
0526 | DirectAddress(LoadAccumulator, 2076)
0529 | ToAccumulatorImmediate(Compare, 0015)
052b | Jump(Carry, 0534)
052e | DirectAddress(LoadAccumulator, 1b58)
0531 | DirectAddress(StoreAccumulator, 2076)
0534 | DirectAddress(LoadAccumulator, 2078)
0537 | ToAccumulator(And, A)
0538 | LoadLargeImmediate(Hl, 2055)
053b | Jump(NonZero, 055b)
053e | LoadLargeImmediate(De, 1b50)
0541 | LoadLargeImmediate(Hl, 2050)
0544 | LoadImmediate(B, 0010)
0546 | Call(Unconditional, 1a32)
0549 | DirectAddress(LoadHl, 2076)
054c | DirectAddress(StoreHl, 2058)
054f | ReturnFromSubroutine(Unconditional)
0550 | DirectAddress(StoreAccumulator, 207f)
0553 | LoadLargeImmediate(Hl, 2073)
0556 | LoadImmediate(B, 000b)
0558 | Jump(Unconditional, 1a32)
055b | LoadLargeImmediate(De, 2073)
055e | LoadImmediate(B, 000b)
0560 | Jump(Unconditional, 1a32)
0563 | LoadLargeImmediate(Hl, 2073)
0566 | Move { destination: A, source: MemoryRef }
0567 | ToAccumulatorImmediate(And, 0080)
0569 | Jump(NonZero, 05c1)
056c | DirectAddress(LoadAccumulator, 20c1)
056f | ToAccumulatorImmediate(Compare, 0004)
0571 | DirectAddress(LoadAccumulator, 2069)
0574 | Jump(Zero, 05b7)
0577 | ToAccumulator(And, A)
0578 | ReturnFromSubroutine(Zero)
0579 | IncrementPair(Hl)
057a | LoadImmediate(MemoryRef, 0000)
057c | DirectAddress(LoadAccumulator, 2070)
057f | ToAccumulator(And, A)
0580 | Jump(Zero, 0589)
0583 | Move { destination: B, source: A }
0584 | DirectAddress(LoadAccumulator, 20cf)
0587 | ToAccumulator(Compare, B)
0588 | ReturnFromSubroutine(NoCarry)
0589 | DirectAddress(LoadAccumulator, 2071)
058c | ToAccumulator(And, A)
058d | Jump(Zero, 0596)
0590 | Move { destination: B, source: A }
0591 | DirectAddress(LoadAccumulator, 20cf)
0594 | ToAccumulator(Compare, B)
0595 | ReturnFromSubroutine(NoCarry)
0596 | IncrementPair(Hl)
0597 | Move { destination: A, source: MemoryRef }
0598 | ToAccumulator(And, A)
0599 | Jump(Zero, 061b)
059c | DirectAddress(LoadHl, 2076)
059f | Move { destination: C, source: MemoryRef }
05a0 | IncrementPair(Hl)
05a1 | Nop
05a2 | DirectAddress(StoreHl, 2076)
05a5 | Call(Unconditional, 062f)
05a8 | ReturnFromSubroutine(NoCarry)
05a9 | Call(Unconditional, 017a)
05ac | Move { destination: A, source: C }
05ad | ToAccumulatorImmediate(Add, 0007)
05af | Move { destination: H, source: A }
05b0 | Move { destination: A, source: L }
05b1 | ToAccumulatorImmediate(Subtract, 000a)
05b3 | Move { destination: L, source: A }
05b4 | DirectAddress(StoreHl, 207b)
05b7 | LoadLargeImmediate(Hl, 2073)
05ba | Move { destination: A, source: MemoryRef }
05bb | ToAccumulatorImmediate(Or, 0080)
05bd | Move { destination: MemoryRef, source: A }
05be | IncrementPair(Hl)
05bf | Increment(MemoryRef)
05c0 | ReturnFromSubroutine(Unconditional)
05c1 | LoadLargeImmediate(De, 207c)
05c4 | Call(Unconditional, 1a06)
05c7 | ReturnFromSubroutine(NoCarry)
05c8 | IncrementPair(Hl)
05c9 | Move { destination: A, source: MemoryRef }
05ca | ToAccumulatorImmediate(And, 0001)
05cc | Jump(NonZero, 0644)
05cf | IncrementPair(Hl)
05d0 | Increment(MemoryRef)
05d1 | Call(Unconditional, 0675)
05d4 | DirectAddress(LoadAccumulator, 2079)
05d7 | ToAccumulatorImmediate(Add, 0003)
05d9 | LoadLargeImmediate(Hl, 207f)
05dc | ToAccumulator(Compare, MemoryRef)
05dd | Jump(Carry, 05e2)
05e0 | ToAccumulatorImmediate(Subtract, 000c)
05e2 | DirectAddress(StoreAccumulator, 2079)
05e5 | DirectAddress(LoadAccumulator, 207b)
05e8 | Move { destination: B, source: A }
05e9 | DirectAddress(LoadAccumulator, 207e)
05ec | ToAccumulator(Add, B)
05ed | DirectAddress(StoreAccumulator, 207b)
05f0 | Call(Unconditional, 066c)
05f3 | DirectAddress(LoadAccumulator, 207b)
05f6 | ToAccumulatorImmediate(Compare, 0015)
05f8 | Jump(Carry, 0612)
05fb | DirectAddress(LoadAccumulator, 2061)
05fe | ToAccumulator(And, A)
05ff | ReturnFromSubroutine(Zero)
0600 | DirectAddress(LoadAccumulator, 207b)
0603 | ToAccumulatorImmediate(Compare, 001e)
0605 | Jump(Carry, 0612)
0608 | ToAccumulatorImmediate(Compare, 0027)
060a | Nop
060b | Jump(NoCarry, 0612)
060e | ToAccumulator(Subtract, A)
060f | DirectAddress(StoreAccumulator, 2015)
0612 | DirectAddress(LoadAccumulator, 2073)
0615 | ToAccumulatorImmediate(Or, 0001)
0617 | DirectAddress(StoreAccumulator, 2073)
061a | ReturnFromSubroutine(Unconditional)
061b | DirectAddress(LoadAccumulator, 201b)
061e | ToAccumulatorImmediate(Add, 0008)
0620 | Move { destination: H, source: A }
0621 | Call(Unconditional, 156f)
0624 | Move { destination: A, source: C }
0625 | ToAccumulatorImmediate(Compare, 000c)
0627 | Jump(Carry, 05a5)
062a | LoadImmediate(C, 000b)
062c | Jump(Unconditional, 05a5)
062f | Decrement(C)
0630 | DirectAddress(LoadAccumulator, 2067)
0633 | Move { destination: H, source: A }
0634 | Move { destination: L, source: C }
0635 | LoadImmediate(D, 0005)
0637 | Move { destination: A, source: MemoryRef }
0638 | ToAccumulator(And, A)
0639 | SetCarry
063a | ReturnFromSubroutine(NonZero)
063b | Move { destination: A, source: L }
063c | ToAccumulatorImmediate(Add, 000b)
063e | Move { destination: L, source: A }
063f | Decrement(D)
0640 | Jump(NonZero, 0637)
0643 | ReturnFromSubroutine(Unconditional)
0644 | LoadLargeImmediate(Hl, 2078)
0647 | Decrement(MemoryRef)
0648 | Move { destination: A, source: MemoryRef }
0649 | ToAccumulatorImmediate(Compare, 0003)
064b | Jump(NonZero, 0667)
064e | Call(Unconditional, 0675)
0651 | LoadLargeImmediate(Hl, 1cdc)
0654 | DirectAddress(StoreHl, 2079)
0657 | LoadLargeImmediate(Hl, 207c)
065a | Decrement(MemoryRef)
065b | Decrement(MemoryRef)
065c | DecrementPair(Hl)
065d | Decrement(MemoryRef)
065e | Decrement(MemoryRef)
065f | LoadImmediate(A, 0006)
0661 | DirectAddress(StoreAccumulator, 207d)
0664 | Jump(Unconditional, 066c)
0667 | ToAccumulator(And, A)
0668 | ReturnFromSubroutine(NonZero)
0669 | Jump(Unconditional, 0675)
066c | LoadLargeImmediate(Hl, 2079)
066f | Call(Unconditional, 1a3b)
0672 | Jump(Unconditional, 1491)
0675 | LoadLargeImmediate(Hl, 2079)
0678 | Call(Unconditional, 1a3b)
067b | Jump(Unconditional, 1452)
067e | DirectAddress(StoreHl, 2048)
0681 | ReturnFromSubroutine(Unconditional)
0682 | Pop(Hl)
0683 | DirectAddress(LoadAccumulator, 2080)
0686 | ToAccumulatorImmediate(Compare, 0002)
0688 | ReturnFromSubroutine(NonZero)
0689 | LoadLargeImmediate(Hl, 2083)
068c | Move { destination: A, source: MemoryRef }
068d | ToAccumulator(And, A)
068e | Jump(Zero, 050f)
0691 | DirectAddress(LoadAccumulator, 2056)
0694 | ToAccumulator(And, A)
0695 | Jump(NonZero, 050f)
0698 | IncrementPair(Hl)
0699 | Move { destination: A, source: MemoryRef }
069a | ToAccumulator(And, A)
069b | Jump(NonZero, 06ab)
069e | DirectAddress(LoadAccumulator, 2082)
06a1 | ToAccumulatorImmediate(Compare, 0008)
06a3 | Jump(Carry, 050f)
06a6 | LoadImmediate(MemoryRef, 0001)
06a8 | Call(Unconditional, 073c)
06ab | LoadLargeImmediate(De, 208a)
06ae | Call(Unconditional, 1a06)
06b1 | ReturnFromSubroutine(NoCarry)
06b2 | LoadLargeImmediate(Hl, 2085)
06b5 | Move { destination: A, source: MemoryRef }
06b6 | ToAccumulator(And, A)
06b7 | Jump(NonZero, 06d6)
06ba | LoadLargeImmediate(Hl, 208a)
06bd | Move { destination: A, source: MemoryRef }
06be | IncrementPair(Hl)
06bf | IncrementPair(Hl)
06c0 | ToAccumulator(Add, MemoryRef)
06c1 | DirectAddress(StoreAccumulator, 208a)
06c4 | Call(Unconditional, 073c)
06c7 | LoadLargeImmediate(Hl, 208a)
06ca | Move { destination: A, source: MemoryRef }
06cb | ToAccumulatorImmediate(Compare, 0028)
06cd | Jump(Carry, 06f9)
06d0 | ToAccumulatorImmediate(Compare, 00e1)
06d2 | Jump(NoCarry, 06f9)
06d5 | ReturnFromSubroutine(Unconditional)
06d6 | LoadImmediate(B, 00fe)
06d8 | Call(Unconditional, 19dc)
06db | IncrementPair(Hl)
06dc | Decrement(MemoryRef)
06dd | Move { destination: A, source: MemoryRef }
06de | ToAccumulatorImmediate(Compare, 001f)
06e0 | Jump(Zero, 074b)
06e3 | ToAccumulatorImmediate(Compare, 0018)
06e5 | Jump(Zero, 070c)
06e8 | ToAccumulator(And, A)
06e9 | ReturnFromSubroutine(NonZero)
06ea | LoadImmediate(B, 00ef)
06ec | LoadLargeImmediate(Hl, 2098)
06ef | Move { destination: A, source: MemoryRef }
06f0 | ToAccumulator(And, B)
06f1 | Move { destination: MemoryRef, source: A }
06f2 | ToAccumulatorImmediate(And, 0020)
06f4 | Out(0005)
06f6 | Nop
06f7 | Nop
06f8 | Nop
06f9 | Call(Unconditional, 0742)
06fc | Call(Unconditional, 14cb)
06ff | LoadLargeImmediate(Hl, 2083)
0702 | LoadImmediate(B, 000a)
0704 | Call(Unconditional, 075f)
0707 | LoadImmediate(B, 00fe)
0709 | Jump(Unconditional, 19dc)
070c | LoadImmediate(A, 0001)
070e | DirectAddress(StoreAccumulator, 20f1)
0711 | DirectAddress(LoadHl, 208d)
0714 | Move { destination: B, source: MemoryRef }
0715 | LoadImmediate(C, 0004)
0717 | LoadLargeImmediate(Hl, 1d50)
071a | LoadLargeImmediate(De, 1d4c)
071d | LoadAccumulator(De)
071e | ToAccumulator(Compare, B)
071f | Jump(Zero, 0728)
0722 | IncrementPair(Hl)
0723 | IncrementPair(De)
0724 | Decrement(C)
0725 | Jump(NonZero, 071d)
0728 | Move { destination: A, source: MemoryRef }
0729 | DirectAddress(StoreAccumulator, 2087)
072c | LoadImmediate(H, 0000)
072e | Move { destination: L, source: B }
072f | AddToHl(Hl)
0730 | AddToHl(Hl)
0731 | AddToHl(Hl)
0732 | AddToHl(Hl)
0733 | DirectAddress(StoreHl, 20f2)
0736 | Call(Unconditional, 0742)
0739 | Jump(Unconditional, 08f1)
073c | Call(Unconditional, 0742)
073f | Jump(Unconditional, 1439)
0742 | LoadLargeImmediate(Hl, 2087)
0745 | Call(Unconditional, 1a3b)
0748 | Jump(Unconditional, 1a47)
074b | LoadImmediate(B, 0010)
074d | LoadLargeImmediate(Hl, 2098)
0750 | Move { destination: A, source: MemoryRef }
0751 | ToAccumulator(Or, B)
0752 | Move { destination: MemoryRef, source: A }
0753 | Call(Unconditional, 1770)
0756 | LoadLargeImmediate(Hl, 1d7c)
0759 | DirectAddress(StoreHl, 2087)
075c | Jump(Unconditional, 073c)
075f | LoadLargeImmediate(De, 1b83)
0762 | Jump(Unconditional, 1a32)
0765 | LoadImmediate(A, 0001)
0767 | DirectAddress(StoreAccumulator, 2093)
076a | LoadLargeImmediate(Sp, 2400)
076d | EnableInterrupts
076e | Call(Unconditional, 1979)
0771 | Call(Unconditional, 09d6)
0774 | LoadLargeImmediate(Hl, 3013)
0777 | LoadLargeImmediate(De, 1ff3)
077a | LoadImmediate(C, 0004)
077c | Call(Unconditional, 08f3)
077f | DirectAddress(LoadAccumulator, 20eb)
0782 | Decrement(A)
0783 | LoadLargeImmediate(Hl, 2810)
0786 | LoadImmediate(C, 0014)
0788 | Jump(NonZero, 0857)
078b | LoadLargeImmediate(De, 1acf)
078e | Call(Unconditional, 08f3)
0791 | In(0001)
0793 | ToAccumulatorImmediate(And, 0004)
0795 | Jump(Zero, 077f)
0798 | LoadImmediate(B, 0099)
079a | ToAccumulator(Xor, A)
079b | DirectAddress(StoreAccumulator, 20ce)
079e | DirectAddress(LoadAccumulator, 20eb)
07a1 | ToAccumulator(Add, B)
07a2 | DecimalAdjustAccumulator
07a3 | DirectAddress(StoreAccumulator, 20eb)
07a6 | Call(Unconditional, 1947)
07a9 | LoadLargeImmediate(Hl, 0000)
07ac | DirectAddress(StoreHl, 20f8)
07af | DirectAddress(StoreHl, 20fc)
07b2 | Call(Unconditional, 1925)
07b5 | Call(Unconditional, 192b)
07b8 | Call(Unconditional, 19d7)
07bb | LoadLargeImmediate(Hl, 0101)
07be | Move { destination: A, source: H }
07bf | DirectAddress(StoreAccumulator, 20ef)
07c2 | DirectAddress(StoreHl, 20e7)
07c5 | DirectAddress(StoreHl, 20e5)
07c8 | Call(Unconditional, 1956)
07cb | Call(Unconditional, 01ef)
07ce | Call(Unconditional, 01f5)
07d1 | Call(Unconditional, 08d1)
07d4 | DirectAddress(StoreAccumulator, 21ff)
07d7 | DirectAddress(StoreAccumulator, 22ff)
07da | Call(Unconditional, 00d7)
07dd | ToAccumulator(Xor, A)
07de | DirectAddress(StoreAccumulator, 21fe)
07e1 | DirectAddress(StoreAccumulator, 22fe)
07e4 | Call(Unconditional, 01c0)
07e7 | Call(Unconditional, 1904)
07ea | LoadLargeImmediate(Hl, 3878)
07ed | DirectAddress(StoreHl, 21fc)
07f0 | DirectAddress(StoreHl, 22fc)
07f3 | Call(Unconditional, 01e4)
07f6 | Call(Unconditional, 1a7f)
07f9 | Call(Unconditional, 088d)
07fc | Call(Unconditional, 09d6)
07ff | Nop
0800 | ToAccumulator(Xor, A)
0801 | DirectAddress(StoreAccumulator, 20c1)
0804 | Call(Unconditional, 01cf)
0807 | DirectAddress(LoadAccumulator, 2067)
080a | RotateAccumulator(Right)
080b | Jump(Carry, 0872)
080e | Call(Unconditional, 0213)
0811 | Call(Unconditional, 01cf)
0814 | Call(Unconditional, 00b1)
0817 | Call(Unconditional, 19d1)
081a | LoadImmediate(B, 0020)
081c | Call(Unconditional, 18fa)
081f | Call(Unconditional, 1618)
0822 | Call(Unconditional, 190a)
0825 | Call(Unconditional, 15f3)
0828 | Call(Unconditional, 0988)
082b | DirectAddress(LoadAccumulator, 2082)
082e | ToAccumulator(And, A)
082f | Jump(Zero, 09ef)
0832 | Call(Unconditional, 170e)
0835 | Call(Unconditional, 0935)
0838 | Call(Unconditional, 08d8)
083b | Call(Unconditional, 172c)
083e | Call(Unconditional, 0a59)
0841 | Jump(Zero, 0849)
0844 | LoadImmediate(B, 0004)
0846 | Call(Unconditional, 18fa)
0849 | Call(Unconditional, 1775)
084c | Out(0006)
084e | Call(Unconditional, 1804)
0851 | Jump(Unconditional, 081f)
0854 | Nop
0855 | Nop
0856 | Nop
0857 | LoadLargeImmediate(De, 1aba)
085a | Call(Unconditional, 08f3)
085d | LoadImmediate(B, 0098)
085f | In(0001)
0861 | RotateAccumulator(Right)
0862 | RotateAccumulator(Right)
0863 | Jump(Carry, 086d)
0866 | RotateAccumulator(Right)
0867 | Jump(Carry, 0798)
086a | Jump(Unconditional, 077f)
086d | LoadImmediate(A, 0001)
086f | Jump(Unconditional, 079b)
0872 | Call(Unconditional, 021a)
0875 | Jump(Unconditional, 0814)
0878 | DirectAddress(LoadAccumulator, 2008)
087b | Move { destination: B, source: A }
087c | DirectAddress(LoadHl, 2009)
087f | ExchangeRegisters
0880 | Jump(Unconditional, 0886)
0883 | Nop
0884 | Nop
0885 | Nop
0886 | DirectAddress(LoadAccumulator, 2067)
0889 | Move { destination: H, source: A }
088a | LoadImmediate(L, 00fc)
088c | ReturnFromSubroutine(Unconditional)
088d | LoadLargeImmediate(Hl, 2b11)
0890 | LoadLargeImmediate(De, 1b70)
0893 | LoadImmediate(C, 000e)
0895 | Call(Unconditional, 08f3)
0898 | DirectAddress(LoadAccumulator, 2067)
089b | RotateAccumulator(Right)
089c | LoadImmediate(A, 001c)
089e | LoadLargeImmediate(Hl, 3711)
08a1 | Call(NoCarry, 08ff)
08a4 | LoadImmediate(A, 00b0)
08a6 | DirectAddress(StoreAccumulator, 20c0)
08a9 | DirectAddress(LoadAccumulator, 20c0)
08ac | ToAccumulator(And, A)
08ad | ReturnFromSubroutine(Zero)
08ae | ToAccumulatorImmediate(And, 0004)
08b0 | Jump(NonZero, 08bc)
08b3 | Call(Unconditional, 09ca)
08b6 | Call(Unconditional, 1931)
08b9 | Jump(Unconditional, 08a9)
08bc | LoadImmediate(B, 0020)
08be | LoadLargeImmediate(Hl, 271c)
08c1 | DirectAddress(LoadAccumulator, 2067)
08c4 | RotateAccumulator(Right)
08c5 | Jump(Carry, 08cb)
08c8 | LoadLargeImmediate(Hl, 391c)
08cb | Call(Unconditional, 14cb)
08ce | Jump(Unconditional, 08a9)
08d1 | In(0002)
08d3 | ToAccumulatorImmediate(And, 0003)
08d5 | ToAccumulatorImmediate(Add, 0003)
08d7 | ReturnFromSubroutine(Unconditional)
08d8 | DirectAddress(LoadAccumulator, 2082)
08db | ToAccumulatorImmediate(Compare, 0009)
08dd | ReturnFromSubroutine(NoCarry)
08de | LoadImmediate(A, 00fb)
08e0 | DirectAddress(StoreAccumulator, 207e)
08e3 | ReturnFromSubroutine(Unconditional)
08e4 | DirectAddress(LoadAccumulator, 20ce)
08e7 | ToAccumulator(And, A)
08e8 | ReturnFromSubroutine(NonZero)
08e9 | LoadLargeImmediate(Hl, 391c)
08ec | LoadImmediate(B, 0020)
08ee | Jump(Unconditional, 14cb)
08f1 | LoadImmediate(C, 0003)
08f3 | LoadAccumulator(De)
08f4 | Push(De)
08f5 | Call(Unconditional, 08ff)
08f8 | Pop(De)
08f9 | IncrementPair(De)
08fa | Decrement(C)
08fb | Jump(NonZero, 08f3)
08fe | ReturnFromSubroutine(Unconditional)
08ff | LoadLargeImmediate(De, 1e00)
0902 | Push(Hl)
0903 | LoadImmediate(H, 0000)
0905 | Move { destination: L, source: A }
0906 | AddToHl(Hl)
0907 | AddToHl(Hl)
0908 | AddToHl(Hl)
0909 | AddToHl(De)
090a | ExchangeRegisters
090b | Pop(Hl)
090c | LoadImmediate(B, 0008)
090e | Out(0006)
0910 | Jump(Unconditional, 1439)
0913 | DirectAddress(LoadAccumulator, 2009)
0916 | ToAccumulatorImmediate(Compare, 0078)
0918 | ReturnFromSubroutine(NoCarry)
0919 | DirectAddress(LoadHl, 2091)
091c | Move { destination: A, source: L }
091d | ToAccumulator(Or, H)
091e | Jump(NonZero, 0929)
0921 | LoadLargeImmediate(Hl, 0600)
0924 | LoadImmediate(A, 0001)
0926 | DirectAddress(StoreAccumulator, 2083)
0929 | DecrementPair(Hl)
092a | DirectAddress(StoreHl, 2091)
092d | ReturnFromSubroutine(Unconditional)
092e | Call(Unconditional, 1611)
0931 | LoadImmediate(L, 00ff)
0933 | Move { destination: A, source: MemoryRef }
0934 | ReturnFromSubroutine(Unconditional)
0935 | Call(Unconditional, 1910)
0938 | DecrementPair(Hl)
0939 | DecrementPair(Hl)
093a | Move { destination: A, source: MemoryRef }
093b | ToAccumulator(And, A)
093c | ReturnFromSubroutine(Zero)
093d | LoadImmediate(B, 0015)
093f | In(0002)
0941 | ToAccumulatorImmediate(And, 0008)
0943 | Jump(Zero, 0948)
0946 | LoadImmediate(B, 0010)
0948 | Call(Unconditional, 09ca)
094b | IncrementPair(Hl)
094c | Move { destination: A, source: MemoryRef }
094d | ToAccumulator(Compare, B)
094e | ReturnFromSubroutine(Carry)
094f | Call(Unconditional, 092e)
0952 | Increment(MemoryRef)
0953 | Move { destination: A, source: MemoryRef }
0954 | Push(FlagsA)
0955 | LoadLargeImmediate(Hl, 2501)
0958 | Increment(H)
0959 | Increment(H)
095a | Decrement(A)
095b | Jump(NonZero, 0958)
095e | LoadImmediate(B, 0010)
0960 | LoadLargeImmediate(De, 1c60)
0963 | Call(Unconditional, 1439)
0966 | Pop(FlagsA)
0967 | Increment(A)
0968 | Call(Unconditional, 1a8b)
096b | Call(Unconditional, 1910)
096e | DecrementPair(Hl)
096f | DecrementPair(Hl)
0970 | LoadImmediate(MemoryRef, 0000)
0972 | LoadImmediate(A, 00ff)
0974 | DirectAddress(StoreAccumulator, 2099)
0977 | LoadImmediate(B, 0010)
0979 | Jump(Unconditional, 18fa)
097c | LoadLargeImmediate(Hl, 1da0)
097f | ToAccumulatorImmediate(Compare, 0002)
0981 | ReturnFromSubroutine(Carry)
0982 | IncrementPair(Hl)
0983 | ToAccumulatorImmediate(Compare, 0004)
0985 | ReturnFromSubroutine(Carry)
0986 | IncrementPair(Hl)
0987 | ReturnFromSubroutine(Unconditional)
0988 | Call(Unconditional, 09ca)
098b | DirectAddress(LoadAccumulator, 20f1)
098e | ToAccumulator(And, A)
098f | ReturnFromSubroutine(Zero)
0990 | ToAccumulator(Xor, A)
0991 | DirectAddress(StoreAccumulator, 20f1)
0994 | Push(Hl)
0995 | DirectAddress(LoadHl, 20f2)
0998 | ExchangeRegisters
0999 | Pop(Hl)
099a | Move { destination: A, source: MemoryRef }
099b | ToAccumulator(Add, E)
099c | DecimalAdjustAccumulator
099d | Move { destination: MemoryRef, source: A }
099e | Move { destination: E, source: A }
099f | IncrementPair(Hl)
09a0 | Move { destination: A, source: MemoryRef }
09a1 | ToAccumulator(AddWithCarry, D)
09a2 | DecimalAdjustAccumulator
09a3 | Move { destination: MemoryRef, source: A }
09a4 | Move { destination: D, source: A }
09a5 | IncrementPair(Hl)
09a6 | Move { destination: A, source: MemoryRef }
09a7 | IncrementPair(Hl)
09a8 | Move { destination: H, source: MemoryRef }
09a9 | Move { destination: L, source: A }
09aa | Jump(Unconditional, 09ad)
09ad | Move { destination: A, source: D }
09ae | Call(Unconditional, 09b2)
09b1 | Move { destination: A, source: E }
09b2 | Push(De)
09b3 | Push(FlagsA)
09b4 | RotateAccumulator(Right)
09b5 | RotateAccumulator(Right)
09b6 | RotateAccumulator(Right)
09b7 | RotateAccumulator(Right)
09b8 | ToAccumulatorImmediate(And, 000f)
09ba | Call(Unconditional, 09c5)
09bd | Pop(FlagsA)
09be | ToAccumulatorImmediate(And, 000f)
09c0 | Call(Unconditional, 09c5)
09c3 | Pop(De)
09c4 | ReturnFromSubroutine(Unconditional)
09c5 | ToAccumulatorImmediate(Add, 001a)
09c7 | Jump(Unconditional, 08ff)
09ca | DirectAddress(LoadAccumulator, 2067)
09cd | RotateAccumulator(Right)
09ce | LoadLargeImmediate(Hl, 20f8)
09d1 | ReturnFromSubroutine(Carry)
09d2 | LoadLargeImmediate(Hl, 20fc)
09d5 | ReturnFromSubroutine(Unconditional)
09d6 | LoadLargeImmediate(Hl, 2402)
09d9 | LoadImmediate(MemoryRef, 0000)
09db | IncrementPair(Hl)
09dc | Move { destination: A, source: L }
09dd | ToAccumulatorImmediate(And, 001f)
09df | ToAccumulatorImmediate(Compare, 001c)
09e1 | Jump(Carry, 09e8)
09e4 | LoadLargeImmediate(De, 0006)
09e7 | AddToHl(De)
09e8 | Move { destination: A, source: H }
09e9 | ToAccumulatorImmediate(Compare, 0040)
09eb | Jump(Carry, 09d9)
09ee | ReturnFromSubroutine(Unconditional)
09ef | Call(Unconditional, 0a3c)
09f2 | ToAccumulator(Xor, A)
09f3 | DirectAddress(StoreAccumulator, 20e9)
09f6 | Call(Unconditional, 09d6)
09f9 | DirectAddress(LoadAccumulator, 2067)
09fc | Push(FlagsA)
09fd | Call(Unconditional, 01e4)
0a00 | Pop(FlagsA)
0a01 | DirectAddress(StoreAccumulator, 2067)
0a04 | DirectAddress(LoadAccumulator, 2067)
0a07 | Move { destination: H, source: A }
0a08 | Push(Hl)
0a09 | LoadImmediate(L, 00fe)
0a0b | Move { destination: A, source: MemoryRef }
0a0c | ToAccumulatorImmediate(And, 0007)
0a0e | Increment(A)
0a0f | Move { destination: MemoryRef, source: A }
0a10 | LoadLargeImmediate(Hl, 1da2)
0a13 | IncrementPair(Hl)
0a14 | Decrement(A)
0a15 | Jump(NonZero, 0a13)
0a18 | Move { destination: A, source: MemoryRef }
0a19 | Pop(Hl)
0a1a | LoadImmediate(L, 00fc)
0a1c | Move { destination: MemoryRef, source: A }
0a1d | IncrementPair(Hl)
0a1e | LoadImmediate(MemoryRef, 0038)
0a20 | Move { destination: A, source: H }
0a21 | RotateAccumulator(Right)
0a22 | Jump(Carry, 0a33)
0a25 | LoadImmediate(A, 0021)
0a27 | DirectAddress(StoreAccumulator, 2098)
0a2a | Call(Unconditional, 01f5)
0a2d | Call(Unconditional, 1904)
0a30 | Jump(Unconditional, 0804)
0a33 | Call(Unconditional, 01ef)
0a36 | Call(Unconditional, 01c0)
0a39 | Jump(Unconditional, 0804)
0a3c | Call(Unconditional, 0a59)
0a3f | Jump(NonZero, 0a52)
0a42 | LoadImmediate(A, 0030)
0a44 | DirectAddress(StoreAccumulator, 20c0)
0a47 | DirectAddress(LoadAccumulator, 20c0)
0a4a | ToAccumulator(And, A)
0a4b | ReturnFromSubroutine(Zero)
0a4c | Call(Unconditional, 0a59)
0a4f | Jump(Zero, 0a47)
0a52 | Call(Unconditional, 0a59)
0a55 | Jump(NonZero, 0a52)
0a58 | ReturnFromSubroutine(Unconditional)
0a59 | DirectAddress(LoadAccumulator, 2015)
0a5c | ToAccumulatorImmediate(Compare, 00ff)
0a5e | ReturnFromSubroutine(Unconditional)
0a5f | DirectAddress(LoadAccumulator, 20ef)
0a62 | ToAccumulator(And, A)
0a63 | Jump(Zero, 0a7c)
0a66 | Move { destination: C, source: B }
0a67 | LoadImmediate(B, 0008)
0a69 | Call(Unconditional, 18fa)
0a6c | Move { destination: B, source: C }
0a6d | Move { destination: A, source: B }
0a6e | Call(Unconditional, 097c)
0a71 | Move { destination: A, source: MemoryRef }
0a72 | LoadLargeImmediate(Hl, 20f3)
0a75 | LoadImmediate(MemoryRef, 0000)
0a77 | DecrementPair(Hl)
0a78 | Move { destination: MemoryRef, source: A }
0a79 | DecrementPair(Hl)
0a7a | LoadImmediate(MemoryRef, 0001)
0a7c | LoadLargeImmediate(Hl, 2062)
0a7f | ReturnFromSubroutine(Unconditional)
0a80 | LoadImmediate(A, 0002)
0a82 | DirectAddress(StoreAccumulator, 20c1)
0a85 | Out(0006)
0a87 | DirectAddress(LoadAccumulator, 20cb)
0a8a | ToAccumulator(And, A)
0a8b | Jump(Zero, 0a85)
0a8e | ToAccumulator(Xor, A)
0a8f | DirectAddress(StoreAccumulator, 20c1)
0a92 | ReturnFromSubroutine(Unconditional)
0a93 | Push(De)
0a94 | LoadAccumulator(De)
0a95 | Call(Unconditional, 08ff)
0a98 | Pop(De)
0a99 | LoadImmediate(A, 0007)
0a9b | DirectAddress(StoreAccumulator, 20c0)
0a9e | DirectAddress(LoadAccumulator, 20c0)
0aa1 | Decrement(A)
0aa2 | Jump(NonZero, 0a9e)
0aa5 | IncrementPair(De)
0aa6 | Decrement(C)
0aa7 | Jump(NonZero, 0a93)
0aaa | ReturnFromSubroutine(Unconditional)
0aab | LoadLargeImmediate(Hl, 2050)
0aae | Jump(Unconditional, 024b)
0ab1 | LoadImmediate(A, 0040)
0ab3 | Jump(Unconditional, 0ad7)
0ab6 | LoadImmediate(A, 0080)
0ab8 | Jump(Unconditional, 0ad7)
0abb | Pop(Hl)
0abc | Jump(Unconditional, 0072)
0abf | DirectAddress(LoadAccumulator, 20c1)
0ac2 | RotateAccumulator(Right)
0ac3 | Jump(Carry, 0abb)
0ac6 | RotateAccumulator(Right)
0ac7 | Jump(Carry, 1868)
0aca | RotateAccumulator(Right)
0acb | Jump(Carry, 0aab)
0ace | ReturnFromSubroutine(Unconditional)
0acf | LoadLargeImmediate(Hl, 2b14)
0ad2 | LoadImmediate(C, 000f)
0ad4 | Jump(Unconditional, 0a93)
0ad7 | DirectAddress(StoreAccumulator, 20c0)
0ada | DirectAddress(LoadAccumulator, 20c0)
0add | ToAccumulator(And, A)
0ade | Jump(NonZero, 0ada)
0ae1 | ReturnFromSubroutine(Unconditional)
0ae2 | LoadLargeImmediate(Hl, 20c2)
0ae5 | LoadImmediate(B, 000c)
0ae7 | Jump(Unconditional, 1a32)
0aea | ToAccumulator(Xor, A)
0aeb | Out(0003)
0aed | Out(0005)
0aef | Call(Unconditional, 1982)
0af2 | EnableInterrupts
0af3 | Call(Unconditional, 0ab1)
0af6 | DirectAddress(LoadAccumulator, 20ec)
0af9 | ToAccumulator(And, A)
0afa | LoadLargeImmediate(Hl, 3017)
0afd | LoadImmediate(C, 0004)
0aff | Jump(NonZero, 0be8)
0b02 | LoadLargeImmediate(De, 1cfa)
0b05 | Call(Unconditional, 0a93)
0b08 | LoadLargeImmediate(De, 1daf)
0b0b | Call(Unconditional, 0acf)
0b0e | Call(Unconditional, 0ab1)
0b11 | Call(Unconditional, 1815)
0b14 | Call(Unconditional, 0ab6)
0b17 | DirectAddress(LoadAccumulator, 20ec)
0b1a | ToAccumulator(And, A)
0b1b | Jump(NonZero, 0b4a)
0b1e | LoadLargeImmediate(De, 1a95)
0b21 | Call(Unconditional, 0ae2)
0b24 | Call(Unconditional, 0a80)
0b27 | LoadLargeImmediate(De, 1bb0)
0b2a | Call(Unconditional, 0ae2)
0b2d | Call(Unconditional, 0a80)
0b30 | Call(Unconditional, 0ab1)
0b33 | LoadLargeImmediate(De, 1fc9)
0b36 | Call(Unconditional, 0ae2)
0b39 | Call(Unconditional, 0a80)
0b3c | Call(Unconditional, 0ab1)
0b3f | LoadLargeImmediate(Hl, 33b7)
0b42 | LoadImmediate(B, 000a)
0b44 | Call(Unconditional, 14cb)
0b47 | Call(Unconditional, 0ab6)
0b4a | Call(Unconditional, 09d6)
0b4d | DirectAddress(LoadAccumulator, 21ff)
0b50 | ToAccumulator(And, A)
0b51 | Jump(NonZero, 0b5d)
0b54 | Call(Unconditional, 08d1)
0b57 | DirectAddress(StoreAccumulator, 21ff)
0b5a | Call(Unconditional, 1a7f)
0b5d | Call(Unconditional, 01e4)
0b60 | Call(Unconditional, 01c0)
0b63 | Call(Unconditional, 01ef)
0b66 | Call(Unconditional, 021a)
0b69 | LoadImmediate(A, 0001)
0b6b | DirectAddress(StoreAccumulator, 20c1)
0b6e | Call(Unconditional, 01cf)
0b71 | Call(Unconditional, 1618)
0b74 | Call(Unconditional, 0bf1)
0b77 | Out(0006)
0b79 | Call(Unconditional, 0a59)
0b7c | Jump(Zero, 0b71)
0b7f | ToAccumulator(Xor, A)
0b80 | DirectAddress(StoreAccumulator, 2025)
0b83 | Call(Unconditional, 0a59)
0b86 | Jump(NonZero, 0b83)
0b89 | ToAccumulator(Xor, A)
0b8a | DirectAddress(StoreAccumulator, 20c1)
0b8d | Call(Unconditional, 0ab1)
0b90 | Call(Unconditional, 1988)
0b93 | LoadImmediate(C, 000c)
0b95 | LoadLargeImmediate(Hl, 2c11)
0b98 | LoadLargeImmediate(De, 1f90)
0b9b | Call(Unconditional, 08f3)
0b9e | DirectAddress(LoadAccumulator, 20ec)
0ba1 | ToAccumulatorImmediate(Compare, 0000)
0ba3 | Jump(NonZero, 0bae)
0ba6 | LoadLargeImmediate(Hl, 3311)
0ba9 | LoadImmediate(A, 0002)
0bab | Call(Unconditional, 08ff)
0bae | LoadLargeImmediate(Bc, 1f9c)
0bb1 | Call(Unconditional, 1856)
0bb4 | Call(Unconditional, 184c)
0bb7 | In(0002)
0bb9 | RotateAccumulator(Left)
0bba | Jump(Carry, 0bc3)
0bbd | LoadLargeImmediate(Bc, 1fa0)
0bc0 | Call(Unconditional, 183a)
0bc3 | Call(Unconditional, 0ab6)
0bc6 | DirectAddress(LoadAccumulator, 20ec)
0bc9 | ToAccumulatorImmediate(Compare, 0000)
0bcb | Jump(NonZero, 0bda)
0bce | LoadLargeImmediate(De, 1fd5)
0bd1 | Call(Unconditional, 0ae2)
0bd4 | Call(Unconditional, 0a80)
0bd7 | Call(Unconditional, 189e)
0bda | LoadLargeImmediate(Hl, 20ec)
0bdd | Move { destination: A, source: MemoryRef }
0bde | Increment(A)
0bdf | ToAccumulatorImmediate(And, 0001)
0be1 | Move { destination: MemoryRef, source: A }
0be2 | Call(Unconditional, 09d6)
0be5 | Jump(Unconditional, 18df)
0be8 | LoadLargeImmediate(De, 1dab)
0beb | Call(Unconditional, 0a93)
0bee | Jump(Unconditional, 0b0b)
0bf1 | Call(Unconditional, 190a)
0bf4 | Jump(Unconditional, 199a)
0bf7 | IncrementPair(De)
0bf8 | Nop
0bf9 | Invalid(0008)
0bfa | IncrementPair(De)
0bfb | LoadImmediate(C, 0026)
0bfd | StoreAccumulator(Bc)
0bfe | LoadImmediate(C, 000f)
0c00 | Nop
0c01 | Nop
0c02 | Nop
0c03 | Nop
0c04 | Nop
0c05 | Nop
0c06 | Nop
0c07 | Nop
0c08 | Nop
0c09 | Nop
0c0a | Nop
0c0b | Nop
0c0c | Nop
0c0d | Nop
0c0e | Nop
0c0f | Nop
0c10 | Nop
0c11 | Nop
0c12 | Nop
0c13 | Nop
0c14 | Nop
0c15 | Nop
0c16 | Nop
0c17 | Nop
0c18 | Nop
0c19 | Nop
0c1a | Nop
0c1b | Nop
0c1c | Nop
0c1d | Nop
0c1e | Nop
0c1f | Nop
0c20 | Nop
0c21 | Nop
0c22 | Nop
0c23 | Nop
0c24 | Nop
0c25 | Nop
0c26 | Nop
0c27 | Nop
0c28 | Nop
0c29 | Nop
0c2a | Nop
0c2b | Nop
0c2c | Nop
0c2d | Nop
0c2e | Nop
0c2f | Nop
0c30 | Nop
0c31 | Nop
0c32 | Nop
0c33 | Nop
0c34 | Nop
0c35 | Nop
0c36 | Nop
0c37 | Nop
0c38 | Nop
0c39 | Nop
0c3a | Nop
0c3b | Nop
0c3c | Nop
0c3d | Nop
0c3e | Nop
0c3f | Nop
0c40 | Nop
0c41 | Nop
0c42 | Nop
0c43 | Nop
0c44 | Nop
0c45 | Nop
0c46 | Nop
0c47 | Nop
0c48 | Nop
0c49 | Nop
0c4a | Nop
0c4b | Nop
0c4c | Nop
0c4d | Nop
0c4e | Nop
0c4f | Nop
0c50 | Nop
0c51 | Nop
0c52 | Nop
0c53 | Nop
0c54 | Nop
0c55 | Nop
0c56 | Nop
0c57 | Nop
0c58 | Nop
0c59 | Nop
0c5a | Nop
0c5b | Nop
0c5c | Nop
0c5d | Nop
0c5e | Nop
0c5f | Nop
0c60 | Nop
0c61 | Nop
0c62 | Nop
0c63 | Nop
0c64 | Nop
0c65 | Nop
0c66 | Nop
0c67 | Nop
0c68 | Nop
0c69 | Nop
0c6a | Nop
0c6b | Nop
0c6c | Nop
0c6d | Nop
0c6e | Nop
0c6f | Nop
0c70 | Nop
0c71 | Nop
0c72 | Nop
0c73 | Nop
0c74 | Nop
0c75 | Nop
0c76 | Nop
0c77 | Nop
0c78 | Nop
0c79 | Nop
0c7a | Nop
0c7b | Nop
0c7c | Nop
0c7d | Nop
0c7e | Nop
0c7f | Nop
0c80 | Nop
0c81 | Nop
0c82 | Nop
0c83 | Nop
0c84 | Nop
0c85 | Nop
0c86 | Nop
0c87 | Nop
0c88 | Nop
0c89 | Nop
0c8a | Nop
0c8b | Nop
0c8c | Nop
0c8d | Nop
0c8e | Nop
0c8f | Nop
0c90 | Nop
0c91 | Nop
0c92 | Nop
0c93 | Nop
0c94 | Nop
0c95 | Nop
0c96 | Nop
0c97 | Nop
0c98 | Nop
0c99 | Nop
0c9a | Nop
0c9b | Nop
0c9c | Nop
0c9d | Nop
0c9e | Nop
0c9f | Nop
0ca0 | Nop
0ca1 | Nop
0ca2 | Nop
0ca3 | Nop
0ca4 | Nop
0ca5 | Nop
0ca6 | Nop
0ca7 | Nop
0ca8 | Nop
0ca9 | Nop
0caa | Nop
0cab | Nop
0cac | Nop
0cad | Nop
0cae | Nop
0caf | Nop
0cb0 | Nop
0cb1 | Nop
0cb2 | Nop
0cb3 | Nop
0cb4 | Nop
0cb5 | Nop
0cb6 | Nop
0cb7 | Nop
0cb8 | Nop
0cb9 | Nop
0cba | Nop
0cbb | Nop
0cbc | Nop
0cbd | Nop
0cbe | Nop
0cbf | Nop
0cc0 | Nop
0cc1 | Nop
0cc2 | Nop
0cc3 | Nop
0cc4 | Nop
0cc5 | Nop
0cc6 | Nop
0cc7 | Nop
0cc8 | Nop
0cc9 | Nop
0cca | Nop
0ccb | Nop
0ccc | Nop
0ccd | Nop
0cce | Nop
0ccf | Nop
0cd0 | Nop
0cd1 | Nop
0cd2 | Nop
0cd3 | Nop
0cd4 | Nop
0cd5 | Nop
0cd6 | Nop
0cd7 | Nop
0cd8 | Nop
0cd9 | Nop
0cda | Nop
0cdb | Nop
0cdc | Nop
0cdd | Nop
0cde | Nop
0cdf | Nop
0ce0 | Nop
0ce1 | Nop
0ce2 | Nop
0ce3 | Nop
0ce4 | Nop
0ce5 | Nop
0ce6 | Nop
0ce7 | Nop
0ce8 | Nop
0ce9 | Nop
0cea | Nop
0ceb | Nop
0cec | Nop
0ced | Nop
0cee | Nop
0cef | Nop
0cf0 | Nop
0cf1 | Nop
0cf2 | Nop
0cf3 | Nop
0cf4 | Nop
0cf5 | Nop
0cf6 | Nop
0cf7 | Nop
0cf8 | Nop
0cf9 | Nop
0cfa | Nop
0cfb | Nop
0cfc | Nop
0cfd | Nop
0cfe | Nop
0cff | Nop
0d00 | Nop
0d01 | Nop
0d02 | Nop
0d03 | Nop
0d04 | Nop
0d05 | Nop
0d06 | Nop
0d07 | Nop
0d08 | Nop
0d09 | Nop
0d0a | Nop
0d0b | Nop
0d0c | Nop
0d0d | Nop
0d0e | Nop
0d0f | Nop
0d10 | Nop
0d11 | Nop
0d12 | Nop
0d13 | Nop
0d14 | Nop
0d15 | Nop
0d16 | Nop
0d17 | Nop
0d18 | Nop
0d19 | Nop
0d1a | Nop
0d1b | Nop
0d1c | Nop
0d1d | Nop
0d1e | Nop
0d1f | Nop
0d20 | Nop
0d21 | Nop
0d22 | Nop
0d23 | Nop
0d24 | Nop
0d25 | Nop
0d26 | Nop
0d27 | Nop
0d28 | Nop
0d29 | Nop
0d2a | Nop
0d2b | Nop
0d2c | Nop
0d2d | Nop
0d2e | Nop
0d2f | Nop
0d30 | Nop
0d31 | Nop
0d32 | Nop
0d33 | Nop
0d34 | Nop
0d35 | Nop
0d36 | Nop
0d37 | Nop
0d38 | Nop
0d39 | Nop
0d3a | Nop
0d3b | Nop
0d3c | Nop
0d3d | Nop
0d3e | Nop
0d3f | Nop
0d40 | Nop
0d41 | Nop
0d42 | Nop
0d43 | Nop
0d44 | Nop
0d45 | Nop
0d46 | Nop
0d47 | Nop
0d48 | Nop
0d49 | Nop
0d4a | Nop
0d4b | Nop
0d4c | Nop
0d4d | Nop
0d4e | Nop
0d4f | Nop
0d50 | Nop
0d51 | Nop
0d52 | Nop
0d53 | Nop
0d54 | Nop
0d55 | Nop
0d56 | Nop
0d57 | Nop
0d58 | Nop
0d59 | Nop
0d5a | Nop
0d5b | Nop
0d5c | Nop
0d5d | Nop
0d5e | Nop
0d5f | Nop
0d60 | Nop
0d61 | Nop
0d62 | Nop
0d63 | Nop
0d64 | Nop
0d65 | Nop
0d66 | Nop
0d67 | Nop
0d68 | Nop
0d69 | Nop
0d6a | Nop
0d6b | Nop
0d6c | Nop
0d6d | Nop
0d6e | Nop
0d6f | Nop
0d70 | Nop
0d71 | Nop
0d72 | Nop
0d73 | Nop
0d74 | Nop
0d75 | Nop
0d76 | Nop
0d77 | Nop
0d78 | Nop
0d79 | Nop
0d7a | Nop
0d7b | Nop
0d7c | Nop
0d7d | Nop
0d7e | Nop
0d7f | Nop
0d80 | Nop
0d81 | Nop
0d82 | Nop
0d83 | Nop
0d84 | Nop
0d85 | Nop
0d86 | Nop
0d87 | Nop
0d88 | Nop
0d89 | Nop
0d8a | Nop
0d8b | Nop
0d8c | Nop
0d8d | Nop
0d8e | Nop
0d8f | Nop
0d90 | Nop
0d91 | Nop
0d92 | Nop
0d93 | Nop
0d94 | Nop
0d95 | Nop
0d96 | Nop
0d97 | Nop
0d98 | Nop
0d99 | Nop
0d9a | Nop
0d9b | Nop
0d9c | Nop
0d9d | Nop
0d9e | Nop
0d9f | Nop
0da0 | Nop
0da1 | Nop
0da2 | Nop
0da3 | Nop
0da4 | Nop
0da5 | Nop
0da6 | Nop
0da7 | Nop
0da8 | Nop
0da9 | Nop
0daa | Nop
0dab | Nop
0dac | Nop
0dad | Nop
0dae | Nop
0daf | Nop
0db0 | Nop
0db1 | Nop
0db2 | Nop
0db3 | Nop
0db4 | Nop
0db5 | Nop
0db6 | Nop
0db7 | Nop
0db8 | Nop
0db9 | Nop
0dba | Nop
0dbb | Nop
0dbc | Nop
0dbd | Nop
0dbe | Nop
0dbf | Nop
0dc0 | Nop
0dc1 | Nop
0dc2 | Nop
0dc3 | Nop
0dc4 | Nop
0dc5 | Nop
0dc6 | Nop
0dc7 | Nop
0dc8 | Nop
0dc9 | Nop
0dca | Nop
0dcb | Nop
0dcc | Nop
0dcd | Nop
0dce | Nop
0dcf | Nop
0dd0 | Nop
0dd1 | Nop
0dd2 | Nop
0dd3 | Nop
0dd4 | Nop
0dd5 | Nop
0dd6 | Nop
0dd7 | Nop
0dd8 | Nop
0dd9 | Nop
0dda | Nop
0ddb | Nop
0ddc | Nop
0ddd | Nop
0dde | Nop
0ddf | Nop
0de0 | Nop
0de1 | Nop
0de2 | Nop
0de3 | Nop
0de4 | Nop
0de5 | Nop
0de6 | Nop
0de7 | Nop
0de8 | Nop
0de9 | Nop
0dea | Nop
0deb | Nop
0dec | Nop
0ded | Nop
0dee | Nop
0def | Nop
0df0 | Nop
0df1 | Nop
0df2 | Nop
0df3 | Nop
0df4 | Nop
0df5 | Nop
0df6 | Nop
0df7 | Nop
0df8 | Nop
0df9 | Nop
0dfa | Nop
0dfb | Nop
0dfc | Nop
0dfd | Nop
0dfe | Nop
0dff | Nop
0e00 | Nop
0e01 | Nop
0e02 | Nop
0e03 | Nop
0e04 | Nop
0e05 | Nop
0e06 | Nop
0e07 | Nop
0e08 | Nop
0e09 | Nop
0e0a | Nop
0e0b | Nop
0e0c | Nop
0e0d | Nop
0e0e | Nop
0e0f | Nop
0e10 | Nop
0e11 | Nop
0e12 | Nop
0e13 | Nop
0e14 | Nop
0e15 | Nop
0e16 | Nop
0e17 | Nop
0e18 | Nop
0e19 | Nop
0e1a | Nop
0e1b | Nop
0e1c | Nop
0e1d | Nop
0e1e | Nop
0e1f | Nop
0e20 | Nop
0e21 | Nop
0e22 | Nop
0e23 | Nop
0e24 | Nop
0e25 | Nop
0e26 | Nop
0e27 | Nop
0e28 | Nop
0e29 | Nop
0e2a | Nop
0e2b | Nop
0e2c | Nop
0e2d | Nop
0e2e | Nop
0e2f | Nop
0e30 | Nop
0e31 | Nop
0e32 | Nop
0e33 | Nop
0e34 | Nop
0e35 | Nop
0e36 | Nop
0e37 | Nop
0e38 | Nop
0e39 | Nop
0e3a | Nop
0e3b | Nop
0e3c | Nop
0e3d | Nop
0e3e | Nop
0e3f | Nop
0e40 | Nop
0e41 | Nop
0e42 | Nop
0e43 | Nop
0e44 | Nop
0e45 | Nop
0e46 | Nop
0e47 | Nop
0e48 | Nop
0e49 | Nop
0e4a | Nop
0e4b | Nop
0e4c | Nop
0e4d | Nop
0e4e | Nop
0e4f | Nop
0e50 | Nop
0e51 | Nop
0e52 | Nop
0e53 | Nop
0e54 | Nop
0e55 | Nop
0e56 | Nop
0e57 | Nop
0e58 | Nop
0e59 | Nop
0e5a | Nop
0e5b | Nop
0e5c | Nop
0e5d | Nop
0e5e | Nop
0e5f | Nop
0e60 | Nop
0e61 | Nop
0e62 | Nop
0e63 | Nop
0e64 | Nop
0e65 | Nop
0e66 | Nop
0e67 | Nop
0e68 | Nop
0e69 | Nop
0e6a | Nop
0e6b | Nop
0e6c | Nop
0e6d | Nop
0e6e | Nop
0e6f | Nop
0e70 | Nop
0e71 | Nop
0e72 | Nop
0e73 | Nop
0e74 | Nop
0e75 | Nop
0e76 | Nop
0e77 | Nop
0e78 | Nop
0e79 | Nop
0e7a | Nop
0e7b | Nop
0e7c | Nop
0e7d | Nop
0e7e | Nop
0e7f | Nop
0e80 | Nop
0e81 | Nop
0e82 | Nop
0e83 | Nop
0e84 | Nop
0e85 | Nop
0e86 | Nop
0e87 | Nop
0e88 | Nop
0e89 | Nop
0e8a | Nop
0e8b | Nop
0e8c | Nop
0e8d | Nop
0e8e | Nop
0e8f | Nop
0e90 | Nop
0e91 | Nop
0e92 | Nop
0e93 | Nop
0e94 | Nop
0e95 | Nop
0e96 | Nop
0e97 | Nop
0e98 | Nop
0e99 | Nop
0e9a | Nop
0e9b | Nop
0e9c | Nop
0e9d | Nop
0e9e | Nop
0e9f | Nop
0ea0 | Nop
0ea1 | Nop
0ea2 | Nop
0ea3 | Nop
0ea4 | Nop
0ea5 | Nop
0ea6 | Nop
0ea7 | Nop
0ea8 | Nop
0ea9 | Nop
0eaa | Nop
0eab | Nop
0eac | Nop
0ead | Nop
0eae | Nop
0eaf | Nop
0eb0 | Nop
0eb1 | Nop
0eb2 | Nop
0eb3 | Nop
0eb4 | Nop
0eb5 | Nop
0eb6 | Nop
0eb7 | Nop
0eb8 | Nop
0eb9 | Nop
0eba | Nop
0ebb | Nop
0ebc | Nop
0ebd | Nop
0ebe | Nop
0ebf | Nop
0ec0 | Nop
0ec1 | Nop
0ec2 | Nop
0ec3 | Nop
0ec4 | Nop
0ec5 | Nop
0ec6 | Nop
0ec7 | Nop
0ec8 | Nop
0ec9 | Nop
0eca | Nop
0ecb | Nop
0ecc | Nop
0ecd | Nop
0ece | Nop
0ecf | Nop
0ed0 | Nop
0ed1 | Nop
0ed2 | Nop
0ed3 | Nop
0ed4 | Nop
0ed5 | Nop
0ed6 | Nop
0ed7 | Nop
0ed8 | Nop
0ed9 | Nop
0eda | Nop
0edb | Nop
0edc | Nop
0edd | Nop
0ede | Nop
0edf | Nop
0ee0 | Nop
0ee1 | Nop
0ee2 | Nop
0ee3 | Nop
0ee4 | Nop
0ee5 | Nop
0ee6 | Nop
0ee7 | Nop
0ee8 | Nop
0ee9 | Nop
0eea | Nop
0eeb | Nop
0eec | Nop
0eed | Nop
0eee | Nop
0eef | Nop
0ef0 | Nop
0ef1 | Nop
0ef2 | Nop
0ef3 | Nop
0ef4 | Nop
0ef5 | Nop
0ef6 | Nop
0ef7 | Nop
0ef8 | Nop
0ef9 | Nop
0efa | Nop
0efb | Nop
0efc | Nop
0efd | Nop
0efe | Nop
0eff | Nop
0f00 | Nop
0f01 | Nop
0f02 | Nop
0f03 | Nop
0f04 | Nop
0f05 | Nop
0f06 | Nop
0f07 | Nop
0f08 | Nop
0f09 | Nop
0f0a | Nop
0f0b | Nop
0f0c | Nop
0f0d | Nop
0f0e | Nop
0f0f | Nop
0f10 | Nop
0f11 | Nop
0f12 | Nop
0f13 | Nop
0f14 | Nop
0f15 | Nop
0f16 | Nop
0f17 | Nop
0f18 | Nop
0f19 | Nop
0f1a | Nop
0f1b | Nop
0f1c | Nop
0f1d | Nop
0f1e | Nop
0f1f | Nop
0f20 | Nop
0f21 | Nop
0f22 | Nop
0f23 | Nop
0f24 | Nop
0f25 | Nop
0f26 | Nop
0f27 | Nop
0f28 | Nop
0f29 | Nop
0f2a | Nop
0f2b | Nop
0f2c | Nop
0f2d | Nop
0f2e | Nop
0f2f | Nop
0f30 | Nop
0f31 | Nop
0f32 | Nop
0f33 | Nop
0f34 | Nop
0f35 | Nop
0f36 | Nop
0f37 | Nop
0f38 | Nop
0f39 | Nop
0f3a | Nop
0f3b | Nop
0f3c | Nop
0f3d | Nop
0f3e | Nop
0f3f | Nop
0f40 | Nop
0f41 | Nop
0f42 | Nop
0f43 | Nop
0f44 | Nop
0f45 | Nop
0f46 | Nop
0f47 | Nop
0f48 | Nop
0f49 | Nop
0f4a | Nop
0f4b | Nop
0f4c | Nop
0f4d | Nop
0f4e | Nop
0f4f | Nop
0f50 | Nop
0f51 | Nop
0f52 | Nop
0f53 | Nop
0f54 | Nop
0f55 | Nop
0f56 | Nop
0f57 | Nop
0f58 | Nop
0f59 | Nop
0f5a | Nop
0f5b | Nop
0f5c | Nop
0f5d | Nop
0f5e | Nop
0f5f | Nop
0f60 | Nop
0f61 | Nop
0f62 | Nop
0f63 | Nop
0f64 | Nop
0f65 | Nop
0f66 | Nop
0f67 | Nop
0f68 | Nop
0f69 | Nop
0f6a | Nop
0f6b | Nop
0f6c | Nop
0f6d | Nop
0f6e | Nop
0f6f | Nop
0f70 | Nop
0f71 | Nop
0f72 | Nop
0f73 | Nop
0f74 | Nop
0f75 | Nop
0f76 | Nop
0f77 | Nop
0f78 | Nop
0f79 | Nop
0f7a | Nop
0f7b | Nop
0f7c | Nop
0f7d | Nop
0f7e | Nop
0f7f | Nop
0f80 | Nop
0f81 | Nop
0f82 | Nop
0f83 | Nop
0f84 | Nop
0f85 | Nop
0f86 | Nop
0f87 | Nop
0f88 | Nop
0f89 | Nop
0f8a | Nop
0f8b | Nop
0f8c | Nop
0f8d | Nop
0f8e | Nop
0f8f | Nop
0f90 | Nop
0f91 | Nop
0f92 | Nop
0f93 | Nop
0f94 | Nop
0f95 | Nop
0f96 | Nop
0f97 | Nop
0f98 | Nop
0f99 | Nop
0f9a | Nop
0f9b | Nop
0f9c | Nop
0f9d | Nop
0f9e | Nop
0f9f | Nop
0fa0 | Nop
0fa1 | Nop
0fa2 | Nop
0fa3 | Nop
0fa4 | Nop
0fa5 | Nop
0fa6 | Nop
0fa7 | Nop
0fa8 | Nop
0fa9 | Nop
0faa | Nop
0fab | Nop
0fac | Nop
0fad | Nop
0fae | Nop
0faf | Nop
0fb0 | Nop
0fb1 | Nop
0fb2 | Nop
0fb3 | Nop
0fb4 | Nop
0fb5 | Nop
0fb6 | Nop
0fb7 | Nop
0fb8 | Nop
0fb9 | Nop
0fba | Nop
0fbb | Nop
0fbc | Nop
0fbd | Nop
0fbe | Nop
0fbf | Nop
0fc0 | Nop
0fc1 | Nop
0fc2 | Nop
0fc3 | Nop
0fc4 | Nop
0fc5 | Nop
0fc6 | Nop
0fc7 | Nop
0fc8 | Nop
0fc9 | Nop
0fca | Nop
0fcb | Nop
0fcc | Nop
0fcd | Nop
0fce | Nop
0fcf | Nop
0fd0 | Nop
0fd1 | Nop
0fd2 | Nop
0fd3 | Nop
0fd4 | Nop
0fd5 | Nop
0fd6 | Nop
0fd7 | Nop
0fd8 | Nop
0fd9 | Nop
0fda | Nop
0fdb | Nop
0fdc | Nop
0fdd | Nop
0fde | Nop
0fdf | Nop
0fe0 | Nop
0fe1 | Nop
0fe2 | Nop
0fe3 | Nop
0fe4 | Nop
0fe5 | Nop
0fe6 | Nop
0fe7 | Nop
0fe8 | Nop
0fe9 | Nop
0fea | Nop
0feb | Nop
0fec | Nop
0fed | Nop
0fee | Nop
0fef | Nop
0ff0 | Nop
0ff1 | Nop
0ff2 | Nop
0ff3 | Nop
0ff4 | Nop
0ff5 | Nop
0ff6 | Nop
0ff7 | Nop
0ff8 | Nop
0ff9 | Nop
0ffa | Nop
0ffb | Nop
0ffc | Nop
0ffd | Nop
0ffe | Nop
0fff | Nop
1000 | Nop
1001 | Nop
1002 | Nop
1003 | Nop
1004 | Nop
1005 | Nop
1006 | Nop
1007 | Nop
1008 | Nop
1009 | Nop
100a | Nop
100b | Nop
100c | Nop
100d | Nop
100e | Nop
100f | Nop
1010 | Nop
1011 | Nop
1012 | Nop
1013 | Nop
1014 | Nop
1015 | Nop
1016 | Nop
1017 | Nop
1018 | Nop
1019 | Nop
101a | Nop
101b | Nop
101c | Nop
101d | Nop
101e | Nop
101f | Nop
1020 | Nop
1021 | Nop
1022 | Nop
1023 | Nop
1024 | Nop
1025 | Nop
1026 | Nop
1027 | Nop
1028 | Nop
1029 | Nop
102a | Nop
102b | Nop
102c | Nop
102d | Nop
102e | Nop
102f | Nop
1030 | Nop
1031 | Nop
1032 | Nop
1033 | Nop
1034 | Nop
1035 | Nop
1036 | Nop
1037 | Nop
1038 | Nop
1039 | Nop
103a | Nop
103b | Nop
103c | Nop
103d | Nop
103e | Nop
103f | Nop
1040 | Nop
1041 | Nop
1042 | Nop
1043 | Nop
1044 | Nop
1045 | Nop
1046 | Nop
1047 | Nop
1048 | Nop
1049 | Nop
104a | Nop
104b | Nop
104c | Nop
104d | Nop
104e | Nop
104f | Nop
1050 | Nop
1051 | Nop
1052 | Nop
1053 | Nop
1054 | Nop
1055 | Nop
1056 | Nop
1057 | Nop
1058 | Nop
1059 | Nop
105a | Nop
105b | Nop
105c | Nop
105d | Nop
105e | Nop
105f | Nop
1060 | Nop
1061 | Nop
1062 | Nop
1063 | Nop
1064 | Nop
1065 | Nop
1066 | Nop
1067 | Nop
1068 | Nop
1069 | Nop
106a | Nop
106b | Nop
106c | Nop
106d | Nop
106e | Nop
106f | Nop
1070 | Nop
1071 | Nop
1072 | Nop
1073 | Nop
1074 | Nop
1075 | Nop
1076 | Nop
1077 | Nop
1078 | Nop
1079 | Nop
107a | Nop
107b | Nop
107c | Nop
107d | Nop
107e | Nop
107f | Nop
1080 | Nop
1081 | Nop
1082 | Nop
1083 | Nop
1084 | Nop
1085 | Nop
1086 | Nop
1087 | Nop
1088 | Nop
1089 | Nop
108a | Nop
108b | Nop
108c | Nop
108d | Nop
108e | Nop
108f | Nop
1090 | Nop
1091 | Nop
1092 | Nop
1093 | Nop
1094 | Nop
1095 | Nop
1096 | Nop
1097 | Nop
1098 | Nop
1099 | Nop
109a | Nop
109b | Nop
109c | Nop
109d | Nop
109e | Nop
109f | Nop
10a0 | Nop
10a1 | Nop
10a2 | Nop
10a3 | Nop
10a4 | Nop
10a5 | Nop
10a6 | Nop
10a7 | Nop
10a8 | Nop
10a9 | Nop
10aa | Nop
10ab | Nop
10ac | Nop
10ad | Nop
10ae | Nop
10af | Nop
10b0 | Nop
10b1 | Nop
10b2 | Nop
10b3 | Nop
10b4 | Nop
10b5 | Nop
10b6 | Nop
10b7 | Nop
10b8 | Nop
10b9 | Nop
10ba | Nop
10bb | Nop
10bc | Nop
10bd | Nop
10be | Nop
10bf | Nop
10c0 | Nop
10c1 | Nop
10c2 | Nop
10c3 | Nop
10c4 | Nop
10c5 | Nop
10c6 | Nop
10c7 | Nop
10c8 | Nop
10c9 | Nop
10ca | Nop
10cb | Nop
10cc | Nop
10cd | Nop
10ce | Nop
10cf | Nop
10d0 | Nop
10d1 | Nop
10d2 | Nop
10d3 | Nop
10d4 | Nop
10d5 | Nop
10d6 | Nop
10d7 | Nop
10d8 | Nop
10d9 | Nop
10da | Nop
10db | Nop
10dc | Nop
10dd | Nop
10de | Nop
10df | Nop
10e0 | Nop
10e1 | Nop
10e2 | Nop
10e3 | Nop
10e4 | Nop
10e5 | Nop
10e6 | Nop
10e7 | Nop
10e8 | Nop
10e9 | Nop
10ea | Nop
10eb | Nop
10ec | Nop
10ed | Nop
10ee | Nop
10ef | Nop
10f0 | Nop
10f1 | Nop
10f2 | Nop
10f3 | Nop
10f4 | Nop
10f5 | Nop
10f6 | Nop
10f7 | Nop
10f8 | Nop
10f9 | Nop
10fa | Nop
10fb | Nop
10fc | Nop
10fd | Nop
10fe | Nop
10ff | Nop
1100 | Nop
1101 | Nop
1102 | Nop
1103 | Nop
1104 | Nop
1105 | Nop
1106 | Nop
1107 | Nop
1108 | Nop
1109 | Nop
110a | Nop
110b | Nop
110c | Nop
110d | Nop
110e | Nop
110f | Nop
1110 | Nop
1111 | Nop
1112 | Nop
1113 | Nop
1114 | Nop
1115 | Nop
1116 | Nop
1117 | Nop
1118 | Nop
1119 | Nop
111a | Nop
111b | Nop
111c | Nop
111d | Nop
111e | Nop
111f | Nop
1120 | Nop
1121 | Nop
1122 | Nop
1123 | Nop
1124 | Nop
1125 | Nop
1126 | Nop
1127 | Nop
1128 | Nop
1129 | Nop
112a | Nop
112b | Nop
112c | Nop
112d | Nop
112e | Nop
112f | Nop
1130 | Nop
1131 | Nop
1132 | Nop
1133 | Nop
1134 | Nop
1135 | Nop
1136 | Nop
1137 | Nop
1138 | Nop
1139 | Nop
113a | Nop
113b | Nop
113c | Nop
113d | Nop
113e | Nop
113f | Nop
1140 | Nop
1141 | Nop
1142 | Nop
1143 | Nop
1144 | Nop
1145 | Nop
1146 | Nop
1147 | Nop
1148 | Nop
1149 | Nop
114a | Nop
114b | Nop
114c | Nop
114d | Nop
114e | Nop
114f | Nop
1150 | Nop
1151 | Nop
1152 | Nop
1153 | Nop
1154 | Nop
1155 | Nop
1156 | Nop
1157 | Nop
1158 | Nop
1159 | Nop
115a | Nop
115b | Nop
115c | Nop
115d | Nop
115e | Nop
115f | Nop
1160 | Nop
1161 | Nop
1162 | Nop
1163 | Nop
1164 | Nop
1165 | Nop
1166 | Nop
1167 | Nop
1168 | Nop
1169 | Nop
116a | Nop
116b | Nop
116c | Nop
116d | Nop
116e | Nop
116f | Nop
1170 | Nop
1171 | Nop
1172 | Nop
1173 | Nop
1174 | Nop
1175 | Nop
1176 | Nop
1177 | Nop
1178 | Nop
1179 | Nop
117a | Nop
117b | Nop
117c | Nop
117d | Nop
117e | Nop
117f | Nop
1180 | Nop
1181 | Nop
1182 | Nop
1183 | Nop
1184 | Nop
1185 | Nop
1186 | Nop
1187 | Nop
1188 | Nop
1189 | Nop
118a | Nop
118b | Nop
118c | Nop
118d | Nop
118e | Nop
118f | Nop
1190 | Nop
1191 | Nop
1192 | Nop
1193 | Nop
1194 | Nop
1195 | Nop
1196 | Nop
1197 | Nop
1198 | Nop
1199 | Nop
119a | Nop
119b | Nop
119c | Nop
119d | Nop
119e | Nop
119f | Nop
11a0 | Nop
11a1 | Nop
11a2 | Nop
11a3 | Nop
11a4 | Nop
11a5 | Nop
11a6 | Nop
11a7 | Nop
11a8 | Nop
11a9 | Nop
11aa | Nop
11ab | Nop
11ac | Nop
11ad | Nop
11ae | Nop
11af | Nop
11b0 | Nop
11b1 | Nop
11b2 | Nop
11b3 | Nop
11b4 | Nop
11b5 | Nop
11b6 | Nop
11b7 | Nop
11b8 | Nop
11b9 | Nop
11ba | Nop
11bb | Nop
11bc | Nop
11bd | Nop
11be | Nop
11bf | Nop
11c0 | Nop
11c1 | Nop
11c2 | Nop
11c3 | Nop
11c4 | Nop
11c5 | Nop
11c6 | Nop
11c7 | Nop
11c8 | Nop
11c9 | Nop
11ca | Nop
11cb | Nop
11cc | Nop
11cd | Nop
11ce | Nop
11cf | Nop
11d0 | Nop
11d1 | Nop
11d2 | Nop
11d3 | Nop
11d4 | Nop
11d5 | Nop
11d6 | Nop
11d7 | Nop
11d8 | Nop
11d9 | Nop
11da | Nop
11db | Nop
11dc | Nop
11dd | Nop
11de | Nop
11df | Nop
11e0 | Nop
11e1 | Nop
11e2 | Nop
11e3 | Nop
11e4 | Nop
11e5 | Nop
11e6 | Nop
11e7 | Nop
11e8 | Nop
11e9 | Nop
11ea | Nop
11eb | Nop
11ec | Nop
11ed | Nop
11ee | Nop
11ef | Nop
11f0 | Nop
11f1 | Nop
11f2 | Nop
11f3 | Nop
11f4 | Nop
11f5 | Nop
11f6 | Nop
11f7 | Nop
11f8 | Nop
11f9 | Nop
11fa | Nop
11fb | Nop
11fc | Nop
11fd | Nop
11fe | Nop
11ff | Nop
1200 | Nop
1201 | Nop
1202 | Nop
1203 | Nop
1204 | Nop
1205 | Nop
1206 | Nop
1207 | Nop
1208 | Nop
1209 | Nop
120a | Nop
120b | Nop
120c | Nop
120d | Nop
120e | Nop
120f | Nop
1210 | Nop
1211 | Nop
1212 | Nop
1213 | Nop
1214 | Nop
1215 | Nop
1216 | Nop
1217 | Nop
1218 | Nop
1219 | Nop
121a | Nop
121b | Nop
121c | Nop
121d | Nop
121e | Nop
121f | Nop
1220 | Nop
1221 | Nop
1222 | Nop
1223 | Nop
1224 | Nop
1225 | Nop
1226 | Nop
1227 | Nop
1228 | Nop
1229 | Nop
122a | Nop
122b | Nop
122c | Nop
122d | Nop
122e | Nop
122f | Nop
1230 | Nop
1231 | Nop
1232 | Nop
1233 | Nop
1234 | Nop
1235 | Nop
1236 | Nop
1237 | Nop
1238 | Nop
1239 | Nop
123a | Nop
123b | Nop
123c | Nop
123d | Nop
123e | Nop
123f | Nop
1240 | Nop
1241 | Nop
1242 | Nop
1243 | Nop
1244 | Nop
1245 | Nop
1246 | Nop
1247 | Nop
1248 | Nop
1249 | Nop
124a | Nop
124b | Nop
124c | Nop
124d | Nop
124e | Nop
124f | Nop
1250 | Nop
1251 | Nop
1252 | Nop
1253 | Nop
1254 | Nop
1255 | Nop
1256 | Nop
1257 | Nop
1258 | Nop
1259 | Nop
125a | Nop
125b | Nop
125c | Nop
125d | Nop
125e | Nop
125f | Nop
1260 | Nop
1261 | Nop
1262 | Nop
1263 | Nop
1264 | Nop
1265 | Nop
1266 | Nop
1267 | Nop
1268 | Nop
1269 | Nop
126a | Nop
126b | Nop
126c | Nop
126d | Nop
126e | Nop
126f | Nop
1270 | Nop
1271 | Nop
1272 | Nop
1273 | Nop
1274 | Nop
1275 | Nop
1276 | Nop
1277 | Nop
1278 | Nop
1279 | Nop
127a | Nop
127b | Nop
127c | Nop
127d | Nop
127e | Nop
127f | Nop
1280 | Nop
1281 | Nop
1282 | Nop
1283 | Nop
1284 | Nop
1285 | Nop
1286 | Nop
1287 | Nop
1288 | Nop
1289 | Nop
128a | Nop
128b | Nop
128c | Nop
128d | Nop
128e | Nop
128f | Nop
1290 | Nop
1291 | Nop
1292 | Nop
1293 | Nop
1294 | Nop
1295 | Nop
1296 | Nop
1297 | Nop
1298 | Nop
1299 | Nop
129a | Nop
129b | Nop
129c | Nop
129d | Nop
129e | Nop
129f | Nop
12a0 | Nop
12a1 | Nop
12a2 | Nop
12a3 | Nop
12a4 | Nop
12a5 | Nop
12a6 | Nop
12a7 | Nop
12a8 | Nop
12a9 | Nop
12aa | Nop
12ab | Nop
12ac | Nop
12ad | Nop
12ae | Nop
12af | Nop
12b0 | Nop
12b1 | Nop
12b2 | Nop
12b3 | Nop
12b4 | Nop
12b5 | Nop
12b6 | Nop
12b7 | Nop
12b8 | Nop
12b9 | Nop
12ba | Nop
12bb | Nop
12bc | Nop
12bd | Nop
12be | Nop
12bf | Nop
12c0 | Nop
12c1 | Nop
12c2 | Nop
12c3 | Nop
12c4 | Nop
12c5 | Nop
12c6 | Nop
12c7 | Nop
12c8 | Nop
12c9 | Nop
12ca | Nop
12cb | Nop
12cc | Nop
12cd | Nop
12ce | Nop
12cf | Nop
12d0 | Nop
12d1 | Nop
12d2 | Nop
12d3 | Nop
12d4 | Nop
12d5 | Nop
12d6 | Nop
12d7 | Nop
12d8 | Nop
12d9 | Nop
12da | Nop
12db | Nop
12dc | Nop
12dd | Nop
12de | Nop
12df | Nop
12e0 | Nop
12e1 | Nop
12e2 | Nop
12e3 | Nop
12e4 | Nop
12e5 | Nop
12e6 | Nop
12e7 | Nop
12e8 | Nop
12e9 | Nop
12ea | Nop
12eb | Nop
12ec | Nop
12ed | Nop
12ee | Nop
12ef | Nop
12f0 | Nop
12f1 | Nop
12f2 | Nop
12f3 | Nop
12f4 | Nop
12f5 | Nop
12f6 | Nop
12f7 | Nop
12f8 | Nop
12f9 | Nop
12fa | Nop
12fb | Nop
12fc | Nop
12fd | Nop
12fe | Nop
12ff | Nop
1300 | Nop
1301 | Nop
1302 | Nop
1303 | Nop
1304 | Nop
1305 | Nop
1306 | Nop
1307 | Nop
1308 | Nop
1309 | Nop
130a | Nop
130b | Nop
130c | Nop
130d | Nop
130e | Nop
130f | Nop
1310 | Nop
1311 | Nop
1312 | Nop
1313 | Nop
1314 | Nop
1315 | Nop
1316 | Nop
1317 | Nop
1318 | Nop
1319 | Nop
131a | Nop
131b | Nop
131c | Nop
131d | Nop
131e | Nop
131f | Nop
1320 | Nop
1321 | Nop
1322 | Nop
1323 | Nop
1324 | Nop
1325 | Nop
1326 | Nop
1327 | Nop
1328 | Nop
1329 | Nop
132a | Nop
132b | Nop
132c | Nop
132d | Nop
132e | Nop
132f | Nop
1330 | Nop
1331 | Nop
1332 | Nop
1333 | Nop
1334 | Nop
1335 | Nop
1336 | Nop
1337 | Nop
1338 | Nop
1339 | Nop
133a | Nop
133b | Nop
133c | Nop
133d | Nop
133e | Nop
133f | Nop
1340 | Nop
1341 | Nop
1342 | Nop
1343 | Nop
1344 | Nop
1345 | Nop
1346 | Nop
1347 | Nop
1348 | Nop
1349 | Nop
134a | Nop
134b | Nop
134c | Nop
134d | Nop
134e | Nop
134f | Nop
1350 | Nop
1351 | Nop
1352 | Nop
1353 | Nop
1354 | Nop
1355 | Nop
1356 | Nop
1357 | Nop
1358 | Nop
1359 | Nop
135a | Nop
135b | Nop
135c | Nop
135d | Nop
135e | Nop
135f | Nop
1360 | Nop
1361 | Nop
1362 | Nop
1363 | Nop
1364 | Nop
1365 | Nop
1366 | Nop
1367 | Nop
1368 | Nop
1369 | Nop
136a | Nop
136b | Nop
136c | Nop
136d | Nop
136e | Nop
136f | Nop
1370 | Nop
1371 | Nop
1372 | Nop
1373 | Nop
1374 | Nop
1375 | Nop
1376 | Nop
1377 | Nop
1378 | Nop
1379 | Nop
137a | Nop
137b | Nop
137c | Nop
137d | Nop
137e | Nop
137f | Nop
1380 | Nop
1381 | Nop
1382 | Nop
1383 | Nop
1384 | Nop
1385 | Nop
1386 | Nop
1387 | Nop
1388 | Nop
1389 | Nop
138a | Nop
138b | Nop
138c | Nop
138d | Nop
138e | Nop
138f | Nop
1390 | Nop
1391 | Nop
1392 | Nop
1393 | Nop
1394 | Nop
1395 | Nop
1396 | Nop
1397 | Nop
1398 | Nop
1399 | Nop
139a | Nop
139b | Nop
139c | Nop
139d | Nop
139e | Nop
139f | Nop
13a0 | Nop
13a1 | Nop
13a2 | Nop
13a3 | Nop
13a4 | Nop
13a5 | Nop
13a6 | Nop
13a7 | Nop
13a8 | Nop
13a9 | Nop
13aa | Nop
13ab | Nop
13ac | Nop
13ad | Nop
13ae | Nop
13af | Nop
13b0 | Nop
13b1 | Nop
13b2 | Nop
13b3 | Nop
13b4 | Nop
13b5 | Nop
13b6 | Nop
13b7 | Nop
13b8 | Nop
13b9 | Nop
13ba | Nop
13bb | Nop
13bc | Nop
13bd | Nop
13be | Nop
13bf | Nop
13c0 | Nop
13c1 | Nop
13c2 | Nop
13c3 | Nop
13c4 | Nop
13c5 | Nop
13c6 | Nop
13c7 | Nop
13c8 | Nop
13c9 | Nop
13ca | Nop
13cb | Nop
13cc | Nop
13cd | Nop
13ce | Nop
13cf | Nop
13d0 | Nop
13d1 | Nop
13d2 | Nop
13d3 | Nop
13d4 | Nop
13d5 | Nop
13d6 | Nop
13d7 | Nop
13d8 | Nop
13d9 | Nop
13da | Nop
13db | Nop
13dc | Nop
13dd | Nop
13de | Nop
13df | Nop
13e0 | Nop
13e1 | Nop
13e2 | Nop
13e3 | Nop
13e4 | Nop
13e5 | Nop
13e6 | Nop
13e7 | Nop
13e8 | Nop
13e9 | Nop
13ea | Nop
13eb | Nop
13ec | Nop
13ed | Nop
13ee | Nop
13ef | Nop
13f0 | Nop
13f1 | Nop
13f2 | Nop
13f3 | Nop
13f4 | Nop
13f5 | Nop
13f6 | Nop
13f7 | Nop
13f8 | Nop
13f9 | Nop
13fa | Nop
13fb | Nop
13fc | Nop
13fd | Nop
13fe | Nop
13ff | Nop
1400 | Nop
1401 | Call(Unconditional, 1474)
1404 | Nop
1405 | Push(Bc)
1406 | Push(Hl)
1407 | LoadAccumulator(De)
1408 | Out(0004)
140a | In(0003)
140c | ToAccumulator(Or, MemoryRef)
140d | Move { destination: MemoryRef, source: A }
140e | IncrementPair(Hl)
140f | IncrementPair(De)
1410 | ToAccumulator(Xor, A)
1411 | Out(0004)
1413 | In(0003)
1415 | ToAccumulator(Or, MemoryRef)
1416 | Move { destination: MemoryRef, source: A }
1417 | Pop(Hl)
1418 | LoadLargeImmediate(Bc, 0020)
141b | AddToHl(Bc)
141c | Pop(Bc)
141d | Decrement(B)
141e | Jump(NonZero, 1405)
1421 | ReturnFromSubroutine(Unconditional)
1422 | Nop
1423 | Nop
1424 | Call(Unconditional, 1474)
1427 | Push(Bc)
1428 | Push(Hl)
1429 | ToAccumulator(Xor, A)
142a | Move { destination: MemoryRef, source: A }
142b | IncrementPair(Hl)
142c | Move { destination: MemoryRef, source: A }
142d | IncrementPair(Hl)
142e | Pop(Hl)
142f | LoadLargeImmediate(Bc, 0020)
1432 | AddToHl(Bc)
1433 | Pop(Bc)
1434 | Decrement(B)
1435 | Jump(NonZero, 1427)
1438 | ReturnFromSubroutine(Unconditional)
1439 | Push(Bc)
143a | LoadAccumulator(De)
143b | Move { destination: MemoryRef, source: A }
143c | IncrementPair(De)
143d | LoadLargeImmediate(Bc, 0020)
1440 | AddToHl(Bc)
1441 | Pop(Bc)
1442 | Decrement(B)
1443 | Jump(NonZero, 1439)
1446 | ReturnFromSubroutine(Unconditional)
1447 | Nop
1448 | Nop
1449 | Nop
144a | Nop
144b | Nop
144c | Nop
144d | Nop
144e | Nop
144f | Nop
1450 | Nop
1451 | Nop
1452 | Call(Unconditional, 1474)
1455 | Push(Bc)
1456 | Push(Hl)
1457 | LoadAccumulator(De)
1458 | Out(0004)
145a | In(0003)
145c | ComplementAccumulator
145d | ToAccumulator(And, MemoryRef)
145e | Move { destination: MemoryRef, source: A }
145f | IncrementPair(Hl)
1460 | IncrementPair(De)
1461 | ToAccumulator(Xor, A)
1462 | Out(0004)
1464 | In(0003)
1466 | ComplementAccumulator
1467 | ToAccumulator(And, MemoryRef)
1468 | Move { destination: MemoryRef, source: A }
1469 | Pop(Hl)
146a | LoadLargeImmediate(Bc, 0020)
146d | AddToHl(Bc)
146e | Pop(Bc)
146f | Decrement(B)
1470 | Jump(NonZero, 1455)
1473 | ReturnFromSubroutine(Unconditional)
1474 | Move { destination: A, source: L }
1475 | ToAccumulatorImmediate(And, 0007)
1477 | Out(0002)
1479 | Jump(Unconditional, 1a47)
147c | Push(Bc)
147d | Push(Hl)
147e | Move { destination: A, source: MemoryRef }
147f | StoreAccumulator(De)
1480 | IncrementPair(De)
1481 | IncrementPair(Hl)
1482 | Decrement(C)
1483 | Jump(NonZero, 147e)
1486 | Pop(Hl)
1487 | LoadLargeImmediate(Bc, 0020)
148a | AddToHl(Bc)
148b | Pop(Bc)
148c | Decrement(B)
148d | Jump(NonZero, 147c)
1490 | ReturnFromSubroutine(Unconditional)
1491 | Call(Unconditional, 1474)
1494 | ToAccumulator(Xor, A)
1495 | DirectAddress(StoreAccumulator, 2061)
1498 | Push(Bc)
1499 | Push(Hl)
149a | LoadAccumulator(De)
149b | Out(0004)
149d | In(0003)
149f | Push(FlagsA)
14a0 | ToAccumulator(And, MemoryRef)
14a1 | Jump(Zero, 14a9)
14a4 | LoadImmediate(A, 0001)
14a6 | DirectAddress(StoreAccumulator, 2061)
14a9 | Pop(FlagsA)
14aa | ToAccumulator(Or, MemoryRef)
14ab | Move { destination: MemoryRef, source: A }
14ac | IncrementPair(Hl)
14ad | IncrementPair(De)
14ae | ToAccumulator(Xor, A)
14af | Out(0004)
14b1 | In(0003)
14b3 | Push(FlagsA)
14b4 | ToAccumulator(And, MemoryRef)
14b5 | Jump(Zero, 14bd)
14b8 | LoadImmediate(A, 0001)
14ba | DirectAddress(StoreAccumulator, 2061)
14bd | Pop(FlagsA)
14be | ToAccumulator(Or, MemoryRef)
14bf | Move { destination: MemoryRef, source: A }
14c0 | Pop(Hl)
14c1 | LoadLargeImmediate(Bc, 0020)
14c4 | AddToHl(Bc)
14c5 | Pop(Bc)
14c6 | Decrement(B)
14c7 | Jump(NonZero, 1498)
14ca | ReturnFromSubroutine(Unconditional)
14cb | ToAccumulator(Xor, A)
14cc | Push(Bc)
14cd | Move { destination: MemoryRef, source: A }
14ce | LoadLargeImmediate(Bc, 0020)
14d1 | AddToHl(Bc)
14d2 | Pop(Bc)
14d3 | Decrement(B)
14d4 | Jump(NonZero, 14cc)
14d7 | ReturnFromSubroutine(Unconditional)
14d8 | DirectAddress(LoadAccumulator, 2025)
14db | ToAccumulatorImmediate(Compare, 0005)
14dd | ReturnFromSubroutine(Zero)
14de | ToAccumulatorImmediate(Compare, 0002)
14e0 | ReturnFromSubroutine(NonZero)
14e1 | DirectAddress(LoadAccumulator, 2029)
14e4 | ToAccumulatorImmediate(Compare, 00d8)
14e6 | Move { destination: B, source: A }
14e7 | Jump(NoCarry, 1530)
14ea | DirectAddress(LoadAccumulator, 2002)
14ed | ToAccumulator(And, A)
14ee | ReturnFromSubroutine(Zero)
14ef | Move { destination: A, source: B }
14f0 | ToAccumulatorImmediate(Compare, 00ce)
14f2 | Jump(NoCarry, 1579)
14f5 | ToAccumulatorImmediate(Add, 0006)
14f7 | Move { destination: B, source: A }
14f8 | DirectAddress(LoadAccumulator, 2009)
14fb | ToAccumulatorImmediate(Compare, 0090)
14fd | Jump(NoCarry, 1504)
1500 | ToAccumulator(Compare, B)
1501 | Jump(NoCarry, 1530)
1504 | Move { destination: L, source: B }
1505 | Call(Unconditional, 1562)
1508 | DirectAddress(LoadAccumulator, 202a)
150b | Move { destination: H, source: A }
150c | Call(Unconditional, 156f)
150f | DirectAddress(StoreHl, 2064)
1512 | LoadImmediate(A, 0005)
1514 | DirectAddress(StoreAccumulator, 2025)
1517 | Call(Unconditional, 1581)
151a | Move { destination: A, source: MemoryRef }
151b | ToAccumulator(And, A)
151c | Jump(Zero, 1530)
151f | LoadImmediate(MemoryRef, 0000)
1521 | Call(Unconditional, 0a5f)
1524 | Call(Unconditional, 1a3b)
1527 | Call(Unconditional, 15d3)
152a | LoadImmediate(A, 0010)
152c | DirectAddress(StoreAccumulator, 2003)
152f | ReturnFromSubroutine(Unconditional)
1530 | LoadImmediate(A, 0003)
1532 | DirectAddress(StoreAccumulator, 2025)
1535 | Jump(Unconditional, 154a)
1538 | LoadLargeImmediate(Hl, 2003)
153b | Decrement(MemoryRef)
153c | ReturnFromSubroutine(NonZero)
153d | DirectAddress(LoadHl, 2064)
1540 | LoadImmediate(B, 0010)
1542 | Call(Unconditional, 1424)
1545 | LoadImmediate(A, 0004)
1547 | DirectAddress(StoreAccumulator, 2025)
154a | ToAccumulator(Xor, A)
154b | DirectAddress(StoreAccumulator, 2002)
154e | LoadImmediate(B, 00f7)
1550 | Jump(Unconditional, 19dc)
1553 | Nop
1554 | LoadImmediate(C, 0000)
1556 | ToAccumulator(Compare, H)
1557 | Call(NoCarry, 1590)
155a | ToAccumulator(Compare, H)
155b | ReturnFromSubroutine(NoCarry)
155c | ToAccumulatorImmediate(Add, 0010)
155e | Increment(C)
155f | Jump(Unconditional, 155a)
1562 | DirectAddress(LoadAccumulator, 2009)
1565 | Move { destination: H, source: L }
1566 | Call(Unconditional, 1554)
1569 | Move { destination: B, source: C }
156a | Decrement(B)
156b | ToAccumulatorImmediate(SubtractWithBorrow, 0010)
156d | Move { destination: L, source: A }
156e | ReturnFromSubroutine(Unconditional)
156f | DirectAddress(LoadAccumulator, 200a)
1572 | Call(Unconditional, 1554)
1575 | ToAccumulatorImmediate(SubtractWithBorrow, 0010)
1577 | Move { destination: H, source: A }
1578 | ReturnFromSubroutine(Unconditional)
1579 | LoadImmediate(A, 0001)
157b | DirectAddress(StoreAccumulator, 2085)
157e | Jump(Unconditional, 1545)
1581 | Move { destination: A, source: B }
1582 | RotateAccumulator(Left)
1583 | RotateAccumulator(Left)
1584 | RotateAccumulator(Left)
1585 | ToAccumulator(Add, B)
1586 | ToAccumulator(Add, B)
1587 | ToAccumulator(Add, B)
1588 | ToAccumulator(Add, C)
1589 | Decrement(A)
158a | Move { destination: L, source: A }
158b | DirectAddress(LoadAccumulator, 2067)
158e | Move { destination: H, source: A }
158f | ReturnFromSubroutine(Unconditional)
1590 | Increment(C)
1591 | ToAccumulatorImmediate(Add, 0010)
1593 | Jump(Minus, 1590)
1596 | ReturnFromSubroutine(Unconditional)
1597 | DirectAddress(LoadAccumulator, 200d)
159a | ToAccumulator(And, A)
159b | Jump(NonZero, 15b7)
159e | LoadLargeImmediate(Hl, 3ea4)
15a1 | Call(Unconditional, 15c5)
15a4 | ReturnFromSubroutine(NoCarry)
15a5 | LoadImmediate(B, 00fe)
15a7 | LoadImmediate(A, 0001)
15a9 | DirectAddress(StoreAccumulator, 200d)
15ac | Move { destination: A, source: B }
15ad | DirectAddress(StoreAccumulator, 2008)
15b0 | DirectAddress(LoadAccumulator, 200e)
15b3 | DirectAddress(StoreAccumulator, 2007)
15b6 | ReturnFromSubroutine(Unconditional)
15b7 | LoadLargeImmediate(Hl, 2524)
15ba | Call(Unconditional, 15c5)
15bd | ReturnFromSubroutine(NoCarry)
15be | Call(Unconditional, 18f1)
15c1 | ToAccumulator(Xor, A)
15c2 | Jump(Unconditional, 15a9)
15c5 | LoadImmediate(B, 0017)
15c7 | Move { destination: A, source: MemoryRef }
15c8 | ToAccumulator(And, A)
15c9 | Jump(NonZero, 166b)
15cc | IncrementPair(Hl)
15cd | Decrement(B)
15ce | Jump(NonZero, 15c7)
15d1 | ReturnFromSubroutine(Unconditional)
15d2 | Nop
15d3 | Call(Unconditional, 1474)
15d6 | Push(Hl)
15d7 | Push(Bc)
15d8 | Push(Hl)
15d9 | LoadAccumulator(De)
15da | Out(0004)
15dc | In(0003)
15de | Move { destination: MemoryRef, source: A }
15df | IncrementPair(Hl)
15e0 | IncrementPair(De)
15e1 | ToAccumulator(Xor, A)
15e2 | Out(0004)
15e4 | In(0003)
15e6 | Move { destination: MemoryRef, source: A }
15e7 | Pop(Hl)
15e8 | LoadLargeImmediate(Bc, 0020)
15eb | AddToHl(Bc)
15ec | Pop(Bc)
15ed | Decrement(B)
15ee | Jump(NonZero, 15d7)
15f1 | Pop(Hl)
15f2 | ReturnFromSubroutine(Unconditional)
15f3 | Call(Unconditional, 1611)
15f6 | LoadLargeImmediate(Bc, 3700)
15f9 | Move { destination: A, source: MemoryRef }
15fa | ToAccumulator(And, A)
15fb | Jump(Zero, 15ff)
15fe | Increment(C)
15ff | IncrementPair(Hl)
1600 | Decrement(B)
1601 | Jump(NonZero, 15f9)
1604 | Move { destination: A, source: C }
1605 | DirectAddress(StoreAccumulator, 2082)
1608 | ToAccumulatorImmediate(Compare, 0001)
160a | ReturnFromSubroutine(NonZero)
160b | LoadLargeImmediate(Hl, 206b)
160e | LoadImmediate(MemoryRef, 0001)
1610 | ReturnFromSubroutine(Unconditional)
1611 | LoadImmediate(L, 0000)
1613 | DirectAddress(LoadAccumulator, 2067)
1616 | Move { destination: H, source: A }
1617 | ReturnFromSubroutine(Unconditional)
1618 | DirectAddress(LoadAccumulator, 2015)
161b | ToAccumulatorImmediate(Compare, 00ff)
161d | ReturnFromSubroutine(NonZero)
161e | LoadLargeImmediate(Hl, 2010)
1621 | Move { destination: A, source: MemoryRef }
1622 | IncrementPair(Hl)
1623 | Move { destination: B, source: MemoryRef }
1624 | ToAccumulator(Or, B)
1625 | ReturnFromSubroutine(NonZero)
1626 | DirectAddress(LoadAccumulator, 2025)
1629 | ToAccumulator(And, A)
162a | ReturnFromSubroutine(NonZero)
162b | DirectAddress(LoadAccumulator, 20ef)
162e | ToAccumulator(And, A)
162f | Jump(Zero, 1652)
1632 | DirectAddress(LoadAccumulator, 202d)
1635 | ToAccumulator(And, A)
1636 | Jump(NonZero, 1648)
1639 | Call(Unconditional, 17c0)
163c | ToAccumulatorImmediate(And, 0010)
163e | ReturnFromSubroutine(Zero)
163f | LoadImmediate(A, 0001)
1641 | DirectAddress(StoreAccumulator, 2025)
1644 | DirectAddress(StoreAccumulator, 202d)
1647 | ReturnFromSubroutine(Unconditional)
1648 | Call(Unconditional, 17c0)
164b | ToAccumulatorImmediate(And, 0010)
164d | ReturnFromSubroutine(NonZero)
164e | DirectAddress(StoreAccumulator, 202d)
1651 | ReturnFromSubroutine(Unconditional)
1652 | LoadLargeImmediate(Hl, 2025)
1655 | LoadImmediate(MemoryRef, 0001)
1657 | DirectAddress(LoadHl, 20ed)
165a | IncrementPair(Hl)
165b | Move { destination: A, source: L }
165c | ToAccumulatorImmediate(Compare, 007e)
165e | Jump(Carry, 1663)
1661 | LoadImmediate(L, 0074)
1663 | DirectAddress(StoreHl, 20ed)
1666 | Move { destination: A, source: MemoryRef }
1667 | DirectAddress(StoreAccumulator, 201d)
166a | ReturnFromSubroutine(Unconditional)
166b | SetCarry
166c | ReturnFromSubroutine(Unconditional)
166d | ToAccumulator(Xor, A)
166e | Call(Unconditional, 1a8b)
1671 | Call(Unconditional, 1910)
1674 | LoadImmediate(MemoryRef, 0000)
1676 | Call(Unconditional, 09ca)
1679 | IncrementPair(Hl)
167a | LoadLargeImmediate(De, 20f5)
167d | LoadAccumulator(De)
167e | ToAccumulator(Compare, MemoryRef)
167f | DecrementPair(De)
1680 | DecrementPair(Hl)
1681 | LoadAccumulator(De)
1682 | Jump(Zero, 168b)
1685 | Jump(NoCarry, 1698)
1688 | Jump(Unconditional, 168f)
168b | ToAccumulator(Compare, MemoryRef)
168c | Jump(NoCarry, 1698)
168f | Move { destination: A, source: MemoryRef }
1690 | StoreAccumulator(De)
1691 | IncrementPair(De)
1692 | IncrementPair(Hl)
1693 | Move { destination: A, source: MemoryRef }
1694 | StoreAccumulator(De)
1695 | Call(Unconditional, 1950)
1698 | DirectAddress(LoadAccumulator, 20ce)
169b | ToAccumulator(And, A)
169c | Jump(Zero, 16c9)
169f | LoadLargeImmediate(Hl, 2803)
16a2 | LoadLargeImmediate(De, 1aa6)
16a5 | LoadImmediate(C, 0014)
16a7 | Call(Unconditional, 0a93)
16aa | Decrement(H)
16ab | Decrement(H)
16ac | LoadImmediate(B, 001b)
16ae | DirectAddress(LoadAccumulator, 2067)
16b1 | RotateAccumulator(Right)
16b2 | Jump(Carry, 16b7)
16b5 | LoadImmediate(B, 001c)
16b7 | Move { destination: A, source: B }
16b8 | Call(Unconditional, 08ff)
16bb | Call(Unconditional, 0ab1)
16be | Call(Unconditional, 18e7)
16c1 | Move { destination: A, source: MemoryRef }
16c2 | ToAccumulator(And, A)
16c3 | Jump(Zero, 16c9)
16c6 | Jump(Unconditional, 02ed)
16c9 | LoadLargeImmediate(Hl, 2d18)
16cc | LoadLargeImmediate(De, 1aa6)
16cf | LoadImmediate(C, 000a)
16d1 | Call(Unconditional, 0a93)
16d4 | Call(Unconditional, 0ab6)
16d7 | Call(Unconditional, 09d6)
16da | ToAccumulator(Xor, A)
16db | DirectAddress(StoreAccumulator, 20ef)
16de | Out(0005)
16e0 | Call(Unconditional, 19d1)
16e3 | Jump(Unconditional, 0b89)
16e6 | LoadLargeImmediate(Sp, 2400)
16e9 | EnableInterrupts
16ea | ToAccumulator(Xor, A)
16eb | DirectAddress(StoreAccumulator, 2015)
16ee | Call(Unconditional, 14d8)
16f1 | LoadImmediate(B, 0004)
16f3 | Call(Unconditional, 18fa)
16f6 | Call(Unconditional, 0a59)
16f9 | Jump(NonZero, 16ee)
16fc | Call(Unconditional, 19d7)
16ff | LoadLargeImmediate(Hl, 2701)
1702 | Call(Unconditional, 19fa)
1705 | ToAccumulator(Xor, A)
1706 | Call(Unconditional, 1a8b)
1709 | LoadImmediate(B, 00fb)
170b | Jump(Unconditional, 196b)
170e | Call(Unconditional, 09ca)
1711 | IncrementPair(Hl)
1712 | Move { destination: A, source: MemoryRef }
1713 | LoadLargeImmediate(De, 1cb8)
1716 | LoadLargeImmediate(Hl, 1aa1)
1719 | LoadImmediate(C, 0004)
171b | Move { destination: B, source: A }
171c | LoadAccumulator(De)
171d | ToAccumulator(Compare, B)
171e | Jump(NoCarry, 1727)
1721 | IncrementPair(Hl)
1722 | IncrementPair(De)
1723 | Decrement(C)
1724 | Jump(NonZero, 171c)
1727 | Move { destination: A, source: MemoryRef }
1728 | DirectAddress(StoreAccumulator, 20cf)
172b | ReturnFromSubroutine(Unconditional)
172c | DirectAddress(LoadAccumulator, 2025)
172f | ToAccumulatorImmediate(Compare, 0000)
1731 | Jump(NonZero, 1739)
1734 | LoadImmediate(B, 00fd)
1736 | Jump(Unconditional, 19dc)
1739 | LoadImmediate(B, 0002)
173b | Jump(Unconditional, 18fa)
173e | Nop
173f | Nop
1740 | LoadLargeImmediate(Hl, 209b)
1743 | Decrement(MemoryRef)
1744 | Call(Zero, 176d)
1747 | DirectAddress(LoadAccumulator, 2068)
174a | ToAccumulator(And, A)
174b | Jump(Zero, 176d)
174e | LoadLargeImmediate(Hl, 2096)
1751 | Decrement(MemoryRef)
1752 | ReturnFromSubroutine(NonZero)
1753 | LoadLargeImmediate(Hl, 2098)
1756 | Move { destination: A, source: MemoryRef }
1757 | Out(0005)
1759 | DirectAddress(LoadAccumulator, 2082)
175c | ToAccumulator(And, A)
175d | Jump(Zero, 176d)
1760 | DecrementPair(Hl)
1761 | Move { destination: A, source: MemoryRef }
1762 | DecrementPair(Hl)
1763 | Move { destination: MemoryRef, source: A }
1764 | DecrementPair(Hl)
1765 | LoadImmediate(MemoryRef, 0001)
1767 | LoadImmediate(A, 0004)
1769 | DirectAddress(StoreAccumulator, 209b)
176c | ReturnFromSubroutine(Unconditional)
176d | DirectAddress(LoadAccumulator, 2098)
1770 | ToAccumulatorImmediate(And, 0030)
1772 | Out(0005)
1774 | ReturnFromSubroutine(Unconditional)
1775 | DirectAddress(LoadAccumulator, 2095)
1778 | ToAccumulator(And, A)
1779 | Jump(Zero, 17aa)
177c | LoadLargeImmediate(Hl, 1a11)
177f | LoadLargeImmediate(De, 1a21)
1782 | DirectAddress(LoadAccumulator, 2082)
1785 | ToAccumulator(Compare, MemoryRef)
1786 | Jump(NoCarry, 178e)
1789 | IncrementPair(Hl)
178a | IncrementPair(De)
178b | Jump(Unconditional, 1785)
178e | LoadAccumulator(De)
178f | DirectAddress(StoreAccumulator, 2097)
1792 | LoadLargeImmediate(Hl, 2098)
1795 | Move { destination: A, source: MemoryRef }
1796 | ToAccumulatorImmediate(And, 0030)
1798 | Move { destination: B, source: A }
1799 | Move { destination: A, source: MemoryRef }
179a | ToAccumulatorImmediate(And, 000f)
179c | RotateAccumulator(Left)
179d | ToAccumulatorImmediate(Compare, 0010)
179f | Jump(NonZero, 17a4)
17a2 | LoadImmediate(A, 0001)
17a4 | ToAccumulator(Or, B)
17a5 | Move { destination: MemoryRef, source: A }
17a6 | ToAccumulator(Xor, A)
17a7 | DirectAddress(StoreAccumulator, 2095)
17aa | LoadLargeImmediate(Hl, 2099)
17ad | Decrement(MemoryRef)
17ae | ReturnFromSubroutine(NonZero)
17af | LoadImmediate(B, 00ef)
17b1 | Jump(Unconditional, 19dc)
17b4 | LoadImmediate(B, 00ef)
17b6 | LoadLargeImmediate(Hl, 2098)
17b9 | Move { destination: A, source: MemoryRef }
17ba | ToAccumulator(And, B)
17bb | Move { destination: MemoryRef, source: A }
17bc | Out(0005)
17be | ReturnFromSubroutine(Unconditional)
17bf | Nop
17c0 | DirectAddress(LoadAccumulator, 2067)
17c3 | RotateAccumulator(Right)
17c4 | Jump(NoCarry, 17ca)
17c7 | In(0001)
17c9 | ReturnFromSubroutine(Unconditional)
17ca | In(0002)
17cc | ReturnFromSubroutine(Unconditional)
17cd | In(0002)
17cf | ToAccumulatorImmediate(And, 0004)
17d1 | ReturnFromSubroutine(Zero)
17d2 | DirectAddress(LoadAccumulator, 209a)
17d5 | ToAccumulator(And, A)
17d6 | ReturnFromSubroutine(NonZero)
17d7 | LoadLargeImmediate(Sp, 2400)
17da | LoadImmediate(B, 0004)
17dc | Call(Unconditional, 09d6)
17df | Decrement(B)
17e0 | Jump(NonZero, 17dc)
17e3 | LoadImmediate(A, 0001)
17e5 | DirectAddress(StoreAccumulator, 209a)
17e8 | Call(Unconditional, 19d7)
17eb | EnableInterrupts
17ec | LoadLargeImmediate(De, 1cbc)
17ef | LoadLargeImmediate(Hl, 3016)
17f2 | LoadImmediate(C, 0004)
17f4 | Call(Unconditional, 0a93)
17f7 | Call(Unconditional, 0ab1)
17fa | ToAccumulator(Xor, A)
17fb | DirectAddress(StoreAccumulator, 209a)
17fe | DirectAddress(StoreAccumulator, 2093)
1801 | Jump(Unconditional, 16c9)
1804 | LoadLargeImmediate(Hl, 2084)
1807 | Move { destination: A, source: MemoryRef }
1808 | ToAccumulator(And, A)
1809 | Jump(Zero, 0707)
180c | IncrementPair(Hl)
180d | Move { destination: A, source: MemoryRef }
180e | ToAccumulator(And, A)
180f | ReturnFromSubroutine(NonZero)
1810 | LoadImmediate(B, 0001)
1812 | Jump(Unconditional, 18fa)
1815 | LoadLargeImmediate(Hl, 2810)
1818 | LoadLargeImmediate(De, 1ca3)
181b | LoadImmediate(C, 0015)
181d | Call(Unconditional, 08f3)
1820 | LoadImmediate(A, 000a)
1822 | DirectAddress(StoreAccumulator, 206c)
1825 | LoadLargeImmediate(Bc, 1dbe)
1828 | Call(Unconditional, 1856)
182b | Jump(Carry, 1837)
182e | Call(Unconditional, 1844)
1831 | Jump(Unconditional, 1828)
1834 | Call(Unconditional, 0ab1)
1837 | LoadLargeImmediate(Bc, 1dcf)
183a | Call(Unconditional, 1856)
183d | ReturnFromSubroutine(Carry)
183e | Call(Unconditional, 184c)
1841 | Jump(Unconditional, 183a)
1844 | Push(Bc)
1845 | LoadImmediate(B, 0010)
1847 | Call(Unconditional, 1439)
184a | Pop(Bc)
184b | ReturnFromSubroutine(Unconditional)
184c | Push(Bc)
184d | DirectAddress(LoadAccumulator, 206c)
1850 | Move { destination: C, source: A }
1851 | Call(Unconditional, 0a93)
1854 | Pop(Bc)
1855 | ReturnFromSubroutine(Unconditional)
1856 | LoadAccumulator(Bc)
1857 | ToAccumulatorImmediate(Compare, 00ff)
1859 | SetCarry
185a | ReturnFromSubroutine(Zero)
185b | Move { destination: L, source: A }
185c | IncrementPair(Bc)
185d | LoadAccumulator(Bc)
185e | Move { destination: H, source: A }
185f | IncrementPair(Bc)
1860 | LoadAccumulator(Bc)
1861 | Move { destination: E, source: A }
1862 | IncrementPair(Bc)
1863 | LoadAccumulator(Bc)
1864 | Move { destination: D, source: A }
1865 | IncrementPair(Bc)
1866 | ToAccumulator(And, A)
1867 | ReturnFromSubroutine(Unconditional)
1868 | LoadLargeImmediate(Hl, 20c2)
186b | Increment(MemoryRef)
186c | IncrementPair(Hl)
186d | Move { destination: C, source: MemoryRef }
186e | Call(Unconditional, 01d9)
1871 | Move { destination: B, source: A }
1872 | DirectAddress(LoadAccumulator, 20ca)
1875 | ToAccumulator(Compare, B)
1876 | Jump(Zero, 1898)
1879 | DirectAddress(LoadAccumulator, 20c2)
187c | ToAccumulatorImmediate(And, 0004)
187e | DirectAddress(LoadHl, 20cc)
1881 | Jump(NonZero, 1888)
1884 | LoadLargeImmediate(De, 0030)
1887 | AddToHl(De)
1888 | DirectAddress(StoreHl, 20c7)
188b | LoadLargeImmediate(Hl, 20c5)
188e | Call(Unconditional, 1a3b)
1891 | ExchangeRegisters
1892 | Jump(Unconditional, 15d3)
1895 | Nop
1896 | Nop
1897 | Nop
1898 | LoadImmediate(A, 0001)
189a | DirectAddress(StoreAccumulator, 20cb)
189d | ReturnFromSubroutine(Unconditional)
189e | LoadLargeImmediate(Hl, 2050)
18a1 | LoadLargeImmediate(De, 1bc0)
18a4 | LoadImmediate(B, 0010)
18a6 | Call(Unconditional, 1a32)
18a9 | LoadImmediate(A, 0002)
18ab | DirectAddress(StoreAccumulator, 2080)
18ae | LoadImmediate(A, 00ff)
18b0 | DirectAddress(StoreAccumulator, 207e)
18b3 | LoadImmediate(A, 0004)
18b5 | DirectAddress(StoreAccumulator, 20c1)
18b8 | DirectAddress(LoadAccumulator, 2055)
18bb | ToAccumulatorImmediate(And, 0001)
18bd | Jump(Zero, 18b8)
18c0 | DirectAddress(LoadAccumulator, 2055)
18c3 | ToAccumulatorImmediate(And, 0001)
18c5 | Jump(NonZero, 18c0)
18c8 | LoadLargeImmediate(Hl, 3311)
18cb | LoadImmediate(A, 0026)
18cd | Nop
18ce | Call(Unconditional, 08ff)
18d1 | Jump(Unconditional, 0ab6)
18d4 | LoadLargeImmediate(Sp, 2400)
18d7 | LoadImmediate(B, 0000)
18d9 | Call(Unconditional, 01e6)
18dc | Call(Unconditional, 1956)
18df | LoadImmediate(A, 0008)
18e1 | DirectAddress(StoreAccumulator, 20cf)
18e4 | Jump(Unconditional, 0aea)
18e7 | DirectAddress(LoadAccumulator, 2067)
18ea | LoadLargeImmediate(Hl, 20e7)
18ed | RotateAccumulator(Right)
18ee | ReturnFromSubroutine(NoCarry)
18ef | IncrementPair(Hl)
18f0 | ReturnFromSubroutine(Unconditional)
18f1 | LoadImmediate(B, 0002)
18f3 | DirectAddress(LoadAccumulator, 2082)
18f6 | Decrement(A)
18f7 | ReturnFromSubroutine(NonZero)
18f8 | Increment(B)
18f9 | ReturnFromSubroutine(Unconditional)
18fa | DirectAddress(LoadAccumulator, 2094)
18fd | ToAccumulator(Or, B)
18fe | DirectAddress(StoreAccumulator, 2094)
1901 | Out(0003)
1903 | ReturnFromSubroutine(Unconditional)
1904 | LoadLargeImmediate(Hl, 2200)
1907 | Jump(Unconditional, 01c3)
190a | Call(Unconditional, 14d8)
190d | Jump(Unconditional, 1597)
1910 | LoadLargeImmediate(Hl, 20e7)
1913 | DirectAddress(LoadAccumulator, 2067)
1916 | RotateAccumulator(Right)
1917 | ReturnFromSubroutine(Carry)
1918 | IncrementPair(Hl)
1919 | ReturnFromSubroutine(Unconditional)
191a | LoadImmediate(C, 001c)
191c | LoadLargeImmediate(Hl, 241e)
191f | LoadLargeImmediate(De, 1ae4)
1922 | Jump(Unconditional, 08f3)
1925 | LoadLargeImmediate(Hl, 20f8)
1928 | Jump(Unconditional, 1931)
192b | LoadLargeImmediate(Hl, 20fc)
192e | Jump(Unconditional, 1931)
1931 | Move { destination: E, source: MemoryRef }
1932 | IncrementPair(Hl)
1933 | Move { destination: D, source: MemoryRef }
1934 | IncrementPair(Hl)
1935 | Move { destination: A, source: MemoryRef }
1936 | IncrementPair(Hl)
1937 | Move { destination: H, source: MemoryRef }
1938 | Move { destination: L, source: A }
1939 | Jump(Unconditional, 09ad)
193c | LoadImmediate(C, 0007)
193e | LoadLargeImmediate(Hl, 3501)
1941 | LoadLargeImmediate(De, 1fa9)
1944 | Jump(Unconditional, 08f3)
1947 | DirectAddress(LoadAccumulator, 20eb)
194a | LoadLargeImmediate(Hl, 3c01)
194d | Jump(Unconditional, 09b2)
1950 | LoadLargeImmediate(Hl, 20f4)
1953 | Jump(Unconditional, 1931)
1956 | Call(Unconditional, 1a5c)
1959 | Call(Unconditional, 191a)
195c | Call(Unconditional, 1925)
195f | Call(Unconditional, 192b)
1962 | Call(Unconditional, 1950)
1965 | Call(Unconditional, 193c)
1968 | Jump(Unconditional, 1947)
196b | Call(Unconditional, 19dc)
196e | Jump(Unconditional, 1671)
1971 | LoadImmediate(A, 0001)
1973 | DirectAddress(StoreAccumulator, 206d)
1976 | Jump(Unconditional, 16e6)
1979 | Call(Unconditional, 19d7)
197c | Call(Unconditional, 1947)
197f | Jump(Unconditional, 193c)
1982 | DirectAddress(StoreAccumulator, 20c1)
1985 | ReturnFromSubroutine(Unconditional)
1986 | ToAccumulator(AddWithCarry, E)
1987 | AddToHl(De)
1988 | Jump(Unconditional, 09d6)
198b | LoadLargeImmediate(Hl, 2803)
198e | LoadLargeImmediate(De, 19be)
1991 | LoadImmediate(C, 0013)
1993 | Jump(Unconditional, 08f3)
1996 | Nop
1997 | Nop
1998 | Nop
1999 | Nop
199a | DirectAddress(LoadAccumulator, 201e)
199d | ToAccumulator(And, A)
199e | Jump(NonZero, 19ac)
19a1 | In(0001)
19a3 | ToAccumulatorImmediate(And, 0076)
19a5 | ToAccumulatorImmediate(Subtract, 0072)
19a7 | ReturnFromSubroutine(NonZero)
19a8 | Increment(A)
19a9 | DirectAddress(StoreAccumulator, 201e)
19ac | In(0001)
19ae | ToAccumulatorImmediate(And, 0076)
19b0 | ToAccumulatorImmediate(Compare, 0034)
19b2 | ReturnFromSubroutine(NonZero)
19b3 | LoadLargeImmediate(Hl, 2e1b)
19b6 | LoadLargeImmediate(De, 0bf7)
19b9 | LoadImmediate(C, 0009)
19bb | Jump(Unconditional, 08f3)
19be | Invalid(0028)
19bf | IncrementPair(De)
19c0 | Nop
19c1 | Invalid(0008)
19c2 | IncrementPair(De)
19c3 | LoadImmediate(C, 0026)
19c5 | StoreAccumulator(Bc)
19c6 | LoadImmediate(C, 0011)
19c8 | RotateAccumulator(Right)
19c9 | LoadImmediate(C, 0011)
19cb | Nop
19cc | IncrementPair(De)
19cd | Invalid(0008)
19ce | LoadImmediate(C, 000d)
19d0 | Invalid(0028)
19d1 | LoadImmediate(A, 0001)
19d3 | DirectAddress(StoreAccumulator, 20e9)
19d6 | ReturnFromSubroutine(Unconditional)
19d7 | ToAccumulator(Xor, A)
19d8 | Jump(Unconditional, 19d3)
19db | Nop
19dc | DirectAddress(LoadAccumulator, 2094)
19df | ToAccumulator(And, B)
19e0 | DirectAddress(StoreAccumulator, 2094)
19e3 | Out(0003)
19e5 | ReturnFromSubroutine(Unconditional)
19e6 | LoadLargeImmediate(Hl, 2701)
19e9 | Jump(Zero, 19fa)
19ec | LoadLargeImmediate(De, 1c60)
19ef | LoadImmediate(B, 0010)
19f1 | Move { destination: C, source: A }
19f2 | Call(Unconditional, 1439)
19f5 | Move { destination: A, source: C }
19f6 | Decrement(A)
19f7 | Jump(NonZero, 19ec)
19fa | LoadImmediate(B, 0010)
19fc | Call(Unconditional, 14cb)
19ff | Move { destination: A, source: H }
1a00 | ToAccumulatorImmediate(Compare, 0035)
1a02 | Jump(NonZero, 19fa)
1a05 | ReturnFromSubroutine(Unconditional)
1a06 | LoadLargeImmediate(Hl, 2072)
1a09 | Move { destination: B, source: MemoryRef }
1a0a | LoadAccumulator(De)
1a0b | ToAccumulatorImmediate(And, 0080)
1a0d | ToAccumulator(Xor, B)
1a0e | ReturnFromSubroutine(NonZero)
1a0f | SetCarry
1a10 | ReturnFromSubroutine(Unconditional)
1a11 | DirectAddress(StoreAccumulator, 242b)
1a14 | Increment(E)
1a15 | LoadImmediate(D, 0011)
1a17 | Decrement(C)
1a18 | LoadAccumulator(Bc)
1a19 | Invalid(0008)
1a1a | RotateAccumulator(Left)
1a1b | LoadImmediate(B, 0005)
1a1d | Increment(B)
1a1e | IncrementPair(Bc)
1a1f | StoreAccumulator(Bc)
1a20 | LoadLargeImmediate(Bc, 2e34)
1a23 | DecimalAdjustAccumulator
1a24 | DirectAddress(StoreHl, 181c)
1a27 | Decrement(D)
1a28 | IncrementPair(De)
1a29 | Invalid(0010)
1a2a | LoadImmediate(C, 000d)
1a2c | Increment(C)
1a2d | DecrementPair(Bc)
1a2e | AddToHl(Bc)
1a2f | RotateAccumulator(Left)
1a30 | Decrement(B)
1a31 | Restart(0007)
1a32 | LoadAccumulator(De)
1a33 | Move { destination: MemoryRef, source: A }
1a34 | IncrementPair(Hl)
1a35 | IncrementPair(De)
1a36 | Decrement(B)
1a37 | Jump(NonZero, 1a32)
1a3a | ReturnFromSubroutine(Unconditional)
1a3b | Move { destination: E, source: MemoryRef }
1a3c | IncrementPair(Hl)
1a3d | Move { destination: D, source: MemoryRef }
1a3e | IncrementPair(Hl)
1a3f | Move { destination: A, source: MemoryRef }
1a40 | IncrementPair(Hl)
1a41 | Move { destination: C, source: MemoryRef }
1a42 | IncrementPair(Hl)
1a43 | Move { destination: B, source: MemoryRef }
1a44 | Move { destination: H, source: C }
1a45 | Move { destination: L, source: A }
1a46 | ReturnFromSubroutine(Unconditional)
1a47 | Push(Bc)
1a48 | LoadImmediate(B, 0003)
1a4a | Move { destination: A, source: H }
1a4b | RotateAccumulator(RightThroughCarry)
1a4c | Move { destination: H, source: A }
1a4d | Move { destination: A, source: L }
1a4e | RotateAccumulator(RightThroughCarry)
1a4f | Move { destination: L, source: A }
1a50 | Decrement(B)
1a51 | Jump(NonZero, 1a4a)
1a54 | Move { destination: A, source: H }
1a55 | ToAccumulatorImmediate(And, 003f)
1a57 | ToAccumulatorImmediate(Or, 0020)
1a59 | Move { destination: H, source: A }
1a5a | Pop(Bc)
1a5b | ReturnFromSubroutine(Unconditional)
1a5c | LoadLargeImmediate(Hl, 2400)
1a5f | LoadImmediate(MemoryRef, 0000)
1a61 | IncrementPair(Hl)
1a62 | Move { destination: A, source: H }
1a63 | ToAccumulatorImmediate(Compare, 0040)
1a65 | Jump(NonZero, 1a5f)
1a68 | ReturnFromSubroutine(Unconditional)
1a69 | Push(Bc)
1a6a | Push(Hl)
1a6b | LoadAccumulator(De)
1a6c | ToAccumulator(Or, MemoryRef)
1a6d | Move { destination: MemoryRef, source: A }
1a6e | IncrementPair(De)
1a6f | IncrementPair(Hl)
1a70 | Decrement(C)
1a71 | Jump(NonZero, 1a6b)
1a74 | Pop(Hl)
1a75 | LoadLargeImmediate(Bc, 0020)
1a78 | AddToHl(Bc)
1a79 | Pop(Bc)
1a7a | Decrement(B)
1a7b | Jump(NonZero, 1a69)
1a7e | ReturnFromSubroutine(Unconditional)
1a7f | Call(Unconditional, 092e)
1a82 | ToAccumulator(And, A)
1a83 | ReturnFromSubroutine(Zero)
1a84 | Push(FlagsA)
1a85 | Decrement(A)
1a86 | Move { destination: MemoryRef, source: A }
1a87 | Call(Unconditional, 19e6)
1a8a | Pop(FlagsA)
1a8b | LoadLargeImmediate(Hl, 2501)
1a8e | ToAccumulatorImmediate(And, 000f)
1a90 | Jump(Unconditional, 09c5)
1a93 | Nop
1a94 | Nop
1a95 | Nop
1a96 | Nop
1a97 | Restart(0007)
1a98 | ToAccumulator(Compare, B)
1a99 | ToAccumulatorImmediate(Compare, 0020)
1a9b | Increment(E)
1a9c | Invalid(0010)
1a9d | ToAccumulator(SubtractWithBorrow, MemoryRef)
1a9e | Nop
1a9f | Invalid(0020)
1aa0 | Increment(E)
1aa1 | Invalid(0030)
1aa2 | Invalid(0010)
1aa3 | DecrementPair(Bc)
1aa4 | Invalid(0008)
1aa5 | RotateAccumulator(Left)
1aa6 | LoadImmediate(B, 0000)
1aa8 | Increment(C)
1aa9 | Increment(B)
1aaa | LoadImmediate(H, 000e)
1aac | Decrement(D)
1aad | Increment(B)
1aae | LoadLargeImmediate(De, 2626)
1ab1 | RotateAccumulator(Right)
1ab2 | DecrementPair(Bc)
1ab3 | Nop
1ab4 | Invalid(0018)
1ab5 | Increment(B)
1ab6 | LoadLargeImmediate(De, 2624)
1ab9 | Decrement(H)
1aba | DecrementPair(De)
1abb | LoadImmediate(H, 000e)
1abd | LoadLargeImmediate(De, 1c26)
1ac0 | RotateAccumulator(Right)
1ac1 | DecrementPair(Bc)
1ac2 | Nop
1ac3 | Invalid(0018)
1ac4 | Increment(B)
1ac5 | LoadLargeImmediate(De, 2612)
1ac8 | LoadLargeImmediate(Bc, 1314)
1acb | IncrementPair(De)
1acc | LoadImmediate(C, 000d)
1ace | LoadImmediate(H, 000e)
1ad0 | Decrement(C)
1ad1 | DecrementPair(Bc)
1ad2 | Invalid(0018)
1ad3 | LoadImmediate(H, 001b)
1ad5 | RotateAccumulator(Right)
1ad6 | DecrementPair(Bc)
1ad7 | Nop
1ad8 | Invalid(0018)
1ad9 | Increment(B)
1ada | LoadLargeImmediate(De, 2626)
1add | LoadLargeImmediate(Bc, 1314)
1ae0 | IncrementPair(De)
1ae1 | LoadImmediate(C, 000d)
1ae3 | LoadImmediate(H, 0026)
1ae5 | StoreAccumulator(De)
1ae6 | StoreAccumulator(Bc)
1ae7 | LoadImmediate(C, 0011)
1ae9 | Increment(B)
1aea | Increment(H)
1aeb | DecrementPair(De)
1aec | Decrement(H)
1aed | LoadImmediate(H, 0007)
1aef | Invalid(0008)
1af0 | ComplementCarry
1af1 | StoreAccumulator(De)
1af2 | StoreAccumulator(Bc)
1af3 | LoadImmediate(C, 0011)
1af5 | Increment(B)
1af6 | LoadImmediate(H, 0012)
1af8 | StoreAccumulator(Bc)
1af9 | LoadImmediate(C, 0011)
1afb | Increment(B)
1afc | Increment(H)
1afd | Increment(E)
1afe | Decrement(H)
1aff | LoadImmediate(H, 0001)
1b01 | Nop
1b02 | Nop
1b03 | Invalid(0010)
1b04 | Nop
1b05 | Nop
1b06 | Nop
1b07 | Nop
1b08 | StoreAccumulator(Bc)
1b09 | Move { destination: A, source: B }
1b0a | Invalid(0038)
1b0b | Move { destination: A, source: B }
1b0c | Invalid(0038)
1b0d | Nop
1b0e | ReturnFromSubroutine(Minus)
1b0f | Nop
1b10 | Nop
1b11 | ToAccumulator(Add, B)
1b12 | Nop
1b13 | ToAccumulator(AddWithCarry, MemoryRef)
1b14 | StoreAccumulator(Bc)
1b15 | Restart(0007)
1b16 | Decrement(B)
1b17 | Increment(C)
1b18 | Move { destination: H, source: B }
1b19 | Increment(E)
1b1a | Invalid(0020)
1b1b | Invalid(0030)
1b1c | Invalid(0010)
1b1d | LoadLargeImmediate(Bc, 0000)
1b20 | Nop
1b21 | Nop
1b22 | Nop
1b23 | ToAccumulator(Compare, E)
1b24 | IncrementPair(Bc)
1b25 | Nop
1b26 | Invalid(0010)
1b27 | ToAccumulator(Subtract, B)
1b28 | Increment(E)
1b29 | Invalid(0028)
1b2a | Invalid(0030)
1b2b | LoadLargeImmediate(Bc, 0004)
1b2e | Restart(0007)
1b2f | Restart(0007)
1b30 | Nop
1b31 | Nop
1b32 | StoreAccumulator(Bc)
1b33 | Halt
1b34 | Increment(B)
1b35 | Nop
1b36 | Nop
1b37 | Nop
1b38 | Nop
1b39 | Nop
1b3a | Increment(B)
1b3b | ToAccumulatorImmediate(Xor, 001c)
1b3d | Nop
1b3e | Nop
1b3f | IncrementPair(Bc)
1b40 | Nop
1b41 | Nop
1b42 | Nop
1b43 | ToAccumulator(Or, MemoryRef)
1b44 | Increment(B)
1b45 | Nop
1b46 | Nop
1b47 | LoadLargeImmediate(Bc, 1d00)
1b4a | Increment(B)
1b4b | Jump(ParityOdd, 001c)
1b4e | Nop
1b4f | IncrementPair(Bc)
1b50 | Nop
1b51 | Nop
1b52 | Nop
1b53 | ToAccumulator(Add, D)
1b54 | LoadImmediate(B, 0000)
1b56 | Nop
1b57 | LoadLargeImmediate(Bc, 1d06)
1b5a | Increment(B)
1b5b | ReturnFromSubroutine(NoCarry)
1b5c | Increment(E)
1b5d | Nop
1b5e | Nop
1b5f | IncrementPair(Bc)
1b60 | Restart(0007)
1b61 | Nop
1b62 | ReturnFromSubroutine(NonZero)
1b63 | Increment(E)
1b64 | Nop
1b65 | Nop
1b66 | Invalid(0010)
1b67 | LoadLargeImmediate(Hl, 0001)
1b6a | Invalid(0030)
1b6b | Nop
1b6c | StoreAccumulator(De)
1b6d | Nop
1b6e | Nop
1b6f | Nop
1b70 | RotateAccumulator(Right)
1b71 | DecrementPair(Bc)
1b72 | Nop
1b73 | Invalid(0018)
1b74 | LoadImmediate(H, 000f)
1b76 | DecrementPair(Bc)
1b77 | Nop
1b78 | Invalid(0018)
1b79 | Increment(B)
1b7a | LoadLargeImmediate(De, 1b24)
1b7d | Decrement(H)
1b7e | Call(Minus, 0100)
1b81 | Restart(0007)
1b82 | Restart(0007)
1b83 | Nop
1b84 | Nop
1b85 | Nop
1b86 | Invalid(0020)
1b87 | Move { destination: H, source: H }
1b88 | Decrement(E)
1b89 | ReturnFromSubroutine(NoCarry)
1b8a | AddToHl(Hl)
1b8b | Invalid(0018)
1b8c | StoreAccumulator(Bc)
1b8d | Move { destination: D, source: H }
1b8e | Decrement(E)
1b8f | Nop
1b90 | Invalid(0008)
1b91 | Nop
1b92 | LoadImmediate(B, 0000)
1b94 | Nop
1b95 | LoadLargeImmediate(Bc, 0040)
1b98 | LoadLargeImmediate(Bc, 0000)
1b9b | Invalid(0010)
1b9c | ToAccumulator(SubtractWithBorrow, MemoryRef)
1b9d | Nop
1b9e | Invalid(0020)
1b9f | Increment(E)
1ba0 | Nop
1ba1 | IncrementPair(Bc)
1ba2 | Increment(B)
1ba3 | Move { destination: A, source: B }
1ba4 | Increment(D)
1ba5 | IncrementPair(De)
1ba6 | Invalid(0008)
1ba7 | LoadAccumulator(De)
1ba8 | Decrement(A)
1ba9 | Move { destination: L, source: B }
1baa | Call(Minus, 68fc)
1bad | Decrement(A)
1bae | LoadAccumulator(De)
1baf | Nop
1bb0 | Nop
1bb1 | Nop
1bb2 | LoadLargeImmediate(Bc, 98b8)
1bb5 | ToAccumulator(And, B)
1bb6 | DecrementPair(De)
1bb7 | Invalid(0010)
1bb8 | Restart(0007)
1bb9 | Nop
1bba | ToAccumulator(And, B)
1bbb | DecrementPair(De)
1bbc | Nop
1bbd | Nop
1bbe | Nop
1bbf | Nop
1bc0 | Nop
1bc1 | Invalid(0010)
1bc2 | Nop
1bc3 | LoadImmediate(C, 0005)
1bc5 | Nop
1bc6 | Nop
1bc7 | Nop
1bc8 | Nop
1bc9 | Nop
1bca | RotateAccumulator(Left)
1bcb | ReturnFromSubroutine(NoCarry)
1bcc | Increment(E)
1bcd | ReturnFromSubroutine(Zero)
1bce | ToAccumulator(SubtractWithBorrow, E)
1bcf | IncrementPair(Bc)
1bd0 | Nop
1bd1 | Nop
1bd2 | IncrementPair(Bc)
1bd3 | Increment(B)
1bd4 | Move { destination: A, source: B }
1bd5 | Increment(D)
1bd6 | DecrementPair(Bc)
1bd7 | AddToHl(De)
1bd8 | DirectAddress(LoadAccumulator, fa6d)
1bdb | Jump(Minus, 3a6d)
1bde | AddToHl(De)
1bdf | Nop
1be0 | Nop
1be1 | Nop
1be2 | Nop
1be3 | Nop
1be4 | Nop
1be5 | Nop
1be6 | Nop
1be7 | Nop
1be8 | Nop
1be9 | LoadLargeImmediate(Bc, 0000)
1bec | LoadLargeImmediate(Bc, 1f74)
1bef | Nop
1bf0 | ToAccumulator(Add, B)
1bf1 | Nop
1bf2 | Nop
1bf3 | Nop
1bf4 | Nop
1bf5 | Nop
1bf6 | Increment(E)
1bf7 | ComplementAccumulator
1bf8 | Nop
1bf9 | Nop
1bfa | Increment(E)
1bfb | DecimalAdjustAccumulator
1bfc | Nop
1bfd | Nop
1bfe | Increment(E)
1bff | AddToHl(Sp)
1c00 | Nop
1c01 | Nop
1c02 | AddToHl(Sp)
1c03 | Move { destination: A, source: C }
1c04 | Move { destination: A, source: D }
1c05 | Move { destination: L, source: MemoryRef }
1c06 | Call(ParityEven, fafa)
1c09 | Call(ParityEven, 7a6e)
1c0c | Move { destination: A, source: C }
1c0d | AddToHl(Sp)
1c0e | Nop
1c0f | Nop
1c10 | Nop
1c11 | Nop
1c12 | Nop
1c13 | Move { destination: A, source: B }
1c14 | Decrement(E)
1c15 | ToAccumulator(Compare, MemoryRef)
1c16 | Move { destination: L, source: H }
1c17 | Increment(A)
1c18 | Increment(A)
1c19 | Increment(A)
1c1a | Move { destination: L, source: H }
1c1b | ToAccumulator(Compare, MemoryRef)
1c1c | Decrement(E)
1c1d | Move { destination: A, source: B }
1c1e | Nop
1c1f | Nop
1c20 | Nop
1c21 | Nop
1c22 | Nop
1c23 | Nop
1c24 | AddToHl(De)
1c25 | DirectAddress(LoadAccumulator, fa6d)
1c28 | Jump(Minus, 3a6d)
1c2b | AddToHl(De)
1c2c | Nop
1c2d | Nop
1c2e | Nop
1c2f | Nop
1c30 | Nop
1c31 | Nop
1c32 | Invalid(0038)
1c33 | Move { destination: A, source: D }
1c34 | Move { destination: A, source: A }
1c35 | Move { destination: L, source: L }
1c36 | Call(ParityEven, fafa)
1c39 | Call(ParityEven, 7f6d)
1c3c | Move { destination: A, source: D }
1c3d | Invalid(0038)
1c3e | Nop
1c3f | Nop
1c40 | Nop
1c41 | Nop
1c42 | Nop
1c43 | LoadImmediate(C, 0018)
1c45 | ToAccumulator(Compare, MemoryRef)
1c46 | Move { destination: L, source: L }
1c47 | Decrement(A)
1c48 | Increment(A)
1c49 | Decrement(A)
1c4a | Move { destination: L, source: L }
1c4b | ToAccumulator(Compare, MemoryRef)
1c4c | Invalid(0018)
1c4d | LoadImmediate(C, 0000)
1c4f | Nop
1c50 | Nop
1c51 | Nop
1c52 | Nop
1c53 | Nop
1c54 | LoadAccumulator(De)
1c55 | Decrement(A)
1c56 | Move { destination: L, source: B }
1c57 | Call(Minus, 68fc)
1c5a | Decrement(A)
1c5b | LoadAccumulator(De)
1c5c | Nop
1c5d | Nop
1c5e | Nop
1c5f | Nop
1c60 | Nop
1c61 | Nop
1c62 | RotateAccumulator(Right)
1c63 | RotateAccumulator(RightThroughCarry)
1c64 | RotateAccumulator(RightThroughCarry)
1c65 | RotateAccumulator(RightThroughCarry)
1c66 | RotateAccumulator(RightThroughCarry)
1c67 | Move { destination: A, source: A }
1c68 | Restart(0007)
1c69 | Move { destination: A, source: A }
1c6a | RotateAccumulator(RightThroughCarry)
1c6b | RotateAccumulator(RightThroughCarry)
1c6c | RotateAccumulator(RightThroughCarry)
1c6d | RotateAccumulator(RightThroughCarry)
1c6e | RotateAccumulator(Right)
1c6f | Nop
1c70 | Nop
1c71 | Increment(B)
1c72 | LoadLargeImmediate(Bc, 0313)
1c75 | RotateAccumulator(Left)
1c76 | ToAccumulator(Or, E)
1c77 | RotateAccumulator(Right)
1c78 | ComplementAccumulator
1c79 | IncrementPair(Bc)
1c7a | ComplementAccumulator
1c7b | Move { destination: C, source: C }
1c7c | Increment(B)
1c7d | IncrementPair(Bc)
1c7e | Nop
1c7f | LoadLargeImmediate(Bc, 0840)
1c82 | Decrement(B)
1c83 | ToAccumulator(And, E)
1c84 | LoadAccumulator(Bc)
1c85 | IncrementPair(Bc)
1c86 | Move { destination: E, source: E }
1c87 | RotateAccumulator(Right)
1c88 | DecimalAdjustAccumulator
1c89 | DecimalAdjustAccumulator
1c8a | DecrementPair(Bc)
1c8b | Move { destination: C, source: E }
1c8c | Move { destination: B, source: B }
1c8d | ToAccumulator(Add, H)
1c8e | LoadLargeImmediate(De, 0f48)
1c91 | ToAccumulator(SubtractWithBorrow, C)
1c92 | Increment(A)
1c93 | Move { destination: A, source: MemoryRef }
1c94 | Decrement(A)
1c95 | ToAccumulator(Compare, H)
1c96 | LoadImmediate(A, 007c)
1c98 | ToAccumulator(SubtractWithBorrow, C)
1c99 | DecimalAdjustAccumulator
1c9a | DecrementPair(De)
1c9b | LoadAccumulator(De)
1c9c | LoadImmediate(H, 000f)
1c9e | LoadImmediate(C, 0008)
1ca0 | Decrement(C)
1ca1 | IncrementPair(De)
1ca2 | StoreAccumulator(De)
1ca3 | Invalid(0028)
1ca4 | StoreAccumulator(De)
1ca5 | StoreAccumulator(Bc)
1ca6 | LoadImmediate(C, 0011)
1ca8 | Increment(B)
1ca9 | LoadImmediate(H, 0000)
1cab | IncrementPair(Bc)
1cac | Decrement(D)
1cad | Nop
1cae | Decrement(C)
1caf | StoreAccumulator(Bc)
1cb0 | Increment(B)
1cb1 | LoadImmediate(H, 0013)
1cb3 | Nop
1cb4 | LoadLargeImmediate(Bc, 040b)
1cb7 | Invalid(0028)
1cb8 | StoreAccumulator(Bc)
1cb9 | Invalid(0010)
1cba | Invalid(0020)
1cbb | Invalid(0030)
1cbc | IncrementPair(De)
1cbd | Invalid(0008)
1cbe | DecrementPair(Bc)
1cbf | IncrementPair(De)
1cc0 | Nop
1cc1 | Invalid(0008)
1cc2 | Move { destination: C, source: C }
1cc3 | DirectAddress(StoreHl, 8114)
1cc6 | Move { destination: B, source: D }
1cc7 | Nop
1cc8 | Move { destination: B, source: D }
1cc9 | ToAccumulator(Add, C)
1cca | Increment(D)
1ccb | DirectAddress(StoreHl, 0849)
1cce | Nop
1ccf | Nop
1cd0 | Move { destination: B, source: H }
1cd1 | ToAccumulator(Xor, D)
1cd2 | Invalid(0010)
1cd3 | ToAccumulator(AddWithCarry, B)
1cd4 | Move { destination: D, source: H }
1cd5 | DirectAddress(StoreHl, aa10)
1cd8 | Move { destination: B, source: H }
1cd9 | DirectAddress(StoreHl, 8854)
1cdc | Move { destination: C, source: D }
1cdd | Decrement(D)
1cde | ToAccumulator(Compare, MemoryRef)
1cdf | ComplementCarry
1ce0 | Move { destination: E, source: MemoryRef }
1ce1 | Decrement(H)
1ce2 | Increment(B)
1ce3 | Call(Minus, 1004)
1ce6 | Call(Minus, 2010)
1ce9 | Call(Minus, 8020)
1cec | Call(Minus, 0080)
1cef | ToAccumulatorImmediate(Compare, 0000)
1cf1 | Increment(H)
1cf2 | ToAccumulatorImmediate(Compare, 0012)
1cf4 | Nop
1cf5 | ToAccumulatorImmediate(Compare, 0000)
1cf7 | Move { destination: C, source: B }
1cf8 | ToAccumulatorImmediate(Compare, 0090)
1cfa | RotateAccumulator(Right)
1cfb | DecrementPair(Bc)
1cfc | Nop
1cfd | AddToHl(Hl)
1cfe | Nop
1cff | Nop
1d00 | LoadLargeImmediate(Bc, 0107)
1d03 | LoadLargeImmediate(Bc, 0401)
1d06 | DecrementPair(Bc)
1d07 | LoadLargeImmediate(Bc, 0306)
1d0a | LoadLargeImmediate(Bc, 0b01)
1d0d | AddToHl(Bc)
1d0e | StoreAccumulator(Bc)
1d0f | Invalid(0008)
1d10 | StoreAccumulator(Bc)
1d11 | DecrementPair(Bc)
1d12 | Increment(B)
1d13 | RotateAccumulator(Left)
1d14 | LoadAccumulator(Bc)
1d15 | Decrement(B)
1d16 | StoreAccumulator(Bc)
1d17 | Decrement(B)
1d18 | Increment(B)
1d19 | LoadImmediate(B, 0007)
1d1b | Invalid(0008)
1d1c | LoadAccumulator(Bc)
1d1d | LoadImmediate(B, 000a)
1d1f | IncrementPair(Bc)
1d20 | Restart(0007)
1d21 | RotateAccumulator(Right)
1d22 | Restart(0007)
1d23 | RotateAccumulator(RightThroughCarry)
1d24 | Restart(0007)
1d25 | ComplementCarry
1d26 | Restart(0007)
1d27 | Move { destination: A, source: A }
1d28 | Restart(0007)
1d29 | Restart(0007)
1d2a | Call(Minus, f8ff)
1d2d | Restart(0007)
1d2e | ReturnFromSubroutine(Plus)
1d2f | Restart(0007)
1d30 | ReturnFromSubroutine(Plus)
1d31 | Restart(0007)
1d32 | ReturnFromSubroutine(Plus)
1d33 | Restart(0007)
1d34 | ReturnFromSubroutine(Plus)
1d35 | Restart(0007)
1d36 | ReturnFromSubroutine(Plus)
1d37 | Restart(0007)
1d38 | ReturnFromSubroutine(Plus)
1d39 | Restart(0007)
1d3a | ReturnFromSubroutine(Plus)
1d3b | Restart(0007)
1d3c | ReturnFromSubroutine(Minus)
1d3d | Restart(0007)
1d3e | Call(Minus, ffff)
1d41 | Restart(0007)
1d42 | Restart(0007)
1d43 | Restart(0007)
1d44 | Restart(0007)
1d45 | Move { destination: A, source: A }
1d46 | Restart(0007)
1d47 | ComplementCarry
1d48 | Restart(0007)
1d49 | RotateAccumulator(RightThroughCarry)
1d4a | Restart(0007)
1d4b | RotateAccumulator(Right)
1d4c | Decrement(B)
1d4d | Invalid(0010)
1d4e | Decrement(D)
1d4f | Invalid(0030)
1d50 | ToAccumulator(Subtract, H)
1d51 | ToAccumulator(Subtract, A)
1d52 | ToAccumulator(SubtractWithBorrow, D)
1d53 | ToAccumulator(SubtractWithBorrow, L)
1d54 | Invalid(0010)
1d55 | Decrement(B)
1d56 | Decrement(B)
1d57 | Invalid(0010)
1d58 | Decrement(D)
1d59 | Invalid(0010)
1d5a | Invalid(0010)
1d5b | Decrement(B)
1d5c | Invalid(0030)
1d5d | Invalid(0010)
1d5e | Invalid(0010)
1d5f | Invalid(0010)
1d60 | Decrement(B)
1d61 | Decrement(D)
1d62 | Invalid(0010)
1d63 | Decrement(B)
1d64 | Nop
1d65 | Nop
1d66 | Nop
1d67 | Nop
1d68 | Increment(B)
1d69 | Increment(C)
1d6a | LoadImmediate(E, 0037)
1d6c | LoadImmediate(A, 007c)
1d6e | Move { destination: MemoryRef, source: H }
1d6f | Move { destination: A, source: MemoryRef }
1d70 | Move { destination: A, source: MemoryRef }
1d71 | Move { destination: MemoryRef, source: H }
1d72 | Move { destination: A, source: H }
1d73 | LoadImmediate(A, 0037)
1d75 | LoadImmediate(E, 000c)
1d77 | Increment(B)
1d78 | Nop
1d79 | Nop
1d7a | Nop
1d7b | Nop
1d7c | Nop
1d7d | DirectAddress(StoreHl, a500)
1d80 | Move { destination: B, source: B }
1d81 | Invalid(0008)
1d82 | ToAccumulator(SubtractWithBorrow, B)
1d83 | Decrement(A)
1d84 | ToAccumulator(Or, MemoryRef)
1d85 | Increment(A)
1d86 | LoadImmediate(MemoryRef, 001d)
1d88 | Invalid(0010)
1d89 | Move { destination: C, source: B }
1d8a | Move { destination: H, source: D }
1d8b | ToAccumulator(Or, MemoryRef)
1d8c | Decrement(E)
1d8d | ToAccumulator(SubtractWithBorrow, B)
1d8e | Invalid(0008)
1d8f | Move { destination: B, source: D }
1d90 | ToAccumulator(Subtract, B)
1d91 | Invalid(0008)
1d92 | Nop
1d93 | Nop
1d94 | LoadImmediate(H, 001f)
1d96 | LoadAccumulator(De)
1d97 | DecrementPair(De)
1d98 | LoadAccumulator(De)
1d99 | LoadAccumulator(De)
1d9a | DecrementPair(De)
1d9b | RotateAccumulator(RightThroughCarry)
1d9c | LoadAccumulator(De)
1d9d | Decrement(E)
1d9e | LoadAccumulator(De)
1d9f | LoadAccumulator(De)
1da0 | Invalid(0010)
1da1 | Invalid(0020)
1da2 | Invalid(0030)
1da3 | Move { destination: H, source: B }
1da4 | Move { destination: D, source: B }
1da5 | Move { destination: C, source: B }
1da6 | Move { destination: C, source: B }
1da7 | Move { destination: C, source: B }
1da8 | Move { destination: B, source: B }
1da9 | Move { destination: B, source: B }
1daa | Move { destination: B, source: B }
1dab | RotateAccumulator(Right)
1dac | DecrementPair(Bc)
1dad | Nop
1dae | Invalid(0018)
1daf | StoreAccumulator(De)
1db0 | RotateAccumulator(Right)
1db1 | Nop
1db2 | StoreAccumulator(Bc)
1db3 | Increment(B)
1db4 | LoadImmediate(H, 0026)
1db6 | Invalid(0008)
1db7 | Decrement(C)
1db8 | Decrement(D)
1db9 | Nop
1dba | IncrementPair(Bc)
1dbb | Increment(B)
1dbc | LoadLargeImmediate(De, 0e12)
1dbf | Increment(L)
1dc0 | Move { destination: L, source: B }
1dc1 | Decrement(E)
1dc2 | Increment(C)
1dc3 | Increment(L)
1dc4 | Invalid(0020)
1dc5 | Increment(E)
1dc6 | LoadAccumulator(Bc)
1dc7 | Increment(L)
1dc8 | Move { destination: B, source: B }
1dc9 | Increment(E)
1dca | Invalid(0008)
1dcb | Increment(L)
1dcc | Nop
1dcd | Increment(E)
1dce | Restart(0007)
1dcf | LoadImmediate(C, 002e)
1dd1 | ReturnFromSubroutine(ParityOdd)
1dd2 | Decrement(E)
1dd3 | Increment(C)
1dd4 | LoadImmediate(L, 00ea)
1dd6 | Decrement(E)
1dd7 | LoadAccumulator(Bc)
1dd8 | LoadImmediate(L, 00f4)
1dda | Decrement(E)
1ddb | Invalid(0008)
1ddc | LoadImmediate(L, 0099)
1dde | Increment(E)
1ddf | Restart(0007)
1de0 | DecimalAdjustAccumulator
1de1 | Invalid(0038)
1de2 | LoadImmediate(H, 000c)
1de4 | Invalid(0018)
1de5 | StoreAccumulator(De)
1de6 | IncrementPair(De)
1de7 | Increment(B)
1de8 | LoadLargeImmediate(De, 2718)
1deb | Decrement(E)
1dec | LoadAccumulator(De)
1ded | LoadImmediate(H, 000f)
1def | LoadImmediate(C, 0008)
1df1 | Decrement(C)
1df2 | IncrementPair(De)
1df3 | StoreAccumulator(De)
1df4 | DecimalAdjustAccumulator
1df5 | Increment(E)
1df6 | LoadAccumulator(De)
1df7 | LoadImmediate(H, 000f)
1df9 | LoadImmediate(C, 0008)
1dfb | Decrement(C)
1dfc | IncrementPair(De)
1dfd | StoreAccumulator(De)
1dfe | Nop
1dff | Nop
1e00 | Nop
1e01 | RotateAccumulator(RightThroughCarry)
1e02 | Increment(H)
1e03 | Move { destination: B, source: H }
1e04 | Increment(H)
1e05 | RotateAccumulator(RightThroughCarry)
1e06 | Nop
1e07 | Nop
1e08 | Nop
1e09 | Move { destination: A, source: A }
1e0a | Move { destination: C, source: C }
1e0b | Move { destination: C, source: C }
1e0c | Move { destination: C, source: C }
1e0d | LoadImmediate(MemoryRef, 0000)
1e0f | Nop
1e10 | Nop
1e11 | LoadImmediate(A, 0041)
1e13 | Move { destination: B, source: C }
1e14 | Move { destination: B, source: C }
1e15 | DirectAddress(StoreHl, 0000)
1e18 | Nop
1e19 | Move { destination: A, source: A }
1e1a | Move { destination: B, source: C }
1e1b | Move { destination: B, source: C }
1e1c | Move { destination: B, source: C }
1e1d | LoadImmediate(A, 0000)
1e1f | Nop
1e20 | Nop
1e21 | Move { destination: A, source: A }
1e22 | Move { destination: C, source: C }
1e23 | Move { destination: C, source: C }
1e24 | Move { destination: C, source: C }
1e25 | Move { destination: B, source: C }
1e26 | Nop
1e27 | Nop
1e28 | Nop
1e29 | Move { destination: A, source: A }
1e2a | Move { destination: C, source: B }
1e2b | Move { destination: C, source: B }
1e2c | Move { destination: C, source: B }
1e2d | Move { destination: B, source: B }
1e2e | Nop
1e2f | Nop
1e30 | Nop
1e31 | LoadImmediate(A, 0041)
1e33 | Move { destination: B, source: C }
1e34 | Move { destination: B, source: L }
1e35 | Move { destination: B, source: A }
1e36 | Nop
1e37 | Nop
1e38 | Nop
1e39 | Move { destination: A, source: A }
1e3a | Invalid(0008)
1e3b | Invalid(0008)
1e3c | Invalid(0008)
1e3d | Move { destination: A, source: A }
1e3e | Nop
1e3f | Nop
1e40 | Nop
1e41 | Nop
1e42 | Move { destination: B, source: C }
1e43 | Move { destination: A, source: A }
1e44 | Move { destination: B, source: C }
1e45 | Nop
1e46 | Nop
1e47 | Nop
1e48 | Nop
1e49 | StoreAccumulator(Bc)
1e4a | LoadLargeImmediate(Bc, 0101)
1e4d | Move { destination: A, source: MemoryRef }
1e4e | Nop
1e4f | Nop
1e50 | Nop
1e51 | Move { destination: A, source: A }
1e52 | Invalid(0008)
1e53 | Increment(D)
1e54 | DirectAddress(StoreHl, 0041)
1e57 | Nop
1e58 | Nop
1e59 | Move { destination: A, source: A }
1e5a | LoadLargeImmediate(Bc, 0101)
1e5d | LoadLargeImmediate(Bc, 0000)
1e60 | Nop
1e61 | Move { destination: A, source: A }
1e62 | Invalid(0020)
1e63 | Invalid(0018)
1e64 | Invalid(0020)
1e65 | Move { destination: A, source: A }
1e66 | Nop
1e67 | Nop
1e68 | Nop
1e69 | Move { destination: A, source: A }
1e6a | Invalid(0010)
1e6b | Invalid(0008)
1e6c | Increment(B)
1e6d | Move { destination: A, source: A }
1e6e | Nop
1e6f | Nop
1e70 | Nop
1e71 | LoadImmediate(A, 0041)
1e73 | Move { destination: B, source: C }
1e74 | Move { destination: B, source: C }
1e75 | LoadImmediate(A, 0000)
1e77 | Nop
1e78 | Nop
1e79 | Move { destination: A, source: A }
1e7a | Move { destination: C, source: B }
1e7b | Move { destination: C, source: B }
1e7c | Move { destination: C, source: B }
1e7d | Invalid(0030)
1e7e | Nop
1e7f | Nop
1e80 | Nop
1e81 | LoadImmediate(A, 0041)
1e83 | Move { destination: B, source: L }
1e84 | Move { destination: B, source: D }
1e85 | Decrement(A)
1e86 | Nop
1e87 | Nop
1e88 | Nop
1e89 | Move { destination: A, source: A }
1e8a | Move { destination: C, source: B }
1e8b | Move { destination: C, source: H }
1e8c | Move { destination: C, source: D }
1e8d | LoadLargeImmediate(Sp, 0000)
1e90 | Nop
1e91 | DirectAddress(StoreAccumulator, 4949)
1e94 | Move { destination: C, source: C }
1e95 | LoadImmediate(H, 0000)
1e97 | Nop
1e98 | Nop
1e99 | Move { destination: B, source: B }
1e9a | Move { destination: B, source: B }
1e9b | Move { destination: A, source: A }
1e9c | Move { destination: B, source: B }
1e9d | Move { destination: B, source: B }
1e9e | Nop
1e9f | Nop
1ea0 | Nop
1ea1 | Move { destination: A, source: MemoryRef }
1ea2 | LoadLargeImmediate(Bc, 0101)
1ea5 | Move { destination: A, source: MemoryRef }
1ea6 | Nop
1ea7 | Nop
1ea8 | Nop
1ea9 | Move { destination: A, source: H }
1eaa | StoreAccumulator(Bc)
1eab | LoadLargeImmediate(Bc, 7c02)
1eae | Nop
1eaf | Nop
1eb0 | Nop
1eb1 | Move { destination: A, source: A }
1eb2 | StoreAccumulator(Bc)
1eb3 | Increment(C)
1eb4 | StoreAccumulator(Bc)
1eb5 | Move { destination: A, source: A }
1eb6 | Nop
1eb7 | Nop
1eb8 | Nop
1eb9 | Move { destination: H, source: E }
1eba | Increment(D)
1ebb | Invalid(0008)
1ebc | Increment(D)
1ebd | Move { destination: H, source: E }
1ebe | Nop
1ebf | Nop
1ec0 | Nop
1ec1 | Move { destination: H, source: B }
1ec2 | Invalid(0010)
1ec3 | RotateAccumulator(Right)
1ec4 | Invalid(0010)
1ec5 | Move { destination: H, source: B }
1ec6 | Nop
1ec7 | Nop
1ec8 | Nop
1ec9 | Move { destination: B, source: E }
1eca | Move { destination: B, source: L }
1ecb | Move { destination: C, source: C }
1ecc | Move { destination: D, source: C }
1ecd | Move { destination: H, source: C }
1ece | Nop
1ecf | Nop
1ed0 | Nop
1ed1 | LoadImmediate(A, 0045)
1ed3 | Move { destination: C, source: C }
1ed4 | Move { destination: D, source: C }
1ed5 | LoadImmediate(A, 0000)
1ed7 | Nop
1ed8 | Nop
1ed9 | Nop
1eda | LoadLargeImmediate(Hl, 017f)
1edd | Nop
1ede | Nop
1edf | Nop
1ee0 | Nop
1ee1 | IncrementPair(Hl)
1ee2 | Move { destination: B, source: L }
1ee3 | Move { destination: C, source: C }
1ee4 | Move { destination: C, source: C }
1ee5 | LoadLargeImmediate(Sp, 0000)
1ee8 | Nop
1ee9 | Move { destination: B, source: D }
1eea | Move { destination: B, source: C }
1eeb | Move { destination: C, source: C }
1eec | Move { destination: E, source: C }
1eed | Move { destination: H, source: MemoryRef }
1eee | Nop
1eef | Nop
1ef0 | Nop
1ef1 | Increment(C)
1ef2 | Increment(D)
1ef3 | Increment(H)
1ef4 | Move { destination: A, source: A }
1ef5 | Increment(B)
1ef6 | Nop
1ef7 | Nop
1ef8 | Nop
1ef9 | Move { destination: MemoryRef, source: D }
1efa | Move { destination: D, source: C }
1efb | Move { destination: D, source: C }
1efc | Move { destination: D, source: C }
1efd | Move { destination: C, source: MemoryRef }
1efe | Nop
1eff | Nop
1f00 | Nop
1f01 | LoadImmediate(E, 0029)
1f03 | Move { destination: C, source: C }
1f04 | Move { destination: C, source: C }
1f05 | Move { destination: B, source: MemoryRef }
1f06 | Nop
1f07 | Nop
1f08 | Nop
1f09 | Move { destination: B, source: B }
1f0a | Move { destination: B, source: A }
1f0b | Move { destination: C, source: B }
1f0c | Move { destination: D, source: B }
1f0d | Move { destination: H, source: B }
1f0e | Nop
1f0f | Nop
1f10 | Nop
1f11 | LoadImmediate(MemoryRef, 0049)
1f13 | Move { destination: C, source: C }
1f14 | Move { destination: C, source: C }
1f15 | LoadImmediate(MemoryRef, 0000)
1f17 | Nop
1f18 | Nop
1f19 | LoadLargeImmediate(Sp, 4949)
1f1c | Move { destination: C, source: D }
1f1d | Increment(A)
1f1e | Nop
1f1f | Nop
1f20 | Nop
1f21 | Invalid(0008)
1f22 | Increment(D)
1f23 | DirectAddress(StoreHl, 0041)
1f26 | Nop
1f27 | Nop
1f28 | Nop
1f29 | Nop
1f2a | Move { destination: B, source: C }
1f2b | DirectAddress(StoreHl, 0814)
1f2e | Nop
1f2f | Nop
1f30 | Nop
1f31 | Nop
1f32 | Nop
1f33 | Nop
1f34 | Nop
1f35 | Nop
1f36 | Nop
1f37 | Nop
1f38 | Nop
1f39 | Increment(D)
1f3a | Increment(D)
1f3b | Increment(D)
1f3c | Increment(D)
1f3d | Increment(D)
1f3e | Nop
1f3f | Nop
1f40 | Nop
1f41 | DirectAddress(StoreHl, 7f14)
1f44 | Increment(D)
1f45 | DirectAddress(StoreHl, 0000)
1f48 | Nop
1f49 | IncrementPair(Bc)
1f4a | Increment(B)
1f4b | Move { destination: A, source: B }
1f4c | Increment(B)
1f4d | IncrementPair(Bc)
1f4e | Nop
1f4f | Nop
1f50 | Increment(H)
1f51 | DecrementPair(De)
1f52 | LoadImmediate(H, 000e)
1f54 | LoadLargeImmediate(De, 1c26)
1f57 | LoadImmediate(H, 000f)
1f59 | DecrementPair(Bc)
1f5a | Nop
1f5b | Invalid(0018)
1f5c | Increment(B)
1f5d | LoadLargeImmediate(De, 2512)
1f60 | LoadImmediate(H, 0026)
1f62 | Invalid(0028)
1f63 | DecrementPair(De)
1f64 | LoadImmediate(H, 000f)
1f66 | DecrementPair(Bc)
1f67 | Nop
1f68 | Invalid(0018)
1f69 | Increment(B)
1f6a | LoadLargeImmediate(De, 2626)
1f6d | DecrementPair(De)
1f6e | LoadImmediate(H, 0002)
1f70 | LoadImmediate(C, 0008)
1f72 | Decrement(C)
1f73 | LoadImmediate(H, 0001)
1f75 | LoadLargeImmediate(Bc, 0000)
1f78 | LoadLargeImmediate(Bc, 0200)
1f7b | LoadLargeImmediate(Bc, 0200)
1f7e | LoadLargeImmediate(Bc, 6000)
1f81 | Invalid(0010)
1f82 | RotateAccumulator(Right)
1f83 | Invalid(0010)
1f84 | Move { destination: H, source: B }
1f85 | Invalid(0030)
1f86 | Invalid(0018)
1f87 | LoadAccumulator(De)
1f88 | Decrement(A)
1f89 | Move { destination: L, source: B }
1f8a | Call(Minus, 68fc)
1f8d | Decrement(A)
1f8e | LoadAccumulator(De)
1f8f | Nop
1f90 | Invalid(0008)
1f91 | Decrement(C)
1f92 | StoreAccumulator(De)
1f93 | Increment(B)
1f94 | LoadLargeImmediate(De, 2613)
1f97 | LoadImmediate(H, 0002)
1f99 | LoadImmediate(C, 0008)
1f9b | Decrement(C)
1f9c | Decrement(C)
1f9d | DirectAddress(LoadHl, 1f50)
1fa0 | LoadAccumulator(Bc)
1fa1 | DirectAddress(LoadHl, 1f62)
1fa4 | RotateAccumulator(Left)
1fa5 | DirectAddress(LoadHl, 1fe1)
1fa8 | Restart(0007)
1fa9 | StoreAccumulator(Bc)
1faa | LoadLargeImmediate(De, 0304)
1fad | Invalid(0008)
1fae | IncrementPair(De)
1faf | LoadImmediate(H, 0000)
1fb1 | Move { destination: H, source: B }
1fb2 | Invalid(0010)
1fb3 | RotateAccumulator(Right)
1fb4 | Invalid(0010)
1fb5 | Move { destination: H, source: B }
1fb6 | Invalid(0038)
1fb7 | AddToHl(De)
1fb8 | DirectAddress(LoadAccumulator, fa6d)
1fbb | Jump(Minus, 3a6d)
1fbe | AddToHl(De)
1fbf | Nop
1fc0 | Nop
1fc1 | Invalid(0020)
1fc2 | Move { destination: B, source: B }
1fc3 | Move { destination: C, source: L }
1fc4 | Move { destination: D, source: B }
1fc5 | Invalid(0020)
1fc6 | Nop
1fc7 | Nop
1fc8 | Nop
1fc9 | Nop
1fca | Nop
1fcb | Restart(0007)
1fcc | ToAccumulator(Compare, B)
1fcd | Restart(0007)
1fce | ToAccumulator(Add, B)
1fcf | RotateAccumulator(RightThroughCarry)
1fd0 | Invalid(0010)
1fd1 | ToAccumulator(Subtract, A)
1fd2 | Nop
1fd3 | ToAccumulator(Add, B)
1fd4 | RotateAccumulator(RightThroughCarry)
1fd5 | Nop
1fd6 | Nop
1fd7 | LoadLargeImmediate(Bc, 22d0)
1fda | Invalid(0020)
1fdb | Increment(E)
1fdc | Invalid(0010)
1fdd | ToAccumulator(Subtract, H)
1fde | Nop
1fdf | Invalid(0020)
1fe0 | Increment(E)
1fe1 | Invalid(0028)
1fe2 | Increment(E)
1fe3 | LoadImmediate(H, 000f)
1fe5 | DecrementPair(Bc)
1fe6 | Nop
1fe7 | Invalid(0018)
1fe8 | Increment(B)
1fe9 | LoadLargeImmediate(De, 2612)
1fec | Increment(E)
1fed | LoadImmediate(H, 0002)
1fef | LoadImmediate(C, 0008)
1ff1 | Decrement(C)
1ff2 | StoreAccumulator(De)
1ff3 | RotateAccumulator(Right)
1ff4 | Increment(D)
1ff5 | StoreAccumulator(De)
1ff6 | RotateAccumulator(Left)
1ff7 | LoadImmediate(H, 0000)
1ff9 | Invalid(0008)
1ffa | Invalid(0008)
1ffb | Invalid(0008)
1ffc | Invalid(0008)
1ffd | Invalid(0008)
1ffe | Nop
1fff | Nop
