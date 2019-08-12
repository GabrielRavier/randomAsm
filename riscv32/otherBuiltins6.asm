	.text

clz:
clzl:
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

	lui a1, 0x55555
	addi a1, 0x555

	not a0

	srli a2, a0, 1
	and a1, a2
	sub a0, a1

	lui a1, 0x33333
	addi a1, 0x333
	and a2, a0, a1

	srli a0, 2
	and a0, a1
	add a0, a2

	srli a1, a0, 4
	add a0, a1

	lui a1, 0xF0F1
	addi a1, -0xF1
	and a0, a1

	lui a1, 0x1010
	addi a1, 0x1010

	mul a0, a1
	srli a0, 24
	ret





ctz:
ctzl:
	addi a1, a0, -1
	not a0
	and a0, a1

	lui a1, 0x55555
	addi a1, 0x555

	srli a2, a0, 1
	and a1, a2
	sub a0, a1

	lui a1, 0x33333
	addi a1, 0x333
	and a2, a0, a1

	srli a0, 2
	and a0, a1
	add a0, a2

	srli a1, a0, 4
	add a0, a1

	lui a1, 0xF0F1
	addi a1, -0xF1
	and a0, a1

	lui a1, 0x1010
	addi a1, 0x101

	mul a0, a1
	srli a0, 24
	ret





clrsb:
clrsbl:
	srai a1, a0, 0x1F
	xor a0, a1
	beqz a0, .ret31

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

	lui a1, 0x55555
	addi a1, 0x555
	not a0

	srli a2, a0, 1
	and a1, a2
	sub a0, a1

	lui a1, 0x33333
	addi a1, 0x333
	and a2, a0, a1

	srli a0, 2
	and a0, a1
	add a0, a2

	srli a1, a0, 4
	add a0, a1

	lui a1, 0xF0F1
	addi a1, -0xF1
	and a0, a1

	lui a1, 0x1010
	addi a1, 0x101
	mul a0, a1

	srli a0, 24
	addi a0, -1
	ret

.ret31:
	li a0, 31
	ret





popcount:
popcountl:
	lui a1, 0x55555
	addi a1, 0x555

	srli a2, a0, 1
	and a1, a2
	sub a0, a1

	lui a1, 0x33333
	addi a1, 0x333
	and a2, a0, a1

	srli a0, 2
	and a0, a1
	add a0, a2

	srli a1, a0, 4
	add a0, a1

	lui a1, 0xF0F1
	addi a1, -0xF1
	add a0, a1

	lui a1, 0x1010
	addi a1, 0x101

	mul a0, a1
	srli a0, 24
	ret





parity:
parityl:
	lui a1, 0x55555
	addi a1, 0x555

	srli a2, a0, 1
	and a1, a2
	sub a0, a1

	lui a1, 0x33333
	addi a1, 0x333
	and a2, a0, a1

	srli a0, 2
	and a0, a1
	add a0, a2

	srli a1, a0, 4
	add a0, a1

	lui a1, 0x10F1
	addi a1, -0xF1
	and a0, a1

	lui a1, 0x1010
	addi a1, 0x101
	mul a0, a1

	srli a0, 24
	andi a0, 1
	ret





clzll:
	lui a2, 0x55555
	addi a5, a2, 0x555

	lui a2, 0x33333
	addi a4, a2, 0x333

	lui a2, 0xF0F1
	addi a2, -0xF1

	lui a3, 0x1010
	addi a3, 0x101

	bnez a1, .nez

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

.nez:
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





ctzll:
	lui a2, 0x55555
	addi a5, a2, 0x555

	lui a2, 0x33333
	addi a4, a2, 0x333

	lui a2, 0xF0F1
	addi a2, -0xF1

	lui a3, 0x1010
	addi a3, 0x101

	bnez a1, .nez

	addi a0, a1, -1
	not a1
	and a0, a1

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

.nez:
	addi a1, a0, -1
	not a0
	and a0, a1

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





clrsbll:
	srai a5, a1, 0x1F
	xor a1, a5

	lui a2, 0x55555
	addi a4, a2, 0x555

	lui a2, 0x33333
	addi a3, a2, 0x333

	lui a2, 0xF0F1
	addi a6, a2, -0xF1

	lui a2, 0x1010
	addi a2, 0x101

	bnez a1, .nez

	xor a0, a5

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
	and a1, a4
	sub a0, a1
	and a1, a0, a3

	srli a0, 2
	and a0, a3
	add a0, a1

	srli a1, a0, 4
	add a0, a1
	and a0, a6
	mul a0, a2

	srli a0, 24
	addi a0, 31
	ret

.nez:
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
	and a1, a4
	sub a0, a1
	and a1, a0, a3

	srli a0, 2
	and a0, a3
	add a0, a1

	srli a1, a0, 4
	add a0, a1
	and a0, a6
	mul a0, a2

	srli a0, 24
	addi a0, -1
	ret





popcountll:
	lui a2, 0x55555
	addi a2, 0x555

	srli a3, a0, 1
	and a3, a2
	sub a0, a3

	lui a3, 0x33333
	addi a3, 0x333
	and a4, a0, a3

	srli a0, 2
	and a0, a3
	add a0, a4

	srli a4, a1, 1
	and a2, a4
	sub a1, a2

	srli a2, a0, 4
	add a0, a2
	and a2, a1, a3

	srli a1, 2
	and a1, a3
	add a1, a2

	srli a2, a1, 4
	add a1, a2

	lui a2, 0xF0F1
	addi a2, -0xF1
	and a1, a2
	and a0, a2

	lui a2, 0x1010
	addi a2, 0x101
	mul a0, a2
	mul a1, a2

	srli a1, 24
	srli a0, 24
	add a0, a2
	ret





parityll:
	lui a2, 0x55555
	addi a2, 0x555

	srli a3, a0, 1
	and a3, a2
	sub a0, a3

	lui a3, 0x33333
	addi a3, 0x333
	and a4, a0, a3

	srli a0, 2
	and a0, a3
	add a0, a4

	srli a4, a1, 1
	and a2, a4
	sub a1, a2

	srli a2, a0, 4
	add a0, a2
	and a2, a1, a3

	srli a1, 2
	and a1, a3
	add a1, a2

	srli a2, a1, 4
	add a1, a2

	lui a2, 0xF0F1
	addi a2, -0xF1
	and a1, a2
	and a0, a2

	lui a2, 0x1010
	addi a2, 0x101
	mul a0, a2
	mul a1, a2

	srli a1, 24
	srli a0, 24
	add a0, a2
	andi a0, 1
	ret
