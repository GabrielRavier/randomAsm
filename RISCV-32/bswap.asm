bswap16:
	slli a1, a0, 8
	slli a0, 24
	or a0, a1
	srli a0, 16
	ret





bswap32:
	lui a1, 16
	addi a1, -0x100

	srli a2, a0, 8
	and a1, a2

	srli a2, a0, 24
	or a1, a2

	slli a2, a0, 8
	lui a3, 0xFF0
	and a2, a3

	slli a0, 24
	or a0, a2
	or a0, a1
	ret





bswap64:
	lui a2, 16
	addi a3, a2, -0x100

	srli a2, a1, 8
	and a2, a3

	srli a4, a1, 24
	or a2, a4

	slli a4, a1, 8
	lui a5, 0xFF0
	and a4, a5

	slli a1, 24
	or a1, a4
	or a2, a1

	srli a1, a0, 8
	and a1, a3

	srli a3, a0, 24
	or a0, a3
	or a1, a0
	mv a0, a2
	ret
