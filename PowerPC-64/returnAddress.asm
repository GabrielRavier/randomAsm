currentAddress:
	mflr 3
	blr

	.long 0
	.quad 0





returnAddress:
	std 31, -8(1)
	stdu 1, -48(1)
	mr 31, 1

	ld 9, 0(31)

	addi 1, 31, 48
	ld 31, -8(1)
	ld 9, 0(9)
	ld 3, 16(9)
	blr

	.long 0
	.quad 0
