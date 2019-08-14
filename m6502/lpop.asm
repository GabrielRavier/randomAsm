popeax:
	ldy #3
	lda (sp), y
	sta sreg+1
	dey

	lda (sp), y
	sta sreg
	dey

	lda (sp), y
	tax
	lda (sp)
	jmp incsp4
