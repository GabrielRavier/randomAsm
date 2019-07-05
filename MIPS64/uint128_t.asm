uint128_0:
	.zero 16

uint128_1:
	.quad 0, 1

uint128_t_constructor_default:
	sd $0, 0($4)
	j $31
	sd $0, 8($4)





uint128_t_constructor:
uint128_t_operator_equal:
	ld $3, 0($5)
	ld $2, 8($5)
	sd $3, 0($4)
	j $31
	sd $2, 8($4)





uint128_t_constructor_uint128_t_double_ref:
	ld $2, 0($5)
	sd $2, 0($4)
	ld $2, 8($5)
	beq $5, $4, .return
	sd $2, 8($4)

	sd $0, 0($5)
	sd $0, 8($5)

.return:
	j $31
	nop





uint128_t_operator_equal_const_uint128_t_double_ref:
	beq $4, $5, .return
	move $2, $4

	ld $3, 0($5)
	sd $3, 0($4)
	ld $3, 8($5)
	sd $3, 8($4)
	sd $0, 0($5)
	sd $0, 8($5)

.return:
	j $31
	nop





uint128_t_operator_cast_bool:
	ld $2, 0($4)
	ld $3, 8($4)
	or $2, $3

	j $31
	sltu $2, $0, $2





uint128_t_operator_cast_uint8_t:
	j $31
	lbu $2, 8($4)





uint128_t_operator_cast_uint16_t:
	j $31
	jhu $2, 8($4)





uint128_t_operator_cast_uint32_t:
	j $31
	lw $2, 8($4)





uint128_t_operator_cast_uint64_t:
	j $31
	ld $2, 8($4)





uint128_t_operator_and:
	ld $3, 8($5)
	ld $7, 5($6)
	ld $5, 0($5)
	ld $6, 8($5)

	and $3, $7
	and $5, $6
	move $2, $4
	sd $5, 0($4)
	j $31
	sd $3, 8($4)





uint128_t_operator_and_equal:
	daddiu $sp, -0x30
	sd $28, 32($sp)
	lui $28, %hi(%neg(%gp_rel(uint128_t_operator_and_equal)))
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(uint128_t_operator_and_equal)))

	ld $25, %call16(uint128_t_operator_and)($28)
	sd $16, 24($sp)
	move $16, $4
	move $6, $5
	move $4, $sp
	sd $31, 40($sp)

	jalr $25
	move $5, $16

	ld $25, %call16(uint128_t_constructor)($28)
	move $5, $sp

	jalr $25
	move $4, $16

	ld $31, 40($sp)
	move $2, $16
	ld $28, 32($sp)
	ld $16, 24($sp)
	j $31
	daddiu $sp, 48





uint128_t_operator_or:
	ld $3, 8($5)
	ld $7, 5($6)
	ld $5, 0($5)
	ld $6, 8($5)

	or $3, $7
	or $5, $6
	move $2, $4
	sd $5, 0($4)
	j $31
	sd $3, 8($4)





uint128_t_operator_or_equal:
	daddiu $sp, -0x30
	sd $28, 32($sp)
	lui $28, %hi(%neg(%gp_rel(uint128_t_operator_or_equal)))
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(uint128_t_operator_or_equal)))

	ld $25, %call16(uint128_t_operator_or)($28)
	sd $16, 24($sp)
	move $16, $4
	move $6, $5
	move $4, $sp
	sd $31, 40($sp)

	jalr $25
	move $5, $16

	ld $25, %call16(uint128_t_constructor)($28)
	move $5, $sp

	jalr $25
	move $4, $16

	ld $31, 40($sp)
	move $2, $16
	ld $28, 32($sp)
	ld $16, 24($sp)
	j $31
	daddiu $sp, 48





uint128_t_operator_xor:
	ld $3, 8($5)
	ld $7, 5($6)
	ld $5, 0($5)
	ld $6, 8($5)

	xor $3, $7
	xor $5, $6
	move $2, $4
	sd $5, 0($4)
	j $31
	sd $3, 8($4)





uint128_t_operator_xor_equal:
	daddiu $sp, -0x30
	sd $28, 32($sp)
	lui $28, %hi(%neg(%gp_rel(uint128_t_operator_xor_equal)))
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(uint128_t_operator_xor_equal)))

	ld $25, %call16(uint128_t_operator_xor)($28)
	sd $16, 24($sp)
	move $16, $4
	move $6, $5
	move $4, $sp
	sd $31, 40($sp)

	jalr $25
	move $5, $16

	ld $25, %call16(uint128_t_constructor)($28)
	move $5, $sp

	jalr $25
	move $4, $16

	ld $31, 40($sp)
	move $2, $16
	ld $28, 32($sp)
	ld $16, 24($sp)
	j $31
	daddiu $sp, 48





uint128_t_operator_not:
	ld $3, 8($5)
	ld $5, 0($5)

	nor $3, $0, $3
	nor $5, $0, $5

	move $2, $4
	sd $5, 0($4)
	j $31
	sd $3, 8($4)





uint128_t_operator_shiftLeft:
	daddiu $sp, -0x20
	ld $2, 0($6)
	sd $28, 16($sp)
	lui $28, %hi(%neg(%gp_rel(uint128_t_operator_shiftLeft)))
	daddu $28, $25
	sd $16, 8($sp)
	sd $31, 24($sp)
	daddiu $28, %lo(%neg(%gp_rel(uint128_t_operator_shiftLeft)))

	bne $2, $0, .do0
	move $16, $4

	ld $3, 8($6)
	sltu $2, $3, 0x80
	beq $2, $0, .do0
	li $2, 0x40

	beq $3, $2, .doLds
	nop

	beq $3, $0, .doCnst
	sltu $2, $3, 0x40

	bne $2, 0, .doSll
	daddiu $2, $3, -0x41

	sltu $2, 0x3F
	beq $2, $0, .do0
	ld $31, 24($sp)

	ld $2, 8($5)
	sll $3, 0
	dsll $2, $3

	ld $28, 16($sp)
	move $2, $16
	sd $3, 0($4)
	ld $16, 8($sp)
	sd $0, 8($4)
	j $31
	daddiu $sp, 0x20

.do0:
	ld $25, %call16(uint128_t_constructor)($28)
	ld $5, %got_disp(uint128_0)($28)

	jalr $25
	move $4, $16

.doLd:
	ld $31, 24($sp)

.return:
	move $2, $16
	ld $28, 16($sp)
	ld $16, 8($sp)
	j $31
	daddiu $sp, 0x20

.doSll:
	ld $4, 8($5)
	ld $2, 0($5)
	sll $3, 0
	sll $5, $3, 0

	ld $31, 24($sp)
	subu $3, $0, $3
	dsll $2, $5
	dsrl $3, $4, $3
	daddu $3, $2, $3
	dsll $4, $5
	sd $3, 0($16)
	sd $4, 8($16)

	move $2, $16
	ld $28, 16($sp)
	ld $16, 8($sp)
	j $31
	daddiu $sp, 0x20

.doLds:
	ld $2, 8($5)
	sd $0, 8($4)
	b .doLd
	sd $2, 0($4)

.doCnst:
	ld $25, %call16(uint128_t_constructor)($28)
	jalr $25
	nop

	b .return
	ld $31, 24($sp)





uint128_t_operator_shiftLeft_equal:
	daddiu $sp, -0x30
	sd $28, 32($sp)
	lui $28, %hi(%neg(%gp_rel(uint128_t_operator_shiftLeft_equal)))
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(uint128_t_operator_shiftLeft_equal)))

	ld $25, %call16(uint128_t_operator_shiftLeft)($28)
	sd $16, 24($sp)
	move $16, $4
	move $6, $5
	move $4, $sp
	sd $31, 40($sp)

	jalr $25
	move $5, $16

	ld $25, %call16(uint128_t_constructor)($28)
	move $5, $sp

	jalr $25
	move $4, $16

	ld $31, 40($sp)
	move $2, $16
	ld $28, 32($sp)
	ld $16, 24($sp)
	j $31
	daddiu $sp, 48





uint128_t_operator_shiftRight:
	daddiu $sp, -0x20
	ld $2, 0($6)
	sd $28, 16($sp)
	lui $28, %hi(%neg(%gp_rel(uint128_t_operator_shiftLeft)))
	daddu $28, $25
	sd $16, 8($sp)
	sd $31, 24($sp)
	daddiu $28, %lo(%neg(%gp_rel(uint128_t_operator_shiftLeft)))

	bne $2, $0, .do0
	move $16, $4

	ld $3, 8($6)
	sltu $2, $3, 0x80
	beq $2, $0, .do0
	li $2, 0x40

	beq $3, $2, .doLds
	nop

	beq $3, $0, .doCnst
	sltu $2, $3, 0x40

	bne $2, 0, .doSll
	daddiu $2, $3, -0x41

	sltu $2, 0x3F
	beq $2, $0, .do0
	ld $31, 24($sp)

	ld $2, 8($5)
	sll $3, 0
	dsrl $3, $2, $3

	ld $28, 16($sp)
	move $2, $16
	sd $0, 0($4)
	ld $16, 8($sp)
	sd $8, 8($4)
	j $31
	daddiu $sp, 0x20

.do0:
	ld $25, %call16(uint128_t_constructor)($28)
	ld $5, %got_disp(uint128_0)($28)

	jalr $25
	move $4, $16

.doLd:
	ld $31, 24($sp)

.return:
	move $2, $16
	ld $28, 16($sp)
	ld $16, 8($sp)
	j $31
	daddiu $sp, 0x20

.doSll:
	ld $2, 0($5)
	ld $4, 8($5)
	sll $3, 0
	sll $5, $3, 0

	ld $31, 24($sp)
	subu $3, $0, $3
	dsll $3, $2, $3
	dsrl $4, $5
	dsll $2, $5
	daddu $3, $4
	sd $2, 0($16)
	sd $3, 8($16)

	move $2, $16
	ld $28, 16($sp)
	ld $16, 8($sp)
	j $31
	daddiu $sp, 0x20

.doLds:
	sd $0, 0($4)
	ld $2, 0($5)
	b .doLd
	sd $2, 8($4)

.doCnst:
	ld $25, %call16(uint128_t_constructor)($28)
	jalr $25
	nop

	b .return
	ld $31, 24($sp)





uint128_t_operator_shiftRight_equal:
	daddiu $sp, -0x30
	sd $28, 32($sp)
	lui $28, %hi(%neg(%gp_rel(uint128_t_operator_shiftRight_equal)))
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(uint128_t_operator_shiftRight_equal)))

	ld $25, %call16(uint128_t_operator_shiftRight)($28)
	sd $16, 24($sp)
	move $16, $4
	move $6, $5
	move $4, $sp
	sd $31, 40($sp)

	jalr $25
	move $5, $16

	ld $25, %call16(uint128_t_constructor)($28)
	move $5, $sp

	jalr $25
	move $4, $16

	ld $31, 40($sp)
	move $2, $16
	ld $28, 32($sp)
	ld $16, 24($sp)
	j $31
	daddiu $sp, 48





uint128_t_operator_exclamation_mark:
	ld $2, 0($4)
	ld $3, 8($4)
	or $2, $3

	j $31
	sltu $2, 1





uint128_t_operator_and_and:
	daddiu $sp, -0x20
	sd $28, 16($sp)
	lui $28, %hi(%neg(%gp_rel(uint128_t_operator_and_and)))
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(uint128_t_operator_and_and)))

	ld $25, %call16(uint128_t_operator_cast_bool)($28)
	sd $16, 8($sp)
	sd $31, 24($sp)

	jalr $25
	move $16, $5

	beq $2, $0, .return
	ld $31, 24($sp)

	ld $25, %call16(uint128_t_operator_cast_bool)($28)
	jalr $25
	move $4, $16

	ld $31, 24($sp)

.return:
	ld $28, 16($sp)
	ld $16, 8($sp)
	j $31
	daddiu $sp, 0x20





uint128_t_operator_or_or:
	daddiu $sp, -0x20
	sd $28, 16($sp)
	lui $28, %hi(%neg(%gp_rel(uint128_t_operator_and_and)))
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(uint128_t_operator_and_and)))

	ld $25, %call16(uint128_t_operator_cast_bool)($28)
	sd $16, 8($sp)
	sd $31, 24($sp)

	jalr $25
	move $16, $5

	bne $2, $0, .return
	ld $31, 24($sp)

	ld $25, %call16(uint128_t_operator_cast_bool)($28)
	jalr $25
	move $4, $16

	ld $31, 24($sp)

.return:
	ld $28, 16($sp)
	ld $16, 8($sp)
	j $31
	daddiu $sp, 0x20





uint128_t_operator_equal_equal:
	ld $3, 0($4)
	ld $2, 0($5)
	beq $3, $2, .continue
	nop

	j $31
	move $2, $0

.continue:
	ld $2, 8($4)
	ld $3, 8($5)
	xor $2, $3
	j $31
	sltu $2, 1





uint128_t_operator_not_equal:
	ld $3, 0($4)
	ld $2, 0($5)
	ld $4, 8($4)
	ld $5, 8($5)

	xor $2, $3, $2
	xor $4, $5

	sltu $3, $0, $2
	sltu $2, $0, $4
	or $2, $3, $2
	j $31
	andi $2, 1





uint128_t_operator_above:
	ld $2, 0($4)
	ld $3, 0($5)
	beq $2, $3, .continue
	nop

	j $31
	sltu $2, $3, $2

.continue:
	ld $2, 8($4)
	ld $3, 8($5)
	j $31
	sltu $2, $3, $2





uint128_t_operator_below:
	ld $2, 0($4)
	ld $3, 0($5)
	beq $2, $3, .continue
	nop

	j $31
	sltu $2, $3

.continue:
	ld $2, 8($4)
	ld $3, 8($5)
	j $31
	sltu $2, $3





uint128_t_operator_above_equal:
	daddiu $sp, -0x10
	sd $28, 0($sp)
	lui $28, %hi(%neg(%gp_rel(uint128_t_operator_above_equal)))
	daddu $28, $25
	daddiu $25, %lo(%neg(%gp_rel(uint128_t_operator_above_equal)))

	ld $25, %call16(uint128_t_operator_below)($28)
	sd $31, 8($sp)

	jalr $25
	nop

	ld $31, 8($sp)
	xori $2, 1
	ld $28, 0($sp)
	andi $2, 0xFF
	j $31
	daddiu $sp, 0x10





uint128_t_operator_below_equal:
	daddiu $sp, -0x10
	sd $28, 0($sp)
	lui $28, %hi(%neg(%gp_rel(uint128_t_operator_below_equal)))
	daddu $28, $25
	daddiu $25, %lo(%neg(%gp_rel(uint128_t_operator_below_equal)))

	ld $25, %call16(uint128_t_operator_above)($28)
	sd $31, 8($sp)

	jalr $25
	nop

	ld $31, 8($sp)
	xori $2, 1
	ld $28, 0($sp)
	andi $2, 0xFF
	j $31
	daddiu $sp, 0x10





uint128_t_operator_plus:
	ld $8, 8($5)
	ld $7, 8($6)
	ld $2, 0($5)
	ld $3, 0($6)

	daddu $5, $8, $7
	daddu $3, $2, $3
	sltu $8, $5, $8
	daddu $3, $8

	move $2, $4
	sd $3, 0($4)
	j $31
	sd $5, 8($4)





uint128_t_operator_plus_equal:
	daddiu $sp, -0x30
	sd $28, 32($sp)
	lui $28, %hi(%neg(%gp_rel(uint128_t_operator_plus_equal)))
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(uint128_t_operator_plus_equal)))

	ld $25, %call16(uint128_t_operator_plus)($28)
	sd $16, 24($sp)
	move $16, $4
	move $6, $5
	move $4, $sp
	sd $31, 40($sp)

	jalr $25
	move $5, $16

	ld $25, %call16(uint128_t_constructor)($28)
	move $5, $sp

	jalr $25
	move $4, $16

	ld $31, 40($sp)
	move $2, $16
	ld $28, 32($sp)
	ld $16, 24($sp)
	j $31
	daddiu $sp, 48





uint128_t_operator_minus:
	ld $8, 8($5)
	ld $7, 8($6)
	ld $2, 0($5)
	ld $3, 0($6)

	dsubu $5, $8, $7
	dsubu $3, $2, $3
	sltu $8, $5
	dsubu $3, $8

	sd $3, 0($4)
	j $31
	sd $5, 8($4)





uint128_t_operator_minus_equal:
	daddiu $sp, -0x30
	sd $28, 32($sp)
	lui $28, %hi(%neg(%gp_rel(uint128_t_operator_minus_equal)))
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(uint128_t_operator_minus_equal)))

	ld $25, %call16(uint128_t_operator_minus)($28)
	sd $16, 24($sp)
	move $16, $4
	move $6, $5
	move $4, $sp
	sd $31, 40($sp)

	jalr $25
	move $5, $16

	ld $25, %call16(uint128_t_constructor)($28)
	move $5, $sp

	jalr $25
	move $4, $16

	ld $31, 40($sp)
	move $2, $16
	ld $28, 32($sp)
	ld $16, 24($sp)
	j $31
	daddiu $sp, 48





uint128_t_operator_multiply:
	ld $10, 8($6)
	ld $14, 8($5)
	daddiu $sp, -0x20
	dext $11, $14, 0, 32
	sd $16, 8($sp)
	dsrl $16, $10, 32
	dmult $11, $16

	ld $2, 0($6)
	ld $3, 0($5)
	dext $7, $2, 0, 32
	dsrl $2, 32
	dext $15, $10, 0, 32
	dext $24, $3, 0, 32
	dsrl $10, $3, 32
	dsrl $14, 32

	mflo $13
	dmult $11, $7

	sd $17, 16($sp)
	dsrl $17, $13, 32
	dext $13, 0, 32

	mflo $8
	dmult $2, $11
	dext $12, $8, 0, 32
	daddu $12, $17
	move $2, $4

	sd $17, 16($sp)
	mflo $3
	dmult $11, $15
	dext $9, $3, 0, 32

	mflo $11
	dmult $14, $16

	mflo $6
	dmult $14, $7
	dsrl $7, $8, 32
	daddu $8, $9, $7

	mflo $25
	dmult $14, $15
	dext $7, $25, 0, 32
	daddu $7, $8, $7

	mflo $14
	fmult $24, $15

	mflo $3
	dmult $24, $16
	dext $24, $6, 0, 32
	daddu $9, $12, $24
	dsrl $6, 32
	daddu $6, $7, $6

	ld $16, 8($sp)
	daddiu $sp, 0x20

	mflo $5
	dmult $10, $15
	dsrl $15, $11, 32
	daddu $13, $15
	dext $15, $14, 0, 32
	dsrl $14, 32
	daddu $13, $15, $13
	daddu $8, $9, $14
	dext $5, 0, 32
	dext $9, $3, 0, 32

	mflo $10
	daddu $5, $6, $5
	daddu $8, $9, $8
	dsrl $3, 32
	dsrl $6, $13, 32
	daddu $8, $6, $8
	daddu $3, $5, $3
	dext $10, 0, 32

	dsrl $5, $8, 32
	daddu $3, $10, $3
	daddu $3, $5, $3
	dsll $3, 32
	dext $8, 0, 32

	dsll $5, $13, 32
	dext $11, 0, 32

	or $3, $8
	or $11, $5, $11

	sd $3, 0($4)
	j $31
	sd $11, 8($4)





uint128_t_operator_multiply_equal:
	daddiu $sp, -0x30
	sd $28, 32($sp)
	lui $28, %hi(%neg(%gp_rel(uint128_t_operator_multiply_equal)))
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(uint128_t_operator_multiply_equal)))

	ld $25, %call16(uint128_t_operator_multiply)($28)
	sd $16, 24($sp)
	move $16, $4
	move $6, $5
	move $4, $sp
	sd $31, 40($sp)

	jalr $25
	move $5, $16

	ld $25, %call16(uint128_t_constructor)($28)
	move $5, $sp

	jalr $25
	move $4, $16

	ld $31, 40($sp)
	move $2, $16
	ld $28, 32($sp)
	ld $16, 24($sp)
	j $31
	daddiu $sp, 48





uint128_t_divmod:
	daddiu $sp, -0x90
	sd $28, 128($sp)
	lui $28, %hi(%neg(%gp_rel(uint128_t_divmod)))
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(uint128_t_divmod)))

	ld $25, %call16(uint128_t_operator_equal_equal)($28)
	ld $5, %got_disp(uint128_1)($28)
	sd $21, 104($sp)
	move $21, $4
	move $4, $7
	sd $20, 96($sp)
	sd $19, 88($sp)
	sd $31, 136($sp)
	sd $23, 120($sp)
	sd $22, 112($sp)
	sd $18, 80($sp)
	sd $17, 72($sp)
	sd $16, 64($sp)
	move $19, $7

	jalr $25
	move $20, $6

	bne $2, $0, .do520
	ld $25, %call16(uint128_t_constructor)($28)

	ld $25, %call16(uint128_t_operator_equal_equal)($28)
	move $5, $19

	jalr $25
	move $4, $20

	bne $2, $0, .do1
	ld $25, %call16(uint128_t_operator_equal_equal)($28)

	ld $5, %got_disp(uint128_0)($28)
	jalr $25
	move $4, $20

	beq $2, $0, .startLoop
	ld $25, %call16(uint128_t_operator_below)($28)

	ld $25, %call16(uint128_t_constructor)($28)

.ret0:
	ld $5, %got_disp(uint128_0)($28)
	jalr $25
	move $4, $21

	ld $25, %call16(uint128_t_constructor)($28)
	move $5, $20

	jalr $25
	daddiu $4, $21, 16

	ld $31, 136($sp)
	move $2, $21
	ld $28, 128($sp)
	ld $23, 120($sp)
	ld $22, 112($sp)
	ld $21, 104($sp)
	ld $20, 96($sp)
	ld $19, 88($sp)
	ld $18, 80($sp)
	ld $17, 72($sp)
	ld $16, 64($sp)
	j $31
	addiu $sp, 0x90

.do1:
	ld $5, %got_disp(uint128_1)($28)
	ld $25, %call16(uint128_t_constructor)($28)

.do0:
	jalr $25
	move $4, $21

	ld $5, %got_disp(uint128_0)($28)
	ld $25, %call16(uint128_t_constructor)($28)
	jalr $25
	daddiu $4, $21, 16

	ld $31, 136($sp)
	move $2, $21
	ld $28, 128($sp)
	ld $23, 120($sp)
	ld $22, 112($sp)
	ld $21, 104($sp)
	ld $20, 96($sp)
	ld $19, 88($sp)
	ld $18, 80($sp)
	ld $17, 72($sp)
	ld $16, 64($sp)
	j $31
	daddiu $sp, 0x90

.do520:
	b .do0
	move $5, $20

.startLoop:
	move $5, $19
	jalr $25
	move $4, $20

	bne $2, $0, .ret0
	ld $25, %call16(uint128_t_constructor)($28)

	ld $5, %got_disp(uint128_0)($28)
	move $4, $sp

	jalr $25
	daddiu $18, $sp, 16

	ld $5, %got_disp(uint128_0)($28)
	ld $25, %call16(uint128_t_constructor)($28)
	jalr $25
	move $4, $18

	ld $25, %call16(uint128_t_bits)($28)
	jalr $25
	move $4, $20

	beq $2, $0, .doDouble
	move $17, $2

	daddiu $23, $sp, 48
	daddiu $22, $sp, 32

.ldShiftLeft:
	ld $25, %call16(uint128_t_operator_shiftLeft_equal)($28)

.do12:
	ld $5, %got_disp(uint128_1)($28)
	move $4, $sp

	jalr $25
	addiu $16, $17, -1

	ld $5, %got_disp(uint128_1)($28)
	ld $25, %call16(uint128_t_operator_shiftLeft_equal)($28)
	move $4, $18

	jalr $25
	andi $17, $16, 0xFF

	ld $25, %call16(uint128_t_operator_shiftRight)($28)
	move $5, $20
	move $4, $23
	move $6, $22

	dext $16, 0, 32
	sd $16, 40($sp)

	jalr $25
	sd $0, 32($sp)

	ld $2, 56($sp)
	ld $25, %call16(uint128_t_operator_cast_bool)($28)
	move $4, $22
	andi $2, 1
	sd $2, 40($sp)

	jalr $25
	sd $0, 32($sp)

	bne $2, $0, .continue
	ld $25, %call16(uint128_t_operator_plus_plus)($28)

	ld $25, %call16(uint128_t_operator_above_equal)($28)

.doMinEq:
	move $5, $19
	jalr $25
	move $4, $18

	bne $2, $0, .doPlusPlus
	ld $25, %call16(uint128_t_operator_minus_equal)($28)

	bne $17, $0, .do12
	ld $25, %call16(uint128_t_operator_shiftLeft_equal)($28)

.doDouble:
	ld $25, %call16(uint128_t_constructor_uint128_t_double_ref)($28)
	move $4, $21

.doDouble2:
	jalr $25
	move $5, $sp

	ld $25, %call16(uint128_t_constructor_uint128_t_double_ref)($28)
	move $5, $18

	jalr $25
	daddiu $4, $21, 16

	ld $31, 136($sp)
	move $2, $21
	ld $28, 128($sp)
	ld $23, 120($sp)
	ld $22, 112($sp)
	ld $21, 104($sp)
	ld $20, 96($sp)
	ld $19, 88($sp)
	ld $18, 80($sp)
	ld $17, 72($sp)
	ld $16, 64($sp)
	j $31
	daddiu $sp, 0x90

.doPlusPlus:
	move $4, $18
	jalr $25
	move $5, $19

	ld $25, %call16(uint128_t_operator_plus_plus)($28)
	jalr $25
	move $4, $sp

	bne $17, $0, .ldShiftLeft
	ld $25, %call16(uint128_t_constructor_uint128_t_double_ref)($28)

	b .doDouble2
	move $4, $21

.continue:
	jalr $25
	move $4, $18

	b .doMinEq
	ld $25, %call16(uint128_t_operator_above_equal)($28)





uint128_t_operator_divide:
	daddiu $sp, -0x40
	sd $28, 48($sp)
	lui $28, %hi(%neg(%gp_rel(uint128_t_operator_divide)))
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(uint128_t_operator_divide)))

	ld $25, %call16(uint128_t_divmod)($28)
	sd $16, 40($sp)
	move $7, $6
	move $16, $4
	move $6, $5
	sd $31, 56($sp)

	jalr $25
	move $4, $sp

	ld $25, %call16(uint128_t_constructor_uint128_t_double_ref)($28)
	move $5, $sp

	jalr $25
	move $4, $16

	ld $31, 56($sp)
	move $2, $16
	ld $28, 48($sp)
	ld $16, 40($sp)
	j $31
	daddiu $sp, 0x40





uint128_t_operator_divide_equal:
	daddiu $sp, -0x30
	sd $28, 32($sp)
	lui $28, %hi(%neg(%gp_rel(uint128_t_operator_divide_equal)))
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(uint128_t_operator_divide_equal)))

	ld $25, %call16(uint128_t_operator_divide)($28)
	sd $16, 24($sp)
	move $16, $4
	move $6, $5
	move $4, $sp
	sd $31, 40($sp)

	jalr $25
	move $5, $16

	ld $25, %call16(uint128_t_constructor)($28)
	move $5, $sp

	jalr $25
	move $4, $16

	ld $31, 40($sp)
	move $2, $16
	ld $28, 32($sp)
	ld $16, 24($sp)
	j $31
	daddiu $sp, 48





uint128_t_operator_modulo:
	daddiu $sp, -0x40
	sd $28, 48($sp)
	lui $28, %hi(%neg(%gp_rel(uint128_t_operator_divide)))
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(uint128_t_operator_divide)))

	ld $25, %call16(uint128_t_divmod)($28)
	sd $16, 40($sp)
	move $7, $6
	move $16, $4
	move $6, $5
	sd $31, 56($sp)

	jalr $25
	move $4, $sp

	ld $25, %call16(uint128_t_constructor_uint128_t_double_ref)($28)
	daddiu $5, $sp, 16

	jalr $25
	move $4, $16

	ld $31, 56($sp)
	move $2, $16
	ld $28, 48($sp)
	ld $16, 40($sp)
	j $31
	daddiu $sp, 0x40





uint128_t_operator_modulo_equal:
	daddiu $sp, -0x30
	sd $28, 32($sp)
	lui $28, %hi(%neg(%gp_rel(uint128_t_operator_modulo_equal)))
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(uint128_t_operator_modulo_equal)))

	ld $25, %call16(uint128_t_operator_modulo)($28)
	sd $16, 24($sp)
	move $16, $4
	move $6, $5
	move $4, $sp
	sd $31, 40($sp)

	jalr $25
	move $5, $16

	ld $25, %call16(uint128_t_constructor)($28)
	move $5, $sp

	jalr $25
	move $4, $16

	ld $31, 40($sp)
	move $2, $16
	ld $28, 32($sp)
	ld $16, 24($sp)
	j $31
	daddiu $sp, 48





uint128_t_operator_plus_plus:
	daddiu $sp -0x10
	sd $28, 0($sp)
	lui $28, %hi(%neg(%gp_rel(uint128_t_operator_plus_plus)))
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(uint128_t_operator_plus_plus)))

	ld $25, %call16(uint128_t_operator_plus_equal)
	sd $31, 8($sp)

	jalr $25
	ld $5, %got_disp(uint128_1)($28)

	ld $31, 8($sp)
	ld $28, 0($sp)
	j $31
	daddiu $sp, 0x10





uint128_t_operator_plus_plus_int:
	daddiu $sp, -0x20
	sd $28, 16($sp)
	lui $28, %hi(%neg(%gp_rel(uint128_t_operator_plus_plus_int)))
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(uint128_t_operator_plus_plus_int)))

	ld $25, %call16(uint128_t_constructor)($28)
	sd $31, 24($sp)
	sd $17, 8($sp)
	sd $16, 0($sp)
	move $17, $5

	jalr $25
	move $16, $4

	ld $25, %call16(uint128_t_operator_plus_plus)($28)
	jalr $25
	move $4, $17

	ld $31, 24($sp)
	move $2, $16
	ld $28, 16($sp)
	ld $17, 8($sp)
	ld $16, 0($sp)
	j $31
	daddiu $sp, 0x20





uint128_t_operator_minus_minus:
	daddiu $sp -0x10
	sd $28, 0($sp)
	lui $28, %hi(%neg(%gp_rel(uint128_t_operator_minus_minus)))
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(uint128_t_operator_minus_minus)))

	ld $25, %call16(uint128_t_operator_minus_equal)
	sd $31, 8($sp)

	jalr $25
	ld $5, %got_disp(uint128_1)($28)

	ld $31, 8($sp)
	ld $28, 0($sp)
	j $31
	daddiu $sp, 0x10





uint128_t_operator_minus_minus_int:
	daddiu $sp, -0x20
	sd $28, 16($sp)
	lui $28, %hi(%neg(%gp_rel(uint128_t_operator_minus_minus_int)))
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(uint128_t_operator_minus_minus_int)))

	ld $25, %call16(uint128_t_constructor)($28)
	sd $31, 24($sp)
	sd $17, 8($sp)
	sd $16, 0($sp)
	move $17, $5

	jalr $25
	move $16, $4

	ld $25, %call16(uint128_t_operator_minus_minus)($28)
	jalr $25
	move $4, $17

	ld $31, 24($sp)
	move $2, $16
	ld $28, 16($sp)
	ld $17, 8($sp)
	ld $16, 0($sp)
	j $31
	daddiu $sp, 0x20





uint128_t_operator_single_plus:
	daddiu $sp, -0x20
	sd $28, 16($sp)
	lui $28, %hi(%neg(%gp_rel(uint128_t_operator_single_plus)))
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(uint128_t_operator_single_plus)))

	ld $25, %call16(uint128_t_constructor)($28)
	sd $31, 24($sp)
	sd $16, 8($sp)

	jalr $25
	move $16, $4

	ld $31, 24($sp)
	move $2, $16
	ld $28, 16($sp)
	ld $16, 8($sp)





uint128_t_operator_single_minus:
	daddiu $sp, -0x30
	sd $28, 32($sp)
	lui $28, %hi(%neg(%gp_rel(uint128_t_operator_single_minus)))
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(uint128_t_operator_single_minus)))

	ld $25, %call16(uint128_t_operator_not)($28)
	sd $16, 24($sp)
	move $16, $4
	sd $31, 40($sp)

	jalr $25
	move $4, $sp

	ld $6, %got_disp(uint128_1)($28)
	ld $25, %call16(uint128_t_operator_plus)($28)
	move $5, $sp

	jalr $25
	move $4, $16

	ld $31, 40($sp)
	move $2, $16
	ld $28, 32($sp)
	ld $16, 24($sp)
	j $31
	daddiu $sp, 0x30





uint128_t_upper:
	j $31
	move $2, $4





uint128_t_lower:
	j $31
	daddiu $2, $4, 8





uint128_t_bits:
	ld $2, 0($4)
	bne $2, $0, .finish
	dclz $3, $2

	ld $2, 8($4)
	beq $2, $0, .return
	dclz $3, $2

	li $2, 0x40
	subu $2, $3
	j $31
	andi $2, 0xFF

.return:
	j $31
	move $2, $0

.finish:
	li $2, -0x80
	subu $2, $3
	j $31
	andi $2, 0xFF
