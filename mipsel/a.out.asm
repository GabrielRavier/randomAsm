	.text

N_MAGIC:
	j $31
	lhu $2, 0($4)





N_MACHTYPE:
	j $31
	lbu $2, 2($4)





N_FLAGS:
	j $31
	lbu $2, 3($4)





N_SET_INFO:
	andi $6, 0xFF
	andi $5, 0xFFFF

	sll $6, 16
	or $6, $5
	sll $7, 24
	or $6, $7
	j $31
	sw $6, 0($4)





N_BADMAG:
	lhu $2, 0($4)
	addiu $3, $2, -263
	sltu $3, 2
	bne $3, $0, .retR0
	li $3, 0x10B
	
	beq $2, $3, .retR0
	nop
	
	xori $2, 0xCC
	j $31
	sltu $2, $0, $2

.retR0:
	j $31
	move $2, $0
