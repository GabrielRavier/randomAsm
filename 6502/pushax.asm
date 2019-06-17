push0:
	lda #0

pusha0:
	ldx #0

pushax:
	pha
	lda sp
	sec
	sbc #2
	sta sp
	bcs @skip

	dec sp+1

@skip:
	ldy #1
	sta (sp), y
	pla
	dey
	sta (sp), y
	rts
