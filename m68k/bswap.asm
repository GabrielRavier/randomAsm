	.text

bswap16:
	clr.l d0
	move.w 6(sp), d0
	ror.w #8, d0
	rts





bswap32:
	move.l 4(sp), d0
	ror.w #8, d0
	swap d0
	ror.w #8, d0
	rts





bswap64:
	move.l 4(sp), d1
	ror.w #8, d1
	swap d1
	ror.w #8, d1

	move.l 8(sp), d0
	ror.w #8, d0
	swap d0
	ror.w #8, d0
	rts
