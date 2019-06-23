clz:
clzl:
	cntlzw 3
	blr





ctz:
ctzl:
	neg 9, 3
	and 3, 9, 3
	cntlzw 3

	subfic 3, 31
	blr





clrsb:
clrsbl:
	mflr 0
	stwu 1, -16(1)
	stw 0, 20(1)

	bl __clrsbsi2

	lwz 0, 20(1)
	addi 1, 16
	mtlr 0
	blr





popcount:
popcountl:
	mflr 0
	stwu 1, -16(1)
	stw 0, 20(1)

	bl __popcountsi2

	lwz 0, 20(1)
	addi 1, 16
	mtlr 0
	blr





parity:
parityl:
	mflr 0
	stwu 1, -16(1)
	stw 0, 20(1)

	bl __paritysi2

	lwz 0, 20(1)
	addi 1, 16
	mtlr 0
	blr





clzll:
	cmpwi 0, 3, 0
	beq- 0, .eq

	cntlzw 3
	blr

.eq:
	cntlzw 3, 4
	addi 3, 32
	blr





ctzll:
	mflr 0
	swtu 1, -16(1)
	stw 0, 20(1)

	bl __ctzdi2

	lwz 0, 20(1)
	addi 1, 16
	mtlr 0
	blr





clrsbll:
	mflr 0
	stwu 1, -16(1)
	stw 0, 20(1)

	bl __clrsbdi2

	lwz 0, 20(1)
	addi 1, 16
	mtlr 0
	blr





popcountll:
	mflr 0
	stwu 1, -16(1)
	stw 0, 20(1)

	bl __popcountdi2

	lwz 0, 20(1)
	addi 1, 16
	mtlr 0
	blr





parityll:
	mflr 0
	stwu 1, -16(1)
	stw 0, 20(1)

	bl __paritydi2

	lwz 0, 20(1)
	addi 1, 16
	mtlr 0
	blr
