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
	slliw a2, 16
	or a2, a1, a2
	slliw a3, 24
	or a2, a3
	sext.w a2
	sd a2, 0(a0)
	ret





N_BADMAG:
	lhu a5, 0(a0)
	li a4, 0x3F
	addi a5, -204
	bgtu a5, a4, .ret1

	li a0, -13
	slli a0, 59
	addi a0, 1
	srl a0, a5
	not a0
	andi a0, 1
	ret

.ret1:
	li a0, 1
	ret
