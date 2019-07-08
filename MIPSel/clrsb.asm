__clrsbsi2:
	sll $4, 24
	sra $4, 24

	bltz $4, .ltz
	nop

	bne $4, $0, .ne
	nop

.ret7:
	j $31
	li $2, 7

.ltz:
	nor $4, $0, $4
	beq $4, $0, .ret7
	nop

.ne:
	addiu $sp, -0x20
	sw $31, 28($sp)

	jal __clzsi2
	nop

	lw $31, 28($sp)
	addiu $2, -1

	j $31
	addiu $sp, 0x20





__clrsbdi2:
	sll $4, 16
	sra $4, 16

	addiu sp, -0x20
	sra $2, $4, 8

	sw $31, 28($sp)
	beq $2, $0, .eq1
	sw $16, 24($sp)

	li $3, -1
	beq $2, $3, .eq2
	nop

	bltz $2, .doFF
	nor $4, $0, $2

	andi $4, $2, 0xFF

.do0:
	move $16, $0

.doClz:
	jal __clzsi2
	nop

	lw $31, 28($sp)
	addu $2, $16
	addiu $2, -1

	lw $16, 24($sp)
	j $31
	addiu $sp, 0x20

.eq2:
	nor $4, $0, $4

.eq1:
	andi $4, 0xFF
	bne $4, $0, .do8
	li $2, 0xF

	lw $31, 28($sp)
	lw $16, 24($sp)
	j $31
	addiu $sp, 0x20

.do8:
	b .doClz
	li $16, 8

.doFF:
	b .do0
	andi $4, 0xFF
