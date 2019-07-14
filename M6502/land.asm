tosand0ax:
	stz sreg
	stz sreg+1
	
tosandeax:
	and (sp)
	ldy #1
	
	sta tmp1
	txa
	and (sp), y
	tax
	iny
	lda sreg
	and (sp), y
	sta sreg
	iny
	lda sreg+1
	and (sp), y
	sta sreg+1
	
	lda tmp1
	jmp addysp1