.include "standard.inc"

	.text

.macro make_sub name, reg0, reg1

START_FUNC \name
	fsub \reg0, \reg0, \reg1
	ret
END_FUNC \name

.endm

	make_sub subflt, s0, s1
	make_sub subdbl, d0, d1
	make_jump_func subldbl, __subtf3
	make_sub subfp16, h0, h1

.macro make_csub name, reg0, reg1, reg2, reg3

START_FUNC \name
	fsub \reg0, \reg0, \reg2
	fsub \reg1, \reg1, \reg3
	ret
END_FUNC \name

.endm

	make_csub subcflt, s0, s1, s2, s3
	make_csub subcdbl, d0, d1, d2, d3





START_FUNC subcldbl
	sub sp, sp, 64
	stp x29, x30, [sp, 48]
	add x29, sp, 48

	str q1, [sp, 16]
	mov v1.16b, v2.16b
	stur q3, [x29, -16]
	bl __subtf3
	str q0, [sp]

	ldr q0, [sp, 16]
	ldur q1, [x29, -16]
	bl __subtf3

	mov v1.16b, v0.16b
	ldr q0, [sp]

	ldp x29, x30, [sp, 48]
	add sp, sp, 64
	ret
END_FUNC subcldbl
