	.text

__paritysi2:
	move.l d2, -(sp)
	move.l 8(sp), d1
	move.l d1, d0
	moveq #0x10, d2
	lsr.l d2, d0
	eor.l d1, d0

	move.l d0, d1
	lsr.l #8, d1
	eor.l d1, d0

	move.l d0, d1
	lsr.l #4, d1
	eor.l d0, d1

	moveq #0xF, d0
	and.l d0, d1

	move.l #0x6996, d0
	asr.l d1, d0

	moveq #1, d0
	and.l d1, d0

	move.l (sp)+, d2
	rts





__paritydi2:
	move.l 8(sp), d0
	eor.l d0, 4(sp)
	jra __paritysi2
