	.text

square:
	move.l 4(sp), d0
	muls.l d0
	rts
