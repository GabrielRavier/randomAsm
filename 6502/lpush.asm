pusl0:
	lda #0
	tax

push0ax:
#if CPU_65c02
	stz sreg
	stz sreg+1
#else
	ldy #$00
	sty sreg
	sty sreg+1
#endif

pusheax:
	pha
	jsr decsp4

	ldy #3
	lda sreg+1
	sta (sp), y
	dey

	lda sreg
	sta (sp), y
	dey
	txa

	sta (sp), y
	pla

#if CPU_65c02
	sta (sp)
#else
	dey
	sta (sp), y
#endif
	rts
