__andn_u32:
	move.l 4(sp), d0
	not.l d0
	and.l 8(sp), d0
	rts





__blsi_u32:
	move.l 4(sp), d0
	move.l d0, d1
	neg.l d1
	and.l d1, d0
	rts





__blsmsk_u32:
	move.l 4(sp), d0
	move.l d0, d1
	subq.l #1, d1
	eor.l d1, d0
	rts





__blsr_u32:
	move.l 4(sp), d0
	move.l d0, d1
	subq.l #1, d1
	and.l d1, d0
	rts





__andn_u64:
	move.l 4(sp), d0
	not.l d0

	move.l 8(sp), d1
	not.l d1

	and.l 12(sp), d0
	and.l 16(sp), d1
	rts





__blsi_u64:
	movem.l #0x3C00, -(sp)
	move.l 20(sp), d2
	move.l 24(sp), d3
	move.l d2, d4
	move.l d3, d5

	neg.l d5
	negx.l d4

	move.l d4, d0
	and.l d2, d0

	move.l d5, d1
	and.l d3, d1

	movem.l (sp)+, #0x3C
	rts





__blsmsk_u64:
	movem.l #0x3C00, -(sp)
	move.l 20(sp), d2
	move.l 24(sp), d3
	moveq #-1, d4
	moveq #-1, d5

	add.l d3, d5
	addx.l d2, d4

	move.l d4, d0
	eor.l d2, d0

	move.l d5, d1
	eor.l d3, d1

	movem.l (sp)+, #0x3C
	rts





__blsr_u64:
	movem.l #0x3C00, -(sp)
	move.l 20(sp), d2
	move.l 24(sp), d3
	moveq #-1, d4
	moveq #-1, d5

	add.l d3, d5
	addx.l d2, d4

	move.l d4, d0
	and.l d2, d0

	move.l d5, d1
	and.l d3, d1

	movem.l (sp)+, #0x3C
	rts
