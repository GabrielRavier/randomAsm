__paritydi2:
	srai a5, a0, 32
	xor a0, a5, a0
	sext.w a0
	tail __paritysi2





__paritysi2:
	srliw a5, a0, 16
	xor a0, a5, a0
	sext.w a0

	srliw a5, a0, 8
	xor a0, a5
	sext.w a0

	srliw a5, a0, 4
	xor a0, a5

	li a5, 0x7000
	addiw a5, -0x66A
	andi a0, 0xF
	sraw a0, a5, a0

	andi a0, 1
	ret
