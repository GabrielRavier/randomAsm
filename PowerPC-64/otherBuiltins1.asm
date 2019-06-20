bcmp:
	addis 2, 12, .TOC. - bcmp@ha
	addi 2, .TOC. - bcmp@l

	mflr 0
	std 0, 16(1)
	stdu 1, -32(1)

	bl memcmp
	nop

	addi 1, 32
	ld 0, 16(1)

	mtlr 0
	blr

	.long 0
	.byte 0, 9, 0, 1, 0x80, 0, 0, 0





bzero:
	addis 2, 12, .TOC. - bzero@ha
	addi 2, .TOC. - bzero@l
	mflr 0

	mr 5, 4
	li 4, 0

	std 0, 16(1)
	stdu 1, -32(1)

	bl memset
	nop

	addi 1, 32
	ld 0, 16(1)

	mtlr 0
	blr

	.long 0
	.byte 0, 9, 0, 1, 0x80, 0, 0, 0





ffsll:
ffsl:
	neg 9, 3
	and 3, 9, 3
	cntlzd 3

	subfic 3, 64
	blr

	.long 0
	.byte 0, 9, 0, 1, 0x80, 0, 0, 0





ffs:
	neg 9, 3
	and 3, 9, 3
	cntlzw 3
	subfic 3, 32

	extsw 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





isascii:
	rlwinm 3, 0, 0, 0x18
	cntlzw 3
	srwi 3, 5
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





signbit:
signbitf:
	xxlxor 0
	fcmpu 7, 1, 0

	mfcr 3, 1
	rlwinm 3, 29, 1
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





signbitl:
	xxlxor 12
	xxlxor 13
	fcmpu 7, 1, 12
	bne 7, $+8

	fcmpu 7, 2, 13

	mfcr 3, 1
	rlwinm 3, 29, 1
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





toascii:
	rldicl 3, 0, 57
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
