deceaxy:
	sty tmp1
	sec
	sbc tmp1
	bcs .ret

	dex
	cpx #$FF
	bne .ret

	dec sreg
	cpx sreg
	bne .ret

	dec sreg+1

.ret:
	rts
