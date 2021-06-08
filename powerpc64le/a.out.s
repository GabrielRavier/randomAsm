	.text

N_MAGIC:
	lhz 3, 0(3)
	blr
	
	.long 0
	.quad 0, 9, 0, 0, 0, 0, 0, 0





N_MACHTYPE:
	lbz 3, 2(3)
	blr
	
	.long 0
	.quad 0, 9, 0, 0, 0, 0, 0, 0





N_FLAGS:
	lbz 3, 3(3)
	blr
	
	.long 0
	.quad 0, 9, 0, 0, 0, 0, 0, 0





N_SET_INFO:
	slwi 5, 16
	slwi 6, 24
	or 5, 4
	or 5, 6
	extsw 5
	std 5, 0(3)
	blr
	
	.long 0
	.quad 0, 9, 0, 0, 0, 0, 0, 0





N_BADMAG:
	lhz 9, 0(3)
	addi 9, -204
	cmpldi 7, 9, 0x3F
	bgt 7, .ret1
	
	lis 3, 0x9800
	sldi 3, 32
	
	ori 3, 1
	srd 3, 9
	not 3
	rldicl 3, 0, 0x3F
	blr
	
.ret1:
	li 3, 1
	blr
	
	.long 0
	.quad 0, 9, 0, 0, 0, 0, 0, 0
