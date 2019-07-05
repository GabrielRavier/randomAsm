	.text

ceilf:
	frip 1
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





fabsf:
	fabs 1
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





fabsl:
	xsabsdp 32, 1
	xxlor 33, 2, 2
	xscmpudp 7, 1, 32
	beq 7, .noNeg

	xsnegdp 32, 2

.noNeg:
	xxlor 2, 33, 33
	xxlor 1, 32, 32
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





floorf:
	frim 1
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





sqrtf:
	addis 2, 12, .TOC. - sqrtf@ha
	addi 2, .TOC. - sqrtf@l

	frsqrtes 0, 1
	fneg 10, 1
	xxlxor 11

	addis 9, 2, sqrtDat@toc@ha
	lfs 12, sqrtDat@toc@l(9)

	fmr 9, 0
	fsel 0, 10, 11, 9

	fmuls 1, 0, 1
	fmuls 0, 12
	fnmsubs 0, 1, 0, 12

	fmadds 1, 0, 1
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0

sqrtDat:
	.long 0x3F000000
