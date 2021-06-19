.include "standard.inc"

	.text

START_FUNC ceilf
	frintp s0, s0
	ret
END_FUNC ceilf





START_FUNC fabsf
	fabs s0, s0
	ret
END_FUNC fabsf





START_FUNC fabsl
	str q0, [sp, -16]!
	ldrb w8, [sp, 15]
	and w8, w8, 0x7F
	strb w8, [sp, 15]
	ldr q0, [sp], 16
	ret
END_FUNC fabsl





START_FUNC floorf
	frintm s0, s0
	ret
END_FUNC floorf





START_FUNC sqrtf
	fsqrt s0, s0
	ret
END_FUNC sqrtf
