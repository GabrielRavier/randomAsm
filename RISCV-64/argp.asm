__argp_usage:
	lui a5, %hi(stderr)
	ld a1, %lo(stderr)(a5)

	li a2, 0x106
	tail __argp_state_help





__option_is_short:
	lw a5, 24(a0)
	andi a5, 8
	sext.w a5
	bnez a5, .ret0

	lw a0, 8(a0)
	li a4, 0xFE
	addiw a3, a0, -1
	bleu a3, a4, .continue

	mv a0, a5
	ret

.continue:
	addi sp, -0x10
	sd ra, 8(sp)

	call isprint

	ld ra, 8(sp)
	snez a5, a0
	mv a0, a5
	addi sp, 0x10
	jr ra

.ret0:
	li a5, 0
	mv a0, a5
	ret





__option_is_end:
	lw a4, 8(a0)
	mv a5, a0
	bnez a4, .ret0

	ld a4, 0(a0)
	li a0, 0
	beqz a4, .continue

.return:
	ret

.ret0:
	li a0, 0
	ret

.continue:
	ld a4, 32(a5)
	bnez a4, .return

	lw a0, 40(a5)
	seqz a0
	ret
