	.text

.pStderr:
	.quad stderr

__argp_usage:
	addis 2, 12, .TOC. - __argp_usage@ha
	addi 2, .TOC. - __argp_usage@l
	mflr 0

	addis 9, 2, .pStderr@toc@ha
	ld 9, .pStderr@toc@l(9)
	li 5, 0x106

	std 0, 16(1)
	ld 4, 0(9)
	stdu 1, -32(1)
	bl __argp_state_help
	nop

	addi 1, 0x20
	ld 0, 16(1)
	mtlr 0
	blr

	.long 0
	.byte 0, 9, 0, 1, 128, 0, 0, 0





__option_is_short:
	addis 2, 12, .TOC. - __option_is_short@ha
	addi 2, .TOC. - __option_is_short@l
	mflr 0
	std 31, -8(1)
	std 0, 16(1)
	stdu 1, -48(1)
	mr 31, 1

	lbz 4, 24(3)
	andi. 4, 8
	li 4, 0
	bne 0, .return

	lwz 3, 8(3)
	addi 5, 3, -1
	cmplwi 5, 0xFE
	bgt 0, .return

	extsw 3
	bl isprint
	nop

	cntlzw 3
	srwi 3, 5
	xori 4, 3, 1

.return:
	clrldi 3, 4, 0x20
	addi 1, 0x30
	ld 0, 16(1)
	ld 31, -8(1)
	mtlr 0
	blr
	.long 0
	.quad 0





__option_is_end:
	lwz 9, 8(3)
	mr 10, 3

	cmpwi 7, 9, 0
	bne 7, .ret0

	ld 9, 0(3)
	li 3, 0

	cmpdi 7, 9, 0
	bnelr 7
	ld 9, 32(10)
	cmpdi 7, 9, 0
	bnelr 7
	lwz 3, 40(10)
	cntlzw 3
	srwi 3, 5
	blr

.ret0:
	li 3, 0
	blr

	.long 0
	.quad 0
