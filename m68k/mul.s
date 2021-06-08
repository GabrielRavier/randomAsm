	.text

__muldi3:
	movem.l #0x3C00, -(sp)
	move.l 20(sp), d5
	move.l 24(sp), d3
	move.l 28(sp), d4
	move.l 32(sp), d2

	move.l d2, -(sp)
	move.l d3, -(sp)
	jsr __muldsi3

	muls.l d5, d2
	muls.l d4, d3

	add.l d3, d2
	addq.l #8, sp
	add.l d2, d0
	move.l (sp)+, #60
	rts





__muldsi3:
	movem.l #0x3E00, -(sp)
	move.l 24(sp), d3
	move.l 28(sp), d4
	move.l d3, d0
	and.l #0xFFFF, d0

	move.l d4, d2
	and.l #0xFFFF, d2

	move.l d0, d1
	muls.l d2, d1
	move.l d1, d5
	moveq #0x10, d6

	lsr.l d6, d5
	lsr.l d6, d3
	muls.l d3, d2
	add.l d5, d2
	clr.l d5

	move.w d2, d5
	lsr.l d6, d4
	muls.l d4, d0
	add.l d5, d0
	and.l #0xFFFF, d1

	move.l d0, d5
	lsl.l d6, d5
	lsr.l d6, d2
	muls.l d4, d3
	add.l d3, d2
	lsr.l d6, d0
	add.l d2, d0
	add.l d5, d1

	movem.l (sp)+, #0x7C
	rts
