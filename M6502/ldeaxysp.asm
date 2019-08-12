ldeax0sp:
	ldy #3

ldeaxysp:
	lda (sp), y
	sta sreg+1
	dey

	lda (sp), y
	sta sreg
	dey

	lda (sp), y
	tax
	dey

	lda (sp), y
	rts
