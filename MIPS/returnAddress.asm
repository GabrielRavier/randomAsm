currentAddress:
	addiu $sp, -8
	sw $31, 4($sp)

	move $2, $31
	lw $31, 4($sp)
	nop

	j $31
	addiu $sp, 8
