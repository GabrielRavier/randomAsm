.include "standard.inc"

	.text

START_FUNC ceilf
	frintp s0
	ret
END_FUNC ceilf





START_FUNC fabsf
	fabs s0
	ret
END_FUNC fabsf





START_FUNC fabsl
	fmov x0, d0
	fmov x1, v0.d[1]
	mov x3, x0
	fmov d0, x3
	mov x2, x1

	and x1, x2, 0x7FFFFFFFFFFFFFFF
	fmov v0.d[1], x1
	ret
END_FUNC fabsl





START_FUNC floorf
	frintm s0
	ret
END_FUNC floorf





START_FUNC sqrtf
	fsqrt s0
	ret
END_FUNC sqrtf
