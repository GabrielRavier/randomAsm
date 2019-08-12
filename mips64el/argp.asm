	.text

__argp_usage:
	daddiu $sp, -0x10
	sd $28, 0(sp)
	lui $28, %hi(%neg(%gp_rel(__argp_usage)))
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(__argp_usage)))

	ld $2, %got_disp(stderr)($28)
	ld $25, %call16(__argp_state_help)($28)
	sd $31, 8($sp)
	ld $5, 0($2)

	jalr $25
	li $6, 0x106

	ld $31, 8($sp)
	ld $28, 0($sp)
	j $31
	daddiu $sp, 0x10





__option_is_short:
	lw $2, 24($4)
	andi $2, 8
	bne $2, $0, .l6
	nop

	lw $4, 8($4)
	addiu $3, $4, -1
	sltu $3, 0xFF
	bnel $3, $0, .continue
	daddiu $sp, -0x10

	j $31
	nop

.ret2:
	j $31
	move $2, $0

.continue:
	sd $28, 0($sp)
	lui $28, %hi(%neg(%gp_rel(__option_is_short)))
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(__option_is_short)))

	ld $25, %call16(isprint)($28)
	sd $31, 8($sp)

	jalr $25
	nop

	ld $31, 8($sp)
	ld $28, 0($sp)
	sltu $2, $0, $2
	j $31
	daddiu $sp, 0x10





__option_is_end:
	lw $2, 8($4)
	bne $2, $0, .ret2
	nop

	ld $3, 0($4)
	beql $3, $0, .continue
	ld $3, 32($4)

.return:
	j $31
	nop

.ret2:
	j $31
	move $2, $0

.continue:
	bne $3, $0, .return
	nop

	lw $2, 40($4)
	j $31
	sltu $2, 1
