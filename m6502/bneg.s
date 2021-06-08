bnegax:
	cpx #0
	bne bnega.ret0
	
bnega:
	tax
	bne .ret0
	
.ret1:
	lda #1
	rts
	
.ret0:
	ldx #0
	txa
	rts