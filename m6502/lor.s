tosor2ax:
	stz sreg
	stz sreg+1

tosoreax:
	ora (sp)
	ldy #1

	sta tmp1
	txa
	ora (sp), y
	tax
	iny

	lda sreg
	ora (sp), y
	sta sreg
	iny

	lda sreg+1
	ora (sp), y
	sta sreg+1

	lda tmp1
	jmp addysp1
