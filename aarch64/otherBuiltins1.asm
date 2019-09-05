.include "standard.inc"

	.text

START_FUNC bcmp
	b memcmp
END_FUNC bcmp





START_FUNC bzero
	mov x2, x1
	mov w1, 0
	b memset
END_FUNC bzero





START_FUNC ffs
	rbit w1, w0
	cmp w0, 0
	clz w1

	csinc w0, wzr, w1, eq
	ret
END_FUNC ffs





START_FUNC ffsl
START_FUNC ffsll
	rbit x1, x0
	cmp x0, 0
	clz x1
	csinc x1, xzr, x1, eq
	ret
END_FUNC ffsl
END_FUNC ffsll





START_FUNC isascii
	tst w0, -0x80
	cset w0, eq
	ret
END_FUNC isascii





START_FUNC signbitf
	fcmpe s0, #0.0
	cset w0, mi
	ret
END_FUNC signbitf





START_FUNC signbitl
	movi v1.2d, #0
	stp x29, x30, [sp, -0x10]!
	mov x29, sp
	bl __lttf2

	lsr w0, 0x1F
	ldp x29, x30, [sp], 0x10
END_FUNC signbitl





START_FUNC signbit
	fcmpe d0, #0.0
	cset w0, mi
	ret
END_FUNC signbit





START_FUNC toascii
	and w0, 0x7F
	ret
END_FUNC toascii
