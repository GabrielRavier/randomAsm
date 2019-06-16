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
	sext.w a1
	sd a1, 0(a0)
	ret





N_BADMAG:
	lui a1, 16
	addiw a1, -1

	lh a0, 0(a0)
	addi a0, -204
	and a1, a0
	li a2, 0x3F
	bltu a2, a1, .ret1

	li a1, 13
	slli a1, 59
	addi a1, -2

	srl a0, a1, a0
	andi a0, 1
	ret

.ret1:
	li a0, 1
	ret
