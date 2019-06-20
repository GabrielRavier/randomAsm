__ffsdi2:
	cmpwi 7, 4, 0
	bne- 7, .l2

	cmpwi 7, 3, 0
	bne- 7, .l6

	mr 3, 4
	blr

.l2:
	neg 0, 4
	and 4, 9, 4
	cntlzw 4
	subfic 4, 32

	mr 3, 4
	blr

.l6:
	neg 4, 3
	and 4, 3
	cntlzw 4
	subfic 4, 64

	mr 3, 4
	blr
