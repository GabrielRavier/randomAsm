.include "standard.inc"

	.text

	make_jump_func bcmp, memcmp





START_FUNC bzero
	mov x2, x1
	mov w1, 0
	b memset
END_FUNC bzero





START_FUNC ffs
	rbit w1, w0
	cmp w0, 0
	clz w1, w1

	csinc w0, wzr, w1, eq
	ret
END_FUNC ffs





START_FUNC ffsl
START_FUNC ffsll
	rbit x1, x0
	cmp x0, 0
	clz x1, x1
	csinc x1, xzr, x1, eq
	ret
END_FUNC ffsl
END_FUNC ffsll





START_FUNC isascii
	tst w0, -0x80
	cset w0, eq
	ret
END_FUNC isascii





START_FUNC mempcpy
	stp x29, x30, [sp, -32]!
	mov x29, sp
	str x19, [sp, 16]

	mov x19, x2
	bl memcpy
	add x0, x0, x19

	ldr x19, [sp, 16]
	ldp x29, x30, [sp], 32
	ret
END_FUNC mempcpy





START_FUNC signbitf
	fmov w0, s0
	and w0, w0, -0x80000000
	ret
END_FUNC signbitf





START_FUNC signbitl
	str q0, [sp, -16]!
	ldr x8, [sp, 8]
	lsr x0, x8, 63
	add sp, sp, 16
	ret
END_FUNC signbitl





START_FUNC signbit
	fmov x0, d0
	lsr x0, x0, 63
	ret
END_FUNC signbit





START_FUNC toascii
	and w0, w0, 0x7F
	ret
END_FUNC toascii
