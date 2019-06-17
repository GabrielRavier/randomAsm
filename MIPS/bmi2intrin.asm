_mulx_u64:
	addiu $sp, -80
	move $2, $0
	move $3, $0

	sw $6, 32($sp)
	sw $4, 48($sp)
	sw $5, 52($sp)

	addiu $6, $sp, 24
	addiu $5, $sp, 40
	addiu $4, $sp, 56

	sw $31, 76($sp)
	sw $7, 36($sp)
	sw $2, 40($sp)
	sw $3, 44($sp)
	sw $2, 24($sp)

	jal uint128_t_operator_multiply
	sw $3, 28($sp)

	li $2, 0x40
	move $3, $0

	addiu $6, $sp, 24
	addiu $5, $sp, 56
	addiu $4, $sp, 40

	sw $2, 32($sp)
	sw $3, 36($sp)
	move $2, $0
	move $3, $0
	sw $2, 24($sp)

	jal uint128_t_operator_shiftRight
	sw $3, 28($sp)

	jal uint128_t_operator_cast_uint64_t
	addiu $4, $sp, 40

	lw $4, 96($sp)
	nop

	sw $2, 0($4)
	sw $3, 4($4)

	jal uint128_t_operator_cast_uint64_t
	addiu $4, $sp, 56

	lw $31, 76($sp)
	nop

	j $31
	addiu $sp, 80





_mulx_u32:
	multu $4, $5
	mfhi $3
	mflo $2

	j $31
	sw $3, 0($6)
