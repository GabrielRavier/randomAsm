fabsf:
	fabs.s fa0
	ret





fabsl:
	li a5, -1
	srli a5, 1
	and a1, a5
	ret





sqrtf:
	fsqrt.s fa0
	ret
