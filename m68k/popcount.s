	.text

__popcountsi2:
	move.l d2, -(sp)
	move.l 8(sp), d0
	move.l d0, d1
	lsr.l #1, d1
	and.l #0x55555555, d1
	sub.l d1, d0

	move.l d0, d1
	lsr.l #2, l1
	and.l #0x33333333, d1
	and.l #0x33333333, d0
	add.l d0, d1

	move.l d1, d0
	lsr.l #4, d0
	add.l d1, d0
	and.l #0xF0F0F0F, d0

	move.l d0, d1
	moveq #0x10, d2
	lsr.l d2, d1
	add.l d1, dà

	move.l d0, d1
	lsr.l #8, d1
	add.l d1, d0

	moveq #0x3F, d1
	and.l d1, d0
	move.l (sp)+, d2
	rts





__popcountdi2:
	movem.l #0x3C00, -(sp)
	move.l 20(sp), d4
	move.l 24(sp), d5
	move.l d4, d2
	move.l d5, d3
	lsr.l #1, d2
	roxr.l #1, d3

	move.l d2, d0
	and.l #0x55555555, d0

	move.l d3, d1
	and.l #0x55555555, d1
	sub.l d1, d5
	subx.l d0, d4

	move.l d4, d2
	move.l d5, d3
	lsr.l #1, d2
	roxr.l #1, d3
	lsr.l #1, d2
	roxr.l #1, d3

	move.l d2, d0
	and.l #0x33333333, d0

	move.l d3, d1
	and.l #0x33333333, d1

	move.l d4, d2
	and.l #0x33333333, d2

	move.l d5, d3
	and.l #0x33333333, d3
	add.l d1, d3
	addx.l d0, d2

	move.l d2, d4
	moveq #0x1C, d0
	lsl.l d0, d4

	move.l d3, d1
	lsr.l #4, d1
	or.l d4, d1

	move.l d2, d0
	lsr.l #4, d0
	add.l d1, d0

	moveq #0x7F, d1
	and.l d1, d0
	movem.l (sp)+, #0x3C
	rts
