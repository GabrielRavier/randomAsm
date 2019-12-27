	.text

__argp_usage:
	lui a1, %hi(stderr)
	lw a1, %lo(stderr)(a1)
	li a2, 0x106
	tail __argp_state_help





__option_is_short:
	addi sp, -0x10
	sw ra, 12(sp)
	lbu a1, 12(a0)
	andi a2, a1, 8
	li a1, 0
	bnez a2, .retA1

	lw a0, 4(a0)
	addi a1, a0, -1
	li a2, 0xFE
	bltu a2, a1, .ret0

	call isprint
	snez a1, a0

.retA1:
	mv a0, a1
	lw ra, 12(sp)
	addi sp, 0x10
	ret

.ret0:
	li a1, 0
	mv a0, a1
	lw ra, 12(sp)
	addi sp, 0x10
	ret





__option_is_end:
	lw a2, 4(a0)
	li a0, 0
	bnez a2, .return

	lw a2, 0(a0)
	bnez a2, .return

	lw a2, 16(a0)
	beqz a2, .continue

.retA1:
	ret

.continue:
	lw a0, 20(a0)
	seqz a0
	ret
