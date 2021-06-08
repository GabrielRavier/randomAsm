	.text

__rold:
	neg a2, a1
	sll a1, a0, a1
	srl a0, a2
	or a0, a1
	ret





__rord:
	neg a2, a1
	srl a1, a0, a1
	sll a0, a2
	or a0, a1
	ret





__rolq:
	neg t0, a2
	andi a3, t0, 0x3F
	li a7, 0x1F
	andi a4, a2, 0x3F
	addi a5, a3, -0x20
	bltz a5, .ltz

	srl a6, a1, a5
	addi a3, a4, -0x20
	bgez a3, .gez

.ltz2:
	sub a7, a4
	srli a4, a0, 1
	srl a7, a4, a7
	sll a4, a1, a2
	or a7, a4, a7
	bgez a5, .gez2

.ltz3:
	srl a1, t0
	bgez a3, .ret

.ret2:
	sll a0, a2
	or a1, a7, a1
	or a0, a6
	ret

.ltz:
	sub a6, a7, a3
	slli a3, a1, 1
	sll a6, a3, a6
	srl a3, a0, t0
	or a6, a3, a6

	addi a3, a4, -0x20
	bltz a3, .ltz2

.gez:
	sll a7, a0, a3
	bltz a5, .ltz3

.gez2:
	li a1, 0
	bltz a3, .ret2

.ret:
	li a0, 0
	or a1, a7, a1
	or a0, a6
	ret





__rorq:
	neg t0, a2
	andi a3, t0, 0x3F
	li a7, 0x1F
	andi a4, a2, 0x3F
	addi a5, a3, -0x20
	bltz a5, .ltz

	sll a6, a0, a5
	addi a3, a4, -0x20
	bgez a3, .gez

.ltz2:
	sub a7, a4
	slli a4, a1, 1
	sll a7, a4, a7
	srl a4, a0, a2
	or a7, a4, a7
	bgez a5, .gez2

.ltz3:
	sll a0, t0
	bgez a3, .ret

.ret2:
	srl a1, a2
	or a0, a7, a0
	or a1, a6
	ret

.ltz:
	sub a6, a7, a3
	srli a3, a0, 1
	srl a6, a3, a6
	sll a3, a0, t0
	or a6, a3, a6

	addi a3, a4, -0x20
	bltz a3, .ltz2

.gez:
	srl a7, a1, a3
	bltz a5, .ltz3

.gez2:
	li a0, 0
	bltz a3, .ret2

.ret:
	li a1, 0
	or a0, a7, a0
	or a1, a6
	ret
