pushw0sp:
	ldy #3

pushwysp:
	lda sp
	sub #2
	sta sp
	bcs .skipDec
	
	dec sp+1
	
.skipDec:
	lda (sp), y
	tax
	dey
	lda (sp), y
	ldy #0
	sta (sp), y
	iny
	txa
	sta (sp), y
	rts