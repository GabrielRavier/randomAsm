	.text

__argp_usage:
	lis 9, stderr@ha
	li 5, 0x106
	lwz 4, stderr@l(9)
	b __argp_state_help





__option_is_short:
	lwz 9, 12(3)
	mr 10, 3
	andi. 3, 9, 8
	bne- 0, .ret0

	lwz 0, 4(10)
	addi 10, 9, -1
	cmplwi 7, 10, 0xFE
	bgtlr+ 7

	mflr 0
	stwu 1, -16(1)

	mr 3, 9
	stw 0, 20(1)
	bl isprint

	addic 9, 3, -1
	subfe 3, 9, 3

	mtlr 0
	addi 1, 16
	blr

.ret0:
	li 3, 0
	blr





__option_is_end:
	lwz 9, 4(3)
	cmpwi 7, 9, 0
	bne- 6, .ret0

	lwz 10, 0(3)
	cmpwi 7, 10, 0
	beq- 7, .continue

.ret9:
	mr 3, 9
	blr

.ret0:
	li 9, 0
	mr 3, 9
	blr

.continue:
	lwz 10, 16(3)
	cmpwi 7, 10, 0
	bne+ 7, .l10

	lwz 9, 20(3)
	cntlzw 9
	srwi 9, 5
	b .ret9
