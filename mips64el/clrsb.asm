	.text

__clrsbdi2:
	sll $4, 0
	seh $3, $4

	sra $3, 8
	seb $5, $3

	beq $5, $0, .eq1
	li $6, -1

	beq $5, $6, .eq2
	nop

	bltz $5, .andFFAndClz
	nor $4, $0, $3

	andi $4, $3, 0xFF

.doClz:
	clz $4
	move $2, $0
	addu $2, $4, $2
	j $31
	addiu $2, -1

.eq2:
	nor $4, $0, $4

.eq1:
	andi $4, 0xFF

	bne $4, $0, .ne
	clz $4

	j $31
	li $2, 0xF

.ne:
	li $2, 8
	addu $2, $4, $2

	j $31
	addiu $2, -1

.andFFAndClz:
	b .doClz
	andi $4, 0xFF
