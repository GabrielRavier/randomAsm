pusheax:
	pha
	jsr decsp4
	
	ldy #3
	lda sreg+1
	sta (sp), y
	dey
	lda sreg
	sta (sp), y
	dey
	txa
	sta (sp), y
	pla
	
	sta (sp)
	
	rts