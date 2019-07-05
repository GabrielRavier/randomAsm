	.bss

uint128_0:
	.zero 16

	.data

uint128_1:
	.quad 0, 1

	.text

uint128_t_constructor_default:
	sw $0, 0($4)
	sw $0, 4($4)
	sw $0, 8($4)
	j $31
	sw $0, 12($4)





uint128_t_constructor:
uint128_t_operator_equal:
	lw $6, 0($5)
	lw $7, 4($5)
	lw $2, 8($5)
	lw $3, 12($5)

	sw $6, 0($4)
	sw $7, 4($4)
	sw $2, 8($4)
	j $31
	sw $3, 12($4)





uint128_t_constructor_uint128_t_double_ref:
	lw $2, 0($5)
	lw $3, 4($5)

	sw $2, 0($4)
	sw $3, 4($4)

	lw $2, 8($5)
	lw $3, 12($5)
	sw $2, 8($4)

	beq $5, $4, .return
	sw $3, 12($4)

	move $2, $0
	move $3, $0
	sw $2, 0($5)
	sw $3, 4($5)
	sw $2, 8($5)
	sw $3, 12($5)

.return:
	j $31
	nop





uint128_t_operator_equal_const_uint128_t_double_ref:
	beq $4, $5, .return
	move $2, $4

	lw $6, 0($5)
	lw $7, 4($5)

	sw $6, 0($4)
	sw $7, 4($4)

	lw $6, 8($5)
	lw $7, 12($5)

	sw $6, 8($4)
	sw $7, 12($4)

	sw $0, 0($5)
	sw $0, 4($5)
	sw $0, 8($5)
	sw $0, 12($5)

.return:
	j $31
	nop





uint128_t_operator_cast_bool:
	lw $3, 0($4)
	lw $5, 4($4)
	lw $6, 8($4)
	lw $2, 12($4)

	or $3, $6
	or $2, $5, $2
	or $2, $3, $2

	j $31
	sltu $2, $0, $2





uint128_t_operator_cast_uint8_t:
	lbu $2, 8($4)
	j $31
	nop





uint128_t_operator_cast_uint16_t:
	lhu $2, 8($4)
	j $31
	nop





uint128_t_operator_cast_uint32_t:
	lw $2, 8($4)
	j $31
	nop





uint128_t_operator_cast_uint64_t:
	lw $2, 8($4)
	lw $3, 12($4)
	j $31
	nop





uint128_t_operator_and:
	lw $3, 0($5)
	lw $8, 0($6)
	move $2, $4
	and $7, $3, $7

	lw $4, 8($5)
	lw $9, 8($6)
	lw $3, 12($5)
	lw $8, 12($6)

	sw $7, 0($2)
	lw $5, 4($5)
	lw $6, 4($6)

	and $4, $9
	and $3, $8
	and $5, $6

	sw $5, 4($2)
	sw $4, 8($2)
	j $31
	sw $3, 12($2)





uint128_t_operator_and_equal:
	addiu $sp, -0x30
	sw $16, 40($sp)
	move $16, $4
	move $6, $5

	addiu $4, $sp, 24
	sw $31, 44($sp)
	jal uint128_t_operator_and
	move $5, $16

	addiu $5, $sp, 24
	jal uint128_t_operator_equal_const_uint128_t_double_ref
	move $4, $16

	lw $31, 44($sp)
	move $2, $16
	lw $16, 40($sp)
	j $31
	addiu $sp, 0x30





uint128_t_operator_or:
	lw $3, 0($5)
	lw $8, 0($6)
	move $2, $4
	or $7, $3, $7

	lw $4, 8($5)
	lw $9, 8($6)
	lw $3, 12($5)
	lw $8, 12($6)

	sw $7, 0($2)
	lw $5, 4($5)
	lw $6, 4($6)

	or $4, $9
	or $3, $8
	or $5, $6

	sw $5, 4($2)
	sw $4, 8($2)
	j $31
	sw $3, 12($2)





uint128_t_operator_or_equal:
	addiu $sp, -0x30
	sw $16, 40($sp)
	move $16, $4
	move $6, $5

	addiu $4, $sp, 24
	sw $31, 44($sp)
	jal uint128_t_operator_or
	move $5, $16

	addiu $5, $sp, 24
	jal uint128_t_operator_equal_const_uint128_t_double_ref
	move $4, $16

	lw $31, 44($sp)
	move $2, $16
	lw $16, 40($sp)
	j $31
	addiu $sp, 0x30





uint128_t_operator_xor:
	lw $3, 0($5)
	lw $8, 0($6)
	move $2, $4
	xor $7, $3, $7

	lw $4, 8($5)
	lw $9, 8($6)
	lw $3, 12($5)
	lw $8, 12($6)

	sw $7, 0($2)
	lw $5, 4($5)
	lw $6, 4($6)

	xor $4, $9
	xor $3, $8
	xor $5, $6

	sw $5, 4($2)
	sw $4, 8($2)
	j $31
	sw $3, 12($2)





uint128_t_operator_xor_equal:
	addiu $sp, -0x30
	sw $16, 40($sp)
	move $16, $4
	move $6, $5

	addiu $4, $sp, 24
	sw $31, 44($sp)
	jal uint128_t_operator_xor
	move $5, $16

	addiu $5, $sp, 24
	jal uint128_t_operator_equal_const_uint128_t_double_ref
	move $4, $16

	lw $31, 44($sp)
	move $2, $16
	lw $16, 40($sp)
	j $31
	addiu $sp, 0x30





uint128_t_operator_not:
	lw $3, 0($5)
	move $2, $4
	nor $6, $0, $3

	lw $4, 8($5)
	lw $3, 12($5)
	sw $6, 0($2)
	lw $5, 4($5)

	nor $4, $0, $4
	nor $3, $0, $3
	nor $5, $0, $5

	sw $5, 4($2)
	sw $4, 8($2)
	j $31
	sw $2, 12($2)





uint128_t_operator_shiftLeft:
	lw $3, 0($6)
	lw $2, 4($6)
	addiu $sp, -0x20
	or $3, $2

	sw $16, 24($sp)
	sw $31, 28($sp)

	bne $3, $0, .do0
	move $16, $4

	lw $3, 12($6)
	lw $2, 8($6)

	bne $3, $0, .do0
	sltu $3, $2, 0x80

	beq $3, $0, .do0
	li $3, 0x40

	beq $2, $3, .doLoadsStores
	move $7, $5

	beq $2, $0, .doCnst
	sltu $3, $2, 0x40

	bne $3, $0, .doAnd
	addiu $3, $2, -0x41

	sltu $4, $3, $2
	beq $4, $0, .do0
	sltu $3, 0x3F

	beq $3, $0, .do0
	addiu $2, -0x40

	andi $3, $2, 0x20
	beq $3, $0, .doShifts3
	nop

	lw $3, 8($5)
	sw $0, 0($16)
	sll $2, $3, $2
	sw $2, 4($16)

.finish:
	lw $31, 28($sp)
	sw $0, 8($16)
	sw $0, 12($16)

	move $2, $16
	lw $16, 24($sp)

	j $31
	addiu $sp, 0x20

.do0:
	lui $5, %hi(uint128_0)
	addiu $5, %lo(uint128_0)
	jal uint128_t_constructor
	move $4, $16

.return:
	lw $31, 28($sp)
	move $2, $16
	lw $16, 24($sp)

	j $31
	addiu $sp, 0x20

.doAnd:
	andi $10, $2, 0x20
	lw $8, 8($5)
	lw $9, 12($5)

	beq $10, $0, .doShifts2
	nor $6, $0, $2

	lw $5, 0($5)
	move $3, $0
	sll $5, $2

.do40:
	li $4, 0x40
	subu $4, $2
	andi $6, $4, 0x20

	beq $6, $0, .doShifts
	nor $6, $0, $4

	srl $6, $9, $4
	move $4, $0

.doAdds:
	addu $6, $3, $6
	sltu $3, $6, $3
	addu $4, $5, $4
	addu $3, $4

	sw $6, 0($16)
	beq $10, $0, .doNor
	sw $3, 4($16)

	sll $2, $8, $2
	sw $2, 12($16)
	b .return
	sw $0, 8($16)

.doLoadsStores:
	lw $2, 8($5)
	lw $3, 12($5)

	sw $0, 8($16)
	sw $0, 12($16)

	sw $2, 0($16)
	b .return
	sw $3, 4($16)

.doCnst:
	jal uint128_t_constructor
	nop

	j .return
	nop

.doShifts:
	sll $7, $9, 1
	sll $7, $6
	srl $6, $8, $4
	or $6, $7, $6
	b .doAdds
	srl $4, $9, $4

.doShifts2:
	lw $3, 0($5)
	lw $5, 4($5)

	srl $4, $3, 1
	srl $4, $6
	sll $5, $2
	or $5, $4, $5
	b .do40
	sll $3, $2

.doNor:
	nor $4, $0, $2
	srl $3, $8, 1
	sll $9, $2
	srl $3, $4
	or $9, $3
	sll $2, $8, $2

	sw $9, 12($16)
	b .return
	sw $2, 8($16)

.doShifts3:
	lw $4, 8($5)
	lw $3, 12($5)
	srl $4, 1
	nor $5, $0, $2
	sll $3, $2
	srl $4, $5
	or $3, $4

	sw $3, 4($16)
	lw $3, 8($7)
	nop

	sll $2, $3, $2
	b .finish
	sw $2, 0($16)





uint128_t_operator_shiftLeft_equal:
	addiu $sp, -0x30
	sw $16, 40($sp)
	move $16, $4
	move $6, $5

	addiu $4, $sp, 24
	sw $31, 44($sp)
	jal uint128_t_operator_shiftLeft
	move $5, $16

	addiu $5, $sp, 24
	jal uint128_t_operator_equal_const_uint128_t_double_ref
	move $4, $16

	lw $31, 44($sp)
	move $2, $16
	lw $16, 40($sp)
	j $31
	addiu $sp, 0x30





uint128_t_operator_shiftRight:
	lw $3, 0($6)
	lw $2, 4($6)
	addiu $sp, -0x20
	or $3, $2

	sw $16, 24($sp)
	sw $31, 28($sp)

	bne $3, $0, .l2
	move $16, $4

	lw $3, 12($6)
	lw $2, 8($6)
	bne $3, $0, .l2
	sltu $3, $2, 0x80

	beq $3, $0, .l2
	li $3, 0x40

	beq $2, $3, .l26
	move $7, $5

	beq $2, $0, .l27
	sltu $3, $2, 0x40

	bne $3, $0, .l28
	addiu $3, $2, -0x41

	sltu $4, $3, $2
	beq $4, $0, .l2
	sltu $3, 0x3F

	beq $3, $0, .l2
	addiu $2, -0x40

	andi $3, $2, 0x20
	beq $3, $0, .l17
	nor $6, $0, $2

	lw $3, 4($5)
	move $4, $0
	srl $3, $2

.l18:
	sw $0, 0($16)
	sw $0, 4($16)
	sw $0, 8($16)
	sw $0, 12($16)

.l29:
	lw $31, 28($sp)
	move $2, $16
	lw $16, 24($sp)
	j $31
	addiu $sp, 0x20

.l2:
	lui $5, %hi(uint128_0)
	addiu $5, %lo(uint128_0)
	jal uint128_t_constructor
	move $4, $16

.l1:
	lw $31, 28($sp)
	move $2, $16
	lw $16, 24($sp)
	j $31
	addiu $sp, 0x20

.l28:
	andi $9, $2, 0x20
	lw $8, 0($5)
	lw $6, 4($5)
	beq $9, $0, .l10
	nop

	lw $4, 12($5)
	move $5, $0
	srl $4, $2

.l11:
	li $3, 0x40
	subu $3, $2
	andi $7, $3, 0x20
	beq $7, $0, .l12
	nor $7, $0, $3

	sll $7, $8, $3
	move $3, $0

.l13:
	addu $3, $4, $3
	sltu $4, $3, $4
	addu $5, $7

	beq $9, $0, .l14
	addu $4, $5

	srl $2, $7, $2
	sw $2, 0($16)
	sw $0, 4($16)
	sw $3, 8($16)
	b .l29
	sw $4, 12($16)

.l26:
	sw $0, 0($4)
	sw $0, 4($4)

	lw $2, 0($5)
	lw $3, 4($5)
	sw $2, 8($4)
	b .l1
	sw $3, 12($4)

.l27:
	jal uint128_t_constructor
	nop

	b .l1
	nop

.l10:
	lw $5, 12($5)
	lw $4, 8($7)
	sll $3, $5, 1
	nor $7, $0, $2
	sll $3, $7
	srl $4, $2
	or $4, $3, $4
	b .l11
	srl $5, $2

.l14:
	nor $7, $0, $2
	sll $5, $6, 1
	srl $8, $2
	sll $5, $7
	or $8, $5
	srl $2, $6, $2

	sw $8, 0($16)
	sw $2, 4($16)
	sw $3, 8($16)
	b .l29
	sw $4, 12($16)

.l12:
	srl $10, $8, 1
	srl $10, $7
	sll $7, $6, $3
	or $7, $10, $7
	b .l13
	sll $3, $8, $3

.l17:
	lw $4, 4($5)
	lw $3, 0($5)
	sll $5, $4, 1
	sll $5, $6
	srl $3, $2
	or $3, $5, $3
	b .l18
	srl $4, $2





uint128_t_operator_shiftRight_equal:





uint128_t_operator_exclamation_mark:





uint128_t_operator_and_and:





uint128_t_operator_or_or:





uint128_t_operator_equal_equal:





uint128_t_operator_not_equal:





uint128_t_operator_above:





uint128_t_operator_below:





uint128_t_operator_above_equal:





uint128_t_operator_below_equal:





uint128_t_operator_plus:





uint128_t_operator_plus_equal:





uint128_t_operator_minus:





uint128_t_operator_minus_equal:





uint128_t_operator_multiply:





uint128_t_operator_multiply_equal:





uint128_t_divmod:





uint128_t_operator_divide:





uint128_t_operator_divide_equal:





uint128_t_operator_modulo:





uint128_t_operator_modulo_equal:





uint128_t_operator_plus_plus:





uint128_t_operator_plus_plus_int:





uint128_t_operator_minus_minus:





uint128_t_operator_minus_minus_int:





uint128_t_operator_single_plus:





uint128_t_operator_single_minus:





uint128_t_upper:





uint128_t_lower:





uint128_t_bits:
