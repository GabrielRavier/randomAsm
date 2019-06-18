currentAddress:
	daddiu $sp, -0x10
	sd $31, 8($sp)

	move $2, $31
	ld $31, 8($sp)

	j $31
	daddiu $sp, 0x10





builtin_extract_return_addr:
	li $2, -2

	j $31
	and $2, $4, $2
