bswap16:
	srliw a5, a0, 8
	slli a0, 8
	or a0, a5

	slli a0, 48
	srli a0, 48
	ret





bswap32:
__bswapsi2:
	slliw a3, a0, 24
	srliw a5, a0, 24
	or a5, a3

	li a3, 0x10000
	srliw a4, a0, 8
	addi a3, -0x100
	and a4, a3
	or a5, a4

	slliw a0, 8
	li a4, 0xFF0000
	and a0, a4

	or a0, a5, a0

	sext.w a0
	ret





bswap64:
__bswapdi2:
	slli a2, a0, 56
	srli a5, a0, 56
	or a5, a2

	li a2, 0x10000
	srli a3, a0, 40
	addi a2, -0x100
	and a3, a2

	li a4, 0xFF
	srli a2, a0, 24
	or a5, a3

	li a3, 0xFF0000
	and a2, a3

	slli a1, a4, 24
	srli a3, a0, 8
	and a3, a1
	or a5, a2

	slli a1, a4, 32
	slli a2, a0, 8
	and a2, a1
	or a5, a3

	slli a1, a4, 40
	slli a3, a0, 24
	or a5, a2
	and a3, a1

	slli a4, 48
	slli a0, 40
	or a5, a3
	and a0, a4

	or a0, a5, a0
	ret
