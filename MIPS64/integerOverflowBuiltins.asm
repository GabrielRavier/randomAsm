sadd_overflow:
	daddu $4, $5
	sll $3, $4, 0
	move $2, $3

	xor $2, $4, $2
	sw $3, 0($6)

	j $31
	sltu $2, $0, $2





saddl_overflow:
saddll_overflow:
	move $2, $0
	bltz $5, .doSlt
	daddu $3, $4, $5

	slt $4, $3, $4
	bne $4, $0, .ret1
	nop

.return:
	j $31
	sd $3, 0($6)

.doSlt:
	slt $4, $3
	beq $4, $0, .return
	nop

.ret1:
	b .return
	li $2, 1
