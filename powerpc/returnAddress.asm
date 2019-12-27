	.text

currentAddress:
	mflr 3
	blr





returnAddress:
	mflr 0
	stwu 1, -16(1)
	stw 31, 12(1)
	mr 31, 1
	stw 0, 20(1)

	addi 11, 31, 16
	lwz 9, 0(31)
	lwz 0, 4(11)
	lwz 9, 0(9)

	mtlr 0
	lwz 31, -4(11)
	lwz 3, 4(9)
	mr 1, 11
	blr
