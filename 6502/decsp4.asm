decsp4:
	lda sp
	sec
	sbc #4
	sta sp

	bcc @dec
	rts

@dec:
	dec sp+1
	rts
