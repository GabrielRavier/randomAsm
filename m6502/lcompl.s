compleax:
	eor #$FF
	pha
	txa

	eor #$FF
	tax
	lda sreg

	eor #$FF
	sta sreg
	lda sreg+1

	eor #$FF
	sta sreg+1
	pla
	rts
