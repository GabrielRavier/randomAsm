	.text

currentAddress:
	mv r0, ra
	ret





returnAddress:
	addi sp, -0x10

	sw ra, 12(sp)
	sw s0, 8(sp)
	addi s0, sp, 0x10

	lw a0, -8(s0)
	lw a0, -4(a0)
	lw s0, 8(sp)
	lw ra, 12(sp)

	addi sp, 0x10
	ret
