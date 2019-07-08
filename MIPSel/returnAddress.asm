currentAddress:
	addiu $sp, -8
	sw $31, 4($sp)

	move $2, $31
	lw $31, 4($sp)
	nop

	j $31
	addiu $sp, 8





builtin_extract_return_addr:
	li $2, -2

	j $31
	and $2, $4, $2
