trap:
	addi sp, -0x10
	sw ra, 12(sp)
	call abort
