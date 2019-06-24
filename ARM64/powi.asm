powi:
__powidf2:
	mov w1, w0
	fmov d1, 1.0e+0

.loop:
	fmul d2, d1, d0
	tst x1, 1

	add w1, lsr 31
	fmul d0
	asr w1, 1

	fcsel d1, d2, d1, ne
	cbnz w1, .loop
	tbz w0, #31, .return

	fmov d0, 1.0e+0
	fdiv d1, d0, d1

.return:
	fmov d0, d1
	ret





powif:
__powisf2:
	mov w1, w0
	fmov s1, 1.0e+0

.loop:
	fmul s2, s1, s0
	tst x1, 1

	add w1, lsr 31
	fmul s0
	asr w1, 1

	fcsel s1, s2, s1, ne
	cbnz w1, .loop
	tbz w0, #31, .return

	fmov s0, 1.0e+0
	fdiv s1, s0, s1

.return:
	fmov s0, s1
	ret
