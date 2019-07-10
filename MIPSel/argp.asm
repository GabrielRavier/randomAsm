	.text

__argp_usage:
	lui $2, %hi(stderr)
	lw $5, %lo(stderr)($2)
	j __argp_state_help
	li $6, 0x106





__option_is_short:
	lw $2, 12($4)
	andi $2, 8
	bne $2, $0, .ret2
	nop

	lw $4, 4($4)
	addiu $3, $4, -1
	sltu $3, 0xFF
	bnel $3, $0, .continue
	addiu $sp, -0x20

	j $31
	nop

.ret2:
	j $31
	move $2, $0

.continue:
	sw $31, 28($sp)
	jal isprint
	nop
	
	lw $31, 28
	sltu $2, $0, $2
	j $31
	addiu $sp, 0x20





__option_is_end:
	lw $2, 4($4)
	bne $2, $0, .ret2
	nop

	lw $3, 0($4)
	beql $3, $0, .continue
	lw $3, 16($4)

.return:
	j $31
	nop

.ret2:
	j $31
	move $2, $0

.continue:
	bne $3, $0, .return
	nop

	lw $2, 20($4)
	j $31
	sltu $2, 1
