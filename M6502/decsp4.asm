decsp4:
	lda sp
	sec
	sbc #4
	sta sp
	bcc .doDec
	
	rts
	
.doDec:
	dec sp+1
	rts