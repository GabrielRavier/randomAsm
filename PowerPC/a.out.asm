N_MAGIC:
	lhz 3, 2(3)
	blr





N_MACHTYPE:
	lbz 3, 1(3)
	blr





N_FLAGS:
	lbz 3, 0(3)
	blr





N_SET_INFO:
	slwi 5, 16
	slwi 6, 24
	or 4, 5
	or 5, 4, 6
	stw 5, 0(3)
	blr





N_BADMAG:
	lhz 9, 2(3)
	addi 10, 9, -263
	cmplwi 7, 10, 1
	ble- 7, .ret0

	cmplwi 7, 9, 267
	li 3, 0
	beqlr- 7
	xori 9, 0xCC
	cntlzw 9
	srwi 9, 5
	xori 3, 9, 1
	blr

.ret0:
	li 3, 0
	blr
