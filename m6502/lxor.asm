tosxor0ax:
	stz sreg
	stz sreg+1

tosxoreax:
	eor (sp)
	ldy #1

	sta tmp1
	txa
	eor (sp), y
	tax
	iny

	lda sreg
	eor (sp), y
	sta sreg
	iny

	lda sreg+1
	eor (sp), y
	sta sreg+1

	lda tmp1
	jmp addysp1
