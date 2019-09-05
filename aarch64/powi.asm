.include "standard.inc"

	.text

START_FUNC powi
START_FUNC __powidf2
	mov w1, w0
	fmov d1, 1.0e+0

.LDloop:
	fmul d2, d1, d0
	tst x1, 1

	add w1, lsr 0x1F
	fmul d0
	asr w1, 1

	fcsel d1, d2, d1, ne
	cbnz w1, .LDloop
	tbz w0, #31, .return

	fmov d0, 1.0e+0
	fdiv d1, d0, d1

.LDreturn:
	fmov d0, d1
	ret
END_FUNC powi
END_FUNC __powidf2





START_FUNC powif
START_FUNC __powisf2
	mov w1, w0
	fmov s1, 1.0e+0

.LSloop:
	fmul s2, s1, s0
	tst x1, 1

	add w1, lsr 0x1F
	fmul s0
	asr w1, 1

	fcsel s1, s2, s1, ne
	cbnz w1, .LSloop
	tbz w0, #31, .return

	fmov s0, 1.0e+0
	fdiv s1, s0, s1

.LSreturn:
	fmov s0, s1
	ret
END_FUNC powif
END_FUNC __powisf2
