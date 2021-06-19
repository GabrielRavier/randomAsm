.include "standard.inc"

	.text

.macro make_func name, reg0

START_FUNC \name
	fneg \reg0, \reg0
	ret
END_FUNC \name

.endm

	make_func negflt, s0
	make_func negdbl, d0

START_FUNC negldbl
	str q0, [sp, -16]!

	ldrb w8, [sp, 15]
	eor w8, w8, 0x80
	strb w8, [sp, 15]

	ldr q0, [sp], 16
	ret
END_FUNC negldbl

	make_func negfp16, h0

.macro make_complex name, reg0, reg1

START_FUNC \name
	fneg \reg0, \reg0
	fneg \reg1, \reg1
	ret
END_FUNC \name

.endm

	make_complex negcflt, s0, s1
	make_complex negcdbl, d0, d1

START_FUNC negcldbl
	stp q0, q1, [sp, -32]!

	ldrb w8, [sp, 15]
	eor w8, w8, 0x80
	strb w8, [sp, 15]

	ldrb w8, [sp, 31]
	eor w8, w8, 0x80
	strb w8, [sp, 31]

	ldp q0, q1, [sp], 32
	ret
END_FUNC negcldbl
