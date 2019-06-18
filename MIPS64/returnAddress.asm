currentAddress:
	daddiu $sp, -0x10
	sd $31, 8($sp)

	move $2, $31
	ld $31, 8($sp)

	j $31
	daddiu $sp, 0x10
