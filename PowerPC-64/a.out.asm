N_MAGIC:
	lhz 3, 0(3)
	blr
	.long 0
	.quad 0





N_MACHTYPE:
	lbz 3, 2(3)
	blr
	.long 0
	.quad 0





N_FLAGS:
	lbz 3, 3(3)
	blr
	.long 0
	.quad 0





N_SET_INFO:
	rlwimi 4, 5, 16, 8, 15
	rlwimi 4, 6, 24, 0, 7
	extsw 4
	std 4, 0(3)
	blr
	.long 0
	.quad 0





N_BADMAG:
	lhz 3, 0(3)
	addi 3, -204
	clrlwi 3, 16
	cmplwi 3, 63
	bgt 0, .ret1

	li 4, -52
	rldicr 4, 59, 63
	srd 3, 4, 3
	clrldi 3, 63
	blr

.ret1:
	li 3, 1
	blr
	.long 0
	.quad 0
