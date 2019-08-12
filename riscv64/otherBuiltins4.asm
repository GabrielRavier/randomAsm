	.text

abs:
	sraiw a5, a0, 0x1F
	xor a0, a5

	subw a0, a5
	ret





fabs:
	fabs.d fa0
	ret





isdigit:
	addiw a0, -0x30
	sltiu a0, 10
	ret





labs:
	srai a5, a0, 0x3F
	xor a0, a5, a0

	sub a0, a5
	ret





sqrt:
	fsqrt.d fa0
	ret
