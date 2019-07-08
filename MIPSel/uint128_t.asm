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

	bne $3, $0, .do0
	move $16, $4

	lw $3, 12($6)
	lw $2, 8($6)
	bne $3, $0, .do0
	sltu $3, $2, 0x80

	beq $3, $0, .do0
	li $3, 0x40

	beq $2, $3, .doLwSw
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
	beq $3, $0, .doShifts4
	nor $6, $0, $2

	lw $3, 4($5)
	move $4, $0
	srl $3, $2

.sw0s:
	sw $0, 0($16)
	sw $0, 4($16)
	sw $0, 8($16)
	sw $0, 12($16)

.return:
	lw $31, 28($sp)
	move $2, $16
	lw $16, 24($sp)
	j $31
	addiu $sp, 0x20

.do0:
	lui $5, %hi(uint128_0)
	addiu $5, %lo(uint128_0)
	jal uint128_t_constructor
	move $4, $16

.return2:
	lw $31, 28($sp)
	move $2, $16
	lw $16, 24($sp)
	j $31
	addiu $sp, 0x20

.doAnd:
	andi $9, $2, 0x20
	lw $8, 0($5)
	lw $6, 4($5)
	beq $9, $0, .doShifts
	nop

	lw $4, 12($5)
	move $5, $0
	srl $4, $2

.do40:
	li $3, 0x40
	subu $3, $2
	andi $7, $3, 0x20
	beq $7, $0, .doShifts3
	nor $7, $0, $3

	sll $7, $8, $3
	move $3, $0

.doAdds:
	addu $3, $4, $3
	sltu $4, $3, $4
	addu $5, $7

	beq $9, $0, .doShifts2
	addu $4, $5

	srl $2, $7, $2
	sw $2, 0($16)
	sw $0, 4($16)
	sw $3, 8($16)
	b .return
	sw $4, 12($16)

.doLwSw:
	sw $0, 0($4)
	sw $0, 4($4)

	lw $2, 0($5)
	lw $3, 4($5)
	sw $2, 8($4)
	b .return2
	sw $3, 12($4)

.doCnst:
	jal uint128_t_constructor
	nop

	b .return2
	nop

.doShifts:
	lw $5, 12($5)
	lw $4, 8($7)
	sll $3, $5, 1
	nor $7, $0, $2
	sll $3, $7
	srl $4, $2
	or $4, $3, $4
	b .do40
	srl $5, $2

.doShifts2:
	nor $7, $0, $2
	sll $5, $6, 1
	srl $8, $2
	sll $5, $7
	or $8, $5
	srl $2, $6, $2

	sw $8, 0($16)
	sw $2, 4($16)
	sw $3, 8($16)
	b .return
	sw $4, 12($16)

.doShifts3:
	srl $10, $8, 1
	srl $10, $7
	sll $7, $6, $3
	or $7, $10, $7
	b .doAdds
	sll $3, $8, $3

.doShifts4:
	lw $4, 4($5)
	lw $3, 0($5)
	sll $5, $4, 1
	sll $5, $6
	srl $3, $2
	or $3, $5, $3
	b .sw0s
	srl $4, $2





uint128_t_operator_shiftRight_equal:
	addiu $sp, -0x30
	sw $16, 40($sp)
	move $16, $4
	move $6, $5

	addiu $4, $sp, 24
	sw $31, 44($sp)
	jal uint128_t_operator_shiftRight
	move $5, $16

	addiu $5, $sp, 24
	jal uint128_t_operator_equal_const_uint128_t_double_ref
	move $4, $16

	lw $31, 44($sp)
	move $2, $16
	lw $16, 40($sp)
	j $31
	addiu $sp, 0x30





uint128_t_operator_exclamation_mark:
	addiu $sp, -0x20
	sw $31, 28($sp)

	jal uint128_t_operator_cast_bool
	nop

	lw $31, 28($sp)
	xori $2, 1
	andi $2, 0xFF
	j $31
	addiu $sp, 0x20





uint128_t_operator_and_and:
	addiu $sp, -0x20
	sw $16, 24($sp)
	sw $31, 28($sp)

	jal uint128_t_operator_cast_bool
	move $16, $5

	bne $2, $0, .continue
	move $4, $16

	lw $31, 28($sp)
	lw $16, 24($sp)
	j $31
	addiu $sp, 0x20

.continue:
	lw $31, 28($sp)
	lw $16, 24($sp)
	j uint128_t_operator_cast_bool
	addiu $sp, 0x20





uint128_t_operator_or_or:
	addiu $sp, -0x20
	sw $16, 24($sp)
	sw $31, 28($sp)

	jal uint128_t_operator_cast_bool
	move $16, $5

	beq $2, $0, .continue
	move $4, $16

	lw $31, 28($sp)
	lw $16, 24($sp)
	j $31
	addiu $sp, 0x20

.continue:
	lw $31, 28($sp)
	lw $16, 24($sp)
	j uint128_t_operator_cast_bool
	addiu $sp, 0x20





uint128_t_operator_equal_equal:
	lw $3, 0($4)
	lw $2, 0($5)
	nop

	beq $3, $2, .continue
	nop

.ret0:
	j $31
	move $2, $0

.continue:
	lw $3, 4($4)
	lw $2, 4($5)
	nop

	bne $3, $2, .ret0
	nop

	lw $3, 8($4)
	lw $6, 8($5)
	lw $4, 12($4)
	lw $2, 12($5)

	xor $3, $6
	xor $2, $4, $2
	or $2, $3, $2
	j $31
	sltu $2, 1





uint128_t_operator_not_equal:
	addiu $sp, -0x20
	sw $31, 28($sp)

	jal uint128_t_operator_equal_equal
	nop

	lw $31, 28($sp)
	xori $2, 1
	andi $2, 0xFF
	j $31
	addiu $sp, 0x20





uint128_t_operator_above:
	lw $8, 0($4)
	lw $9, 0($5)
	lw $7, 4($4)
	lw $6, 4($5)
	beq $8, $9, .continue
	sltu $3, $6, $7

.checkEq2:
	beq $3, $0, .checkEq
	li $2, 1

.return:
	j $31
	andi $2, 0xFF

.checkEq:
	beq $7, $6, .finish
	nop

.ret0:
	move $2, $0
	j $31
	nop

.finish:
	sltu $8, $9, $8
	bne $8, $0, .return
	nop

	b .return
	move $2, $0

.continue:
	bne $7, $6, .checkEq2
	nop

	lw $6, 12($4)
	lw $3, 12($5)
	nop

	sltu $7, $3, $6
	bne $7, $0, .return
	li $2, 1

	bne $6, $3, .ret0
	nop

	lw $3, 8($4)
	lw $4, 8($5)
	nop

	sltu $3, $4, $3
	bne $3, $0, .return
	nop

	b .return
	move $2, $0





uint128_t_operator_below:
	addiu $sp, -40
	sw $17, 32($sp)
	sw $16, 28($sp)
	sw $31, 36($sp)
	move $16, $4

	jal uint128_t_operator_equal_equal
	move $17, $5

	beq $2, $0, .continue
	move $2, $0

	lw $31, 36($sp)
	lw $17, 32($sp)
	lw $16, 28($sp)
	j $31
	addiu $sp, 40

.continue:
	move $5, $17
	jal uint128_t_operator_above
	move $4, $16

	lw $31, 36($sp)
	xori $2, 1
	lw $17, 32($sp)
	lw $16, 28($sp)
	andi $2, 0xFF
	j $31
	addiu $sp, 40





uint128_t_operator_above_equal:
	addiu $sp, -0x20
	sw $31, 28($sp)

	jal uint128_t_operator_below
	nop

	lw $31, 28($sp)
	xori $2, 1
	andi $2, 0xFF
	j $31
	addiu $sp, 0x20





uint128_t_operator_below_equal:
	addiu $sp, -0x20
	sw $31, 28($sp)

	jal uint128_t_operator_above
	nop

	lw $31, 28($sp)
	xori $2, 1
	andi $2, 0xFF
	j $31
	addiu $sp, 0x20





uint128_t_operator_plus:
	lw $12, 8($5)
	lw $8, 8($6)
	lw $11, 12($5)
	lw $10, 12($6)
	lw $9, 0($5)
	lw $3, 0($6)

	addu $8, $12, $8
	lw $2, 4($5)
	sltu $7, $8, $12
	lw $5, 4($6)

	addu $10, $11, $10
	addu $6, $7, $10
	addu $3, $9, $3
	addu $5, $2, $5

	sltu $9, $3, $9
	sltu $7, $6, $11

	move $2, $4
	addu $5, $9, $5

	bne $7, $0, .finish
	li $4, 1

	beq $11, $6, .continue
	nop

	move $4, $0

.finish:
	addu $4, $3, $4
	sltu $3, $4, $3
	addu $3, $5

	sw $4, 0($2)
	sw $3, 4($2)
	sw $8, 8($2)
	j $31
	sw $6, 12($2)

.continue:
	sltu $12, $8, $12
	bne $12, $0, .finish
	nop

	b .finish
	move $4, $0





uint128_t_operator_plus_equal:
	addiu $sp, -0x30
	sw $16, 40($sp)
	move $16, $4
	move $6, $5

	addiu $4, $sp, 24
	sw $31, 44($sp)
	jal uint128_t_operator_plus
	move $5, $16

	addiu $5, $sp, 24
	jal uint128_t_operator_equal_const_uint128_t_double_ref
	move $4, $16

	lw $31, 44($sp)
	move $2, $16
	lw $16, 40($sp)
	j $31
	addiu $sp, 0x30





uint128_t_operator_minus:
	lw $2, 8($5)
	lw $10, 8($6)
	lw $12, 12($5)
	lw $8, 12($6)
	lw $7, 0($6)
	lw $11, 0($5)

	subu $10, $2, $10
	sltu $9, $2, $10

	lw $3, 4($6)
	lw $2, 4($5)

	subu $8, $12, $8
	subu $5, $11, $7
	subu $6, $8, $9
	subu $3, $2, $3

	sltu $11, $5
	sltu $7, $12, $6
	move $2, $4
	subu $3, $11
	bne $7, $0, .return
	li $4, 1

	beq $6, $12, .finish
	nop

	move $4, $0

.return:
	subu $4, $5, $4
	sltu $5, $4
	subu $3, $5

	sw $4, 0($2)
	sw $3, 4($2)
	sw $10, 8($2)
	j $31
	sw $6, 12($2)

.finish:
	bne $9, $0, .return
	nop

	b .return
	move $4, $0





uint128_t_operator_minus_equal:
	addiu $sp, -0x30
	sw $16, 40($sp)
	move $16, $4
	move $6, $5

	addiu $4, $sp, 24
	sw $31, 44($sp)
	jal uint128_t_operator_minus
	move $5, $16

	addiu $5, $sp, 24
	jal uint128_t_operator_equal_const_uint128_t_double_ref
	move $4, $16

	lw $31, 44($sp)
	move $2, $16
	lw $16, 40($sp)
	j $31
	addiu $sp, 0x30





uint128_t_operator_multiply:
	addiu $sp, -0x10
	lw $7, 8($5)
	sw $16, 0($sp)
	lw $16, 12($6)
	lw $11, 0($6)
	multu $7, $16

	lw $15, 8($6)
	lw $10, 12($5)
	sw $19, 12($sp)
	sw $18, 8($sp)
	lw $6, 4($6)
	lw $14, 0($5)
	lw $3, 4($5)
	sw $17, 4($sp)

	move $2, $4
	mflo $8
	mfhi $9
	nop
	nop

	multu $7, $11
	mflo $12
	addu $17, $9, $12
	sltu $12, $17, $12
	mfhi $13
	nop
	nop

	multu $7, $15
	mflo $24
	sw $24, 8($4)

	mfhi $25
	addu $5, $25, $8
	sltu $8, $5, $8

	multu $10, $15
	mflo $18

	addu $5, $25, $18
	sltu $9, $5, $18
	mfhi $19
	sw $5, 12($4)

	addu $8, $9, $8
	multu $10, $16
	lw $18, 8($sp)

	mflo $24
	addu $5, $17, $24
	addu $9, $5, $19
	mfhi $25
	lw $19, 12($sp)
	nop

	multu $6, $7
	sltu $7, $5, $17
	addu $7, $12
	sltu $5, $9, $5
	addu $24, $5, $7
	lw $17, 4($sp)

	mflo $6
	addu $7, $13, $6
	nop

	multu $10, $11
	mflo $10
	addu $6, $7, $10
	addu $6, $25

	multu $14, $15
	mflo $12

	addu $7, $9, $12
	addu $5, $8, $7
	mfhi $13

	sltu $7, $12
	sltu $8, $5, $8
	multu $14, $16
	addu $7, $24
	sw $5, 0($4)

	addu $7, $8, $7
	mflo $16

	addu $5, $6, $16
	addu $5, $13
	multu $3, $15
	lw $16, 0($sp)
	addiu $sp, 0x10

	mflo $8
	addu $3, $5, $8
	addu $3, $7, $3
	j $31
	sw $3, 4($4)





uint128_t_operator_multiply_equal:
	addiu $sp, -0x30
	sw $16, 40($sp)
	move $16, $4
	move $6, $5

	addiu $4, $sp, 24
	sw $31, 44($sp)
	jal uint128_t_operator_multiply
	move $5, $16

	addiu $5, $sp, 24
	jal uint128_t_operator_equal_const_uint128_t_double_ref
	move $4, $16

	lw $31, 44($sp)
	move $2, $16
	lw $16, 40($sp)
	j $31
	addiu $sp, 0x30





uint128_t_divmod:
	addiu $sp, -0x70
	sw $17, 92($sp)
	lui $17, %hi(uint128_1)
	sw $20, 104($sp)
	addiu $5, $17, %lo(uint128_1)

	move $20, $4
	move $4, $7

	sw $19, 100($sp)
	sw $18, 96($sp)
	sw $31, 108($sp)
	sw $16, 88($sp)
	move $18, $7

	jal uint128_t_operator_equal_equal
	move $19, $6

	bne $2, $0, .finish20
	move $5, $19

	move $5, $18
	jal uint128_t_operator_equal_equal
	move $4, $19

	bne $2, $0, .do1
	lui $16, %hi(uint128_0)

	addiu $5, $16, %lo(uint128_0)
	jal uint128_t_operator_equal_equal
	move $4, $19

	beq $2, $0, .checkBelow
	move $5, $18

	move $4, $20

.doConstructs:
	jal uint128_t_constructor
	addiu $5, $16, %lo(uint128_0)

	move $5, $19
	jal uint128_t_constructor
	addiu $4, $20, 16

	lw $31, 108($sp)
	move $2, $20
	lw $19, 100($sp)
	lw $20, 104($sp)
	lw $18, 96($sp)
	lw $17, 92($sp)
	lw $16, 88($sp)
	j $31
	addiu $sp, 0x70

.do1:
	move $4, $20
	addiu $5, $17, %lo(uint128_1)

.finish:
	jal uint128_t_constructor
	nop

	lui $5, %hi(uint128_0)
	addiu $4, $20, 16
	jal uint128_t_constructor
	addiu $5, %lo(uint128_0)

	lw $31, 108($sp)
	move $2, $20
	lw $19, 100($sp)
	lw $20, 104($sp)
	lw $18, 96($sp)
	lw $17, 92($sp)
	lw $16, 88($sp)
	j $31
	addiu $sp, 0x70

.finish20:
	b .finish
	move $4, $20

.checkBelow:
	jal uint128_t_operator_below
	move $4, $19

	bne $2, $0, .doConstructs
	move $4, $20

	addiu $5, $16, %lo(uint128_0)
	jal uint128_t_constructor
	addiu $4, $sp, 0x18

	addiu $5, $16, %lo(uint128_0)
	jal uint128_t_constructor
	addiu $4, $sp, 0x28

	jal uint128_t_bits
	move $4, $19

	move $16, $2
	beq $2, $0, .doAdd
	addiu $17, %lo(uint128_1)

.doMov:
	move $5, $17

.doShifts:
	jal uint128_t_operator_shiftLeft_equal
	addiu $4, $sp, 0x18

	move $5, $17
	addiu $4, $sp, 0x28
	jal uint128_t_operator_shiftLeft_equal
	addiu $16, -1

	move $5, $19
	addiu $4, $sp, 0x48
	addiu $6, $sp, 0x38
	sw $16, 64($sp)
	sw $0, 56($sp)
	sw $0, 60($sp)

	jal uint128_t_operator_shiftRight
	sw $0, 68($sp)

	lw $2, 80($sp)
	andi $2, 1
	sw $2, 64($sp)
	addiu $4, $sp, 0x38
	sw $0, 56($sp)
	sw $0, 60($sp)

	jal uint128_t_operator_cast_bool
	sw $0, 68($sp)

	bne $2, $0, .doPP
	andi $16, 0xFF

	move $5, $18

.doAboveEq:
	jal uint128_t_operator_above_equal
	addiu $4, $sp, 0x28

	bne $2, $0, .doMinEq
	addiu $4, $sp, 0x28

	bne $16, $0, .doShifts
	move $5, $17

.doAdd:
	addiu $5, $sp, 0x18

.doMoves:
	jal uint128_t_constructor_uint128_t_double_ref
	move $4, $20

	addiu $5, $sp, 0x28
	jal uint128_t_constructor_uint128_t_double_ref
	addiu $4, $20, 0x10

	lw $31, 108($sp)
	move $2, $20
	lw $19, 100($sp)
	lw $20, 104($sp)
	lw $18, 96($sp)
	lw $17, 92($sp)
	lw $16, 88($sp)
	j $31
	addiu $sp, 0x70

.doMinEq:
	jal uint128_t_operator_minus_equal
	move $5, $18

	jal uint128_t_operator_plus_plus
	addiu $4, $sp, 0x18

	bne $16, $0, .doMov
	addiu $5, $sp, 0x18

	b .doMoves
	nop

.doPP:
	jal uint128_t_operator_plus_plus
	addiu $4, $sp, 0x28

	b .doAboveEq
	move $5, $18





uint128_t_operator_divide:
	addiu $sp, -0x40
	move $7, $6
	move $6, $5

	sw $16, 56($sp)
	move $16, $4
	sw $31, 60($sp)

	jal uint128_t_divmod
	addiu $4, $sp, 0x18

	addiu $5, $sp, 0x18
	jal uint128_t_constructor_uint128_t_double_ref
	move $4, $16

	lw $31, 60($sp)
	move $2, $16
	lw $16, 56($sp)
	j $31
	addiu $sp, 0x40





uint128_t_operator_divide_equal:
	addiu $sp, -0x30
	sw $16, 40($sp)
	move $16, $4
	move $6, $5

	addiu $4, $sp, 24
	sw $31, 44($sp)
	jal uint128_t_operator_divide
	move $5, $16

	addiu $5, $sp, 24
	jal uint128_t_operator_equal_const_uint128_t_double_ref
	move $4, $16

	lw $31, 44($sp)
	move $2, $16
	lw $16, 40($sp)
	j $31
	addiu $sp, 0x30





uint128_t_operator_modulo:
	addiu $sp, -0x40
	move $7, $6
	move $6, $5

	sw $16, 56($sp)
	move $16, $4
	sw $31, 60($sp)

	jal uint128_t_divmod
	addiu $4, $sp, 0x18

	addiu $5, $sp, 0x28
	jal uint128_t_constructor_uint128_t_double_ref
	move $4, $16

	lw $31, 60($sp)
	move $2, $16
	lw $16, 56($sp)
	j $31
	addiu $sp, 0x40





uint128_t_operator_modulo_equal:
	addiu $sp, -0x30
	sw $16, 40($sp)
	move $16, $4
	move $6, $5

	addiu $4, $sp, 24
	sw $31, 44($sp)
	jal uint128_t_operator_modulo
	move $5, $16

	addiu $5, $sp, 24
	jal uint128_t_operator_equal_const_uint128_t_double_ref
	move $4, $16

	lw $31, 44($sp)
	move $2, $16
	lw $16, 40($sp)
	j $31
	addiu $sp, 0x30





uint128_t_operator_plus_plus:
	lui $5, %hi(uint128_1)
	j uint128_t_operator_plus_equal
	addiu $5, %lo(uint128_1)





uint128_t_operator_plus_plus_int:
	addiu $sp, -0x28
	sw $17, 32($sp)
	move $17, $5
	sw $31, 36($sp)
	sw $16, 28($sp)

	jal uint128_t_constructor
	move $16, $4

	jal uint128_t_operator_plus_plus
	move $4, $17

	lw $31, 36($sp)
	move $2, $16
	lw $17, 32($sp)
	lw $16, 28($sp)
	j $31
	addiu $sp, 0x28





uint128_t_operator_minus_minus:
	lui $5, %hi(uint128_1)
	j uint128_t_operator_minus_equal
	addiu $5, %lo(uint128_1)





uint128_t_operator_minus_minus_int:
	addiu $sp, -0x28
	sw $17, 32($sp)
	move $17, $5
	sw $31, 36($sp)
	sw $16, 28($sp)

	jal uint128_t_constructor
	move $16, $4

	jal uint128_t_operator_minus_minus
	move $4, $17

	lw $31, 36($sp)
	move $2, $16
	lw $17, 32($sp)
	lw $16, 28($sp)
	j $31
	addiu $sp, 0x28





uint128_t_operator_single_plus:
	addiu $sp, -0x20
	sw $31, 28($sp)
	sw $16, 24($sp)

	jal uint128_t_constructor
	move $16, $4

	lw $31, 28($sp)
	move $2, $16
	lw $16, 24($sp)
	j $31
	addiu $sp, 0x20





uint128_t_operator_single_minus:
	addiu $sp, -0x30
	sw $16, 40($sp)
	move $16, $4
	sw $31, 44($sp)

	jal uint128_t_operator_not
	addiu $4, $sp, 0x18

	lui $6, %hi(uint128_1)
	addiu $5, $sp, 0x18
	move $4, $16
	jal uint128_t_operator_plus
	addiu $6, %lo(uint128_1)

	lw $31, 44($sp)
	move $2, $16
	lw $16, 40($sp)
	j $31
	addiu $sp, 0x30





uint128_t_upper:
	j $31
	move $2, $4





uint128_t_lower:
	j $31
	addiu $2, $4, 8





uint128_t_bits:
	lw $2, 0($4)
	lw $5, 4($4)
	addiu $sp, -0x20
	or $3, $2, $5

	bne $3, $0, .continue
	sw $31, 28($sp)

	lw $2, 8($4)
	lw $5, 12($4)
	nop

	or $3, $2, $5
	beq $3, $0, .ret0
	nop

	jal __clzdi2
	move $4, $2

	lw $31, 28($sp)
	li $3, 0x40
	subu $2, $3, $2
	andi $2, 0xFF
	j $31
	addiu $sp, 0x20

.ret0:
	lw $31, 28($sp)
	move $2, $0
	j $31
	addiu $sp, 0x20

.continue:
	jal __clzdi2
	move $4, $2

	lw $31, 28($sp)
	li $3, -0x80
	subu $2, $3, $2
	andi $2, 0xFF
	j $31
	addiu $sp, 0x20
