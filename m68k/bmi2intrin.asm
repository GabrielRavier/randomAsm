	.text

_mulx_u32:
	move.l 4(sp), d1
	clr.l d0
	move.l 8(sp), a1
	lea 0.w, a0

	move.l a1, -(sp)
	move.l a0, -(sp)
	move.l d1, -(sp)
	move.l d0, -(sp)
	jsr __muldi3

	lea (16, sp), sp
	move.l d0, a0
	move.l d1, d0
	move.l 12(sp), a1
	move.l a0, (a1)
	rts
