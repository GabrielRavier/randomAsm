decsp2:
	lda sp
	sec
	sbc #2
	sta sp
	bcc .dec

	rts

.dec:
	dec sp+1
	rts
