tosorax:
	ora (sp)
	ldy #1
	
	sta tmp1
	txa
	ora (sp), y
	tax
	lda tmp1
	jmp addysp1