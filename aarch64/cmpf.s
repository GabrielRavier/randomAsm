.include "standard.inc"

	.text

.macro make_cmp name, op, reg0, reg1

START_FUNC \name
	fcmp \reg0, \reg1
	cset w0, \op
	ret
END_FUNC \name

.endm

	make_cmp cmpeqflt, eq, s0, s1
	make_cmp cmpeqdbl, eq, d0, d1

.macro make_cmp_ldbl name, func, op

START_FUNC \name
	stp x29, x30, [sp, -16]!
	mov x29, sp
	bl \func

	cmp w0, 0
	cset w0, \op
	ldp x29, x30, [sp], 16
	ret
END_FUNC \name

.endm

	make_cmp_ldbl cmpeqldbl, __eqtf2, eq
	make_cmp cmpeqfp16, eq, h0, h1

.macro make_cmp_complex name, op, reg0, reg1, reg2, reg3

START_FUNC \name
	fcmp \reg0, \reg2
	fccmp \reg1, \reg3, 0, eq
	cset w0, \op
	ret
END_FUNC \name

.endm

	make_cmp_complex cmpeqcflt, eq, s0, s1, s2, s3
	make_cmp_complex cmpeqcdbl, eq, d0, d1, d2, d3

.macro make_cmp_complex_ldbl name, func, op1, op2

START_FUNC \name
	sub sp, sp, 64
	stp x29, x30, [sp, 32]
	str x19, [sp, 48]
	add x29, sp, 32
	stp q1, q3, [sp]
	mov v1.16b, v2.16b
	bl \func

	ldp q0, q1, [sp]
	cmp w0, 0
	cset w19, \op1

	bl \func
	cmp w0, 0
	cset w8, \op1

	\op2 w0, w19, w8
	ldr x19, [sp, 48]
	ldp x29, x30, [sp, 32]
	add sp, sp, 64
	ret
END_FUNC \name

.endm

	make_cmp_complex_ldbl cmpeqcldbl, __eqtf2, eq, and

	make_cmp cmpneflt, ne, s0, s1
	make_cmp cmpnedbl, ne, d0, d1
	make_cmp_ldbl cmpneldbl, __netf2, ne
	make_cmp cmpnefp16, ne, h0, h1
	make_cmp_complex cmpnecflt, ne, s0, s1, s2, s3
	make_cmp_complex cmpnecdbl ne, d0, d1, d2, d3
	make_cmp_complex_ldbl cmpnecldbl, __netf2, ne, orr

	make_cmp cmpltflt, mi, s0, s1
	make_cmp cmpltdbl, mi, d0, d1

START_FUNC cmpltldbl
	stp x29, x30, [sp, -16]!
	mov x29, sp
	bl __lttf2
	lsr w0, w0, 31
	ldp x29, x30, [sp], 16
	ret
END_FUNC cmpltldbl

	make_cmp cmpltfp16 mi, h0, h1

	make_cmp cmpgtflt gt, s0, s1
	make_cmp cmpgtdbl gt, d0, d1
	make_cmp_ldbl cmpgtldbl, __gttf2, gt
	make_cmp cmpgtfp16 gt, h0, h1

	make_cmp cmpleflt ls, s0, s1
	make_cmp cmpledbl ls, d0, d1
	make_cmp_ldbl cmpleldbl, __letf2, le
	make_cmp cmplefp16 ls, h0, h1

	make_cmp cmpgeflt ge, s0, s1
	make_cmp cmpgedbl ge, d0, d1
	make_cmp_ldbl cmpgeldbl, __getf2, ge
	make_cmp cmpgefp16 ge, h0, h1

.macro make_cmp_generic name, reg0, reg1

START_FUNC \name
	fcmp \reg0, \reg1
	cset w1, gt
	cset w0, mi
	eor w0, w1, w0
	ret
END_FUNC \name

.endm

	make_cmp_generic cmpgenericflt, s0, s1
	make_cmp_generic cmpgenericdbl, d0, d1

START_FUNC cmpgenericldbl
	stp x29, x30, [sp, -64]!
	mov x29, sp
	str x19, [sp, 16]
	str q1, [sp, 32]
	str q0, [sp, 48]

	bl __gttf2
	cmp w0, 0
	cset w19, gt

	ldr q2, [sp, 32]
	ldr q4, [sp, 48]
	mov v1.16b, v2.16b
	mov v0.16b, v4.16b
	bl __lttf2
	eor w0, w19, w0, lsr 31

	ldr x19, [sp, 16]
	ldp x29, x30, [sp], 64
	ret
END_FUNC cmpgenericldbl

	make_cmp_generic cmpgenericfp16 h0, h1
