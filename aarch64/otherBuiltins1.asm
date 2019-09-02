	.text

bcmp:
	b memcmp





bzero:
	mov x2, x1
	mov w1, 0
	b memset





ffs:
	rbit w1, w0
	cmp w0, 0
	clz w1

	csinc w0, wzr, w1, eq
	ret





ffsl:
ffsll:
	rbit x1, x0
	cmp x0, 0
	clz x1
	csinc x1, xzr, x1, eq
	ret





isascii:
	tst w0, -0x80
	cset w0, eq
	ret





signbitf:
	fcmpe s0, #0.0
	cset w0, mi
	ret





signbitl:
	movi v1.2d, #0
	stp x29, x30, [sp, -0x10]!
	mov x29, sp
	bl __lttf2

	lsr w0, 0x1F
	ldp x29, x30, [sp], 0x10





signbit:
	fcmpe d0, #0.0
	cset w0, mi
	ret





toascii:
	and w0, 0x7F
	ret
