bzero:
	mr 5, 4
	li 4, 0
	b memset





ffsll:
	mflr 0
	stwu 1, -16(1)
	stw 0, 20(1)
	bl __ffsdi2

	lwz 0, 20(1)
	addi 1, 0x10
	mtlr 0
	blr





ffsl:
ffs:
	neg 9, 3
	and 3, 9, 3
	cntlzw 3

	subfic 3, 32
	blr





isascii:
	rlwinm. 9, 3, 0, 0, 0x18

	mfcr 3
	rlwinm 3, 1
	blr





signbit:
	lis 9, dbl0@ha
	lfd 0, dbl0@l(9)
	fcmpu 7, 1, 0

	mfcr 3
	rlwinm 3, 29, 1
	blr





signbitf:
	lis 9, flt0@ha
	lfs 0, flt0@l(9)
	fcmpu 7, 1, 0

	mfcr 3
	rlwinm 3, 29, 1
	blr





signbitl:
	lis 9, dbl0@ha
	lfd 12, dbl0@l(9)

	fmr 13, 12
	fcmpu 7, 1, 12
	bne 7, $+8

	fcmpu 7, 2, 13

	mfcr 3
	rlwinm 3, 29, 1
	blr





toascii:
	rlwinm 3, 0, 0x19, 0x1F
	blr

flt0:
	.long 0

dbl0:
	.long 0, 0
