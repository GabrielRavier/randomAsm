clzll:
	lui a2, 0x55555
	addi a5, a2, 0x555

	lui a2, 0x33333
	addi a4, a2, 0x333

	lui a2, 0xF0F1
	addi a2, -0xF1

	lui a3, 0x1010
	addi a3, 0x101

	bnez a1, .continue

	srli a1, a0, 1
	or a0, a1

	srli a1, a0, 2
	or a0, a1

	srli a1, a0, 4
	or a0, a1

	srli a1, a0, 8
	or a0, a1

	srli a1, a0, 16
	or a0, a1
	not a0

	srli a1, a0, 1
	and a1, a5
	sub a0, a1
	and a1, a0, a4

	srli a0, 2
	and a0, a4
	add a0, a1

	srli a1, a0, 4
	add a0, a1
	and a0, a2
	mul a0, a3

	srli a0, 24
	addi a0, 32
	ret

.continue:
	srli a0, a1, 1
	or a0, a1

	srli a1, a0, 2
	or a0, a1

	srli a1, a0, 4
	or a0, a1

	srli a1, a0, 8
	or a0, a1

	srli a1, a0, 16
	or a0, a1
	not a0

	srli a1, a0, 1
	and a1, a5
	sub a0, a1
	and a1, a0, a4

	srli a0, 2
	and a0, a4
	add a0, a1

	srli a1, a0, 4
	add a0, a1
	and a0, a2
	mul a0, a3

	srli a0, 24
	ret
