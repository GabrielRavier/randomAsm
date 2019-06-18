sadd_overflow:
saddl_overflow:
	move $2, $0
	bltz $5, .doSlt
	addu $3, $4, $5

	slt $4, $3, $4
	bne $4, $0, .ret1
	nop

.return:
	j $31
	sw $3, 0($6)

.doSlt:
	slt $4, $3
	beq $4, $0, .return
	nop

.ret1:
	b .return
	li $2, 1





saddll_overflow:
	addu $6, $4, $6
	sltu $9, $6, $4

	addu $3, $5, $7
	lw $8, 16($sp)
	move $2, $0
	bltz $7, .ltz
	addu $3, $9, $3

	slt $7, $3, $5
	bne $7, $0, .ne
	nop

	bne $5, $3, .return
	nop

	sltu $4, $6, $4
	beq $4, $0, .return
	nop

.ne:
	b .return
	li $2, 1

.ltz:
	slt $7, $5, $3
	bne $7, $0, .ne
	nop

	beq $3, $5, .eq
	nop

.return:
	sw $6, 0($8)
	j $31
	sw $3, 4($8)

.eq:
	sltu $4, $6
	beq $4, $0, .return
	nop

	b .return
	li $2, 1





uadd_overflow:
	addu $5, $4, $5
	sltu $4, $5, $4
	bne $4, $0, .ret1

	move $2, $0

.return:
	j $31
	sw $5, 0($6)

.ret1:
	b .return
	li $2, 1
