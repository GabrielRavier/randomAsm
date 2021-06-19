.include "standard.inc"

	.text

START_FUNC addflt
	fadd s0, s0, s1
	ret
END_FUNC addflt





START_FUNC adddbl
	fadd d0, d1, d1
	ret
END_FUNC adddbl





START_FUNC addldbl
	b __addtf3
END_FUNC addldbl





START_FUNC addfp16
	fadd h0, h0, h1
	ret
END_FUNC addfp16





START_FUNC addcflt
	fadd s1, s1, s3
	fadd s0, s0, s2
	ret
END_FUNC addcflt





START_FUNC addcdbl
	fadd d1, d1, d3
	fadd d0, d0, d2
	ret
END_FUNC addcdbl





START_FUNC addcldbl
	stp x29, x30, [sp, -48]!
	mov x29, sp
	str q3, [sp, 16]
	str q1, [sp, 32]
	mov v1.16b, v2.16b
	bl __addtf3
	mov v2.16b, v0.16b
	ldr q3, [sp, 16]
	ldr q4, [sp, 32]
	str q2, [sp, 16]
	mov v1.16b, v3.16b
	mov v0.16b, v4.16b
	bl __addtf3
	ldr q2, [sp, 16]
	mov v1.16b, v0.16b
	ldp x29, x30, [sp], 48
	mov v0.16b, v2.16b
	ret
END_FUNC addcldbl
