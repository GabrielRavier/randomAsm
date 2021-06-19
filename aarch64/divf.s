.include "standard.inc"

	.text

.macro make_divf name, reg0, reg1

START_FUNC \name
	fdiv \reg0, \reg0, \reg1
	ret
END_FUNC \name

.endm

	make_divf divflt, s0, s1
	make_divf divdbl, d0, d1

	make_jump_func divldbl, __divtf3
	make_divf divfp16, h0, h1
	make_jump_func divcflt, __divsc3
	make_jump_func divcdbl, __divdc3
	make_jump_func divcldbl, __divtc3
