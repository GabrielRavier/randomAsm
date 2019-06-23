__clzsi2:
	li $2, -0x10000
	and $2, $4, $2

	bne $2, $0, .do32
	li $3, 0x10

	move $3, $0
	srl $4, $3
	andi $3, $4, 0xFF00
	li $5, 0x18

	bne $3, $0, .do22
	li $2, 0x10

.do2:
	srl $4, $3
	andi $3, $4, 0xF0

	bne $3, $0, .do12
	move $2, $5

.do1:
	srl $4, $3
	li $5, 4
	andi $3, $4, 0xC

	beq $3, $0, .ret2
	addu $5, $2

.ret1:
	li $3, 2
	srl $3, $4, $3
	srl $4, $3, 1
	xori $4, 1

	li $6, 2
	andi $4, 1
	subu $4, $0, $4
	subu $3, $6, $3

	move $2, $0
	and $3, $4, $3
	addu $2, $5, $2

	j $31
	addu $2, $3, $2

.do32:
	srl $4, $3
	andi $3, $4, 0xFF00

	li $5, 8
	beq $3, $0, .do2
	move $2, $0

.do22:
	li $3, 8
	srl $4, $3
	andi $3, $4, 0xF0

	beq $3, $0, .do1
	nop

.do12:
	li $3, 4
	srl $4, $3

	move $5, $0
	andi $3, $4, 0xC

	bne $3, $0, .ret1
	addu $5, $2

.ret2:
	srl $3, $4, $3
	srl $4, $3, 1
	xori $4, 1

	li $6, 2
	andi $4, 1
	subu $4, $0, $4
	subu $3, $6, $3

	li $2, 2
	and $3, $4, $3
	addu $2, $5, $2
	j $31
	addu $2, $3, $2





__clzdi2:
	addiu $sp, -0x20
	sw $16, 24($sp)

	sltu $16, $5, 1
	subu $16, $0, $16

	nor $2, $0, $16
	and $5, $2, $5
	and $4, $16, $4

	sw $31, 28($sp)
	jal __clzsi2
	or $4, $5, $4

	lw $31, 28($sp)
	andi $16, 0x20
	addu $2, $16, $2

	lw $16, 24($sp)
	j $31
	addiu $sp, 0x20
