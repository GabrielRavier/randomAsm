	.text

N_MAGIC:
	j $31
	lhu $2, 6($4)





N_MACHTYPE:
	j $31
	lbu $2, 2($4)





N_FLAGS:
	j $31
	lbu $2, 3($4)





N_SET_INFO:
	andi $6, 0xFF
	sll $6, 16
	andi $5, 0xFFFF
	andi $7, 0xFF

	or $5, $6, $5
	sll $6, $7, 24
	or $6, $5, $6
	j $31
	sd $6, 0($4)





N_BADMAG:
	lhu $2, 0($4)
	daddiu $2, -204
	sltu $3, $2, 64
	beq $3, $0, .ret1

	li $3, -13

	dsll $3, 59
	daddiu $3, 1
	dsrl $2, $3, $2
	andi $2, 1
	j $31
	xori $2, 1

.ret1:
	j $31
	li $2, 1
