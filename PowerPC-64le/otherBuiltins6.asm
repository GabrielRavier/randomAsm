	.text

clz:
	cntlzw 3
	extsw 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





ctz:
	addi 9, 3, -1
	andc 3, 9, 3
	popcntw 3

	extsw 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





clrsb:
	addis 2, 12, .TOC. - clrsb@ha
	addi 2, .TOC. - clrsb@l
	mflr 0
	extsw 3

	std 0, 16(1)
	stdu 1, -32(1)

	bl __clrsbdi2
	nop

	addi 1, 32
	ld 0, 16(1)

	addi 3, -32
	extsw 3
	mtlr 0
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





popcount:
	popcntw 3
	extsw 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





parity:
	popcntb 3
	prtyw 3

	extsw 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





clzl:
clzll:
	cntlzd 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





ctzl:
ctzll:
	addi 9, 3, -1
	andc 3, 9, 3

	popcntd 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





clrsbl:
clrsbll:
	addis 2, 12, .TOC. - clrsbl
	addi 2, .TOC. - clrsbl
	mflr 0

	std 0, 16(1)
	stdu 1, -32(1)

	bl __clrsbdi2
	nop

	addi 1, 32
	ld 0, 16(1)
	extsw 3
	mtlr 0
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





popcountl:
popcountll:
	popcntd 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





parityl:
parityll:
	popcntb 3
	prtyd 3

	extsw 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
