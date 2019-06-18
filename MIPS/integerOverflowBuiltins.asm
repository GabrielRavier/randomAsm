sadd_overflow:
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
