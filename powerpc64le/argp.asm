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
	stdu 1, -32(1)
	ld 4, 0(9)
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
	lwz 9, 24(3)
	rlwinm 9, 0, 28, 28
	extsw. 10, 9
	bne 0, .ret0
	
	lwa 3, 8(3)
	addi 9, 3, -1
	cmplwi 7, 9, 0xFE
	ble 7, .continue
	
	mr 3, 10
	
.continue:
	mflr 0
	std 0, 16(1)
	stdu 1, -32(1)
	
	bl isprint
	nop
	
	addi 1, 0x20
	cntlzw 9, 3
	ld 0, 16(1)
	srwi 9, 5
	mtlr 0
	xori 10, 9, 1
	mr 3, 10
	blr
	
.ret0:
	li 3, 0
	blr
	
	.long 0
	.byte 0, 9, 0, 1, 0x80, 0, 0, 0





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
	.byte 0, 0, 0, 0, 0, 0, 0, 0
