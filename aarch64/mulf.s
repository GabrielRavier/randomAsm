.include "standard.inc"

	.text

.macro make_mul name, reg0, reg1

START_FUNC \name
	fmul \reg0, \reg0, \reg1
	ret
END_FUNC \name

.endm

	make_mul mulflt, s0, s1
	make_mul muldbl, d0, d1
	make_jump_func mulldbl, __multf3
	make_mul mulfp16, h0, h1

.macro make_complex name, label_name, func, reg0, reg1, reg2, reg3, reg4, reg5

START_FUNC \name
	fmul \reg5, \reg1, \reg2
	fmul \reg4, \reg1, \reg3
	fmadd \reg5, \reg0, \reg3, \reg5
	fnmsub \reg4, \reg0, \reg2, \reg4
	fcmp \reg4, \reg5
	bvs \label_name

	fmov \reg1, \reg5
	fmov \reg0, \reg4
	ret

\label_name:
	stp x29, x30, [sp, -16]!
	mov x29, sp
	bl \func
	ldp x29, x30, [sp], 16
	ret
END_FUNC \name

.endm

	make_complex mulcflt, .LFdo_mulsc3, __mulsc3, s0, s1, s2, s3, s4, s5
	make_complex mulcdbl, .LDdo_muldc3, __muldc3, d0, d1, d2, d3, d4, d5

START_FUNC mulcldbl
	stp x29, x30, [sp, -112]!
	mov x29, sp
	str q1, [sp, 16]
	mov v1.16b, v2.16b
	str q3, [sp, 32]
	str q0, [sp, 48]
	str q2, [sp, 96]

	bl __multf3
	str q0, [sp, 64]

	ldr q0, [sp, 16]
	ldr q1, [sp, 32]
	bl __multf3
	mov v1.16b, v0.16b

	ldr q4, [sp, 64]
	mov v0.16b, v4.16b
	bl __subtf3
	str q0, [sp, 80]

	ldr q1, [sp, 32]
	ldr q0, [sp, 48]
	bl __multf3
	str q0, [sp, 64]

	ldr q0, [sp, 16]
	ldr q2, [sp, 96]
	mov v1.16b, v2.16b
	bl __multf3

	ldr q6, [sp, 64]
	mov v1.16b, v0.16b
	mov v0.16b, v6.16b
	bl __addtf3
	mov v1.16b, v0.16b

	ldr q4, [sp, 80]
	mov v0.16b, v4.16b
	str q1, [sp, 64]
	bl __unordtf2

	ldr q1, [sp, 64]
	ldr q4, [sp, 80]
	ldr q2, [sp, 64]
	cbnz w0, .LLDdo_multc3

.LLDdo_ret:
	mov v0.16b, v4.16b
	ldp x29, x30, [sp], 112
	ret

.LLDdo_multc3:
	ldr q1, [sp, 16]
	ldr q3, [sp, 32]
	ldr q0, [sp, 48]
	bl __multc3
	mov v4.16b, v0.16b
	b .LLDdo_ret
END_FUNC mulcldbl
