currentAddress:
	addi sp, -0x10
	sd ra, 8(sp)

	mv a0, ra
	ld ra, 8(sp)
	addi sp, 0x10
	jr ra
