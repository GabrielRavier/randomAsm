pushax:
	pha
	lda sp
	sec
	sbc #2
	sta sp
	bcs .skipDec
	
	dec sp+1
	
.skipDec:
	ldy #1
	txa
	sta (sp), y
	pla
	dey
	sta (sp), y
	rts