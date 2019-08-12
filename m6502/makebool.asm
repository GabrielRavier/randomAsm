boolne:
	bne booleq.ret1
	
.ret0:
	ldx #0
	txa
	rts
	
	
	
	
	
booleq:
	bne .ret0
	
.ret1:
	ldx #0
	lda #1
	rts