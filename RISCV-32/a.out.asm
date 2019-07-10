	.text

N_MAGIC:
	lhu a0, 0(a0)
	ret





N_MACHTYPE:
	lbu a0, 2(a0)
	ret





N_FLAGS:
	lbu a0, 3(a0)
	ret





N_SET_INFO:
	slli a2, 16
	or a1, a2
	slli a2, a3, 24
	or a1, a2
	sw a1, 0(a0)
	ret





N_BADMAG:
	mv a1, a0
	li a0, 0

	lhu a1, 0(a1)
	addi a2, a1, -263
	li a3, 4
	bltu a3, a2, .almostThere

	li a3, 1
	sll a2, a3, a2
	andi a2, 0x13
	bnez a2, .return

.almostThere:
	li a2, 0xCC
	bne a1, a2, .ret1

.return:
	ret

.ret1:
	li a0, 1
	ret
