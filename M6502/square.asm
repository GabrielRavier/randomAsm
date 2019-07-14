square:
	jsr pushax
	jsr pushw0sp
	
	ldy #3
	lda (sp), y
	tax
	dey
	lda (sp), y
	jsr tosmulax
	jmp incsp2