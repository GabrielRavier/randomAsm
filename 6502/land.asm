tosand0ax:
#if CPU_65c02
	stz sreg
	stz sreg+1
#else
	ldy #$00
	sty sreg
	sty sreg+1
#endif

tosandeax:
#if CPU_65c02
	and (sp)
	ldy #1
#else
	ldy #0
	and (sp), y
	iny
#endif

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
