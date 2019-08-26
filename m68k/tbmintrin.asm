	.text
	
__blcfill_u32:
	move.l 4(sp), d0
	move.l d0, d1
	addq.l #1, d1
	and.l d1, d0
	rts
	
	
	
	
	
__blci_u32:
	move.l 4(sp), d1
	move.l d1, d0
	addq.l #1, d0
	not.l d0
	or.l d1, d0
	rts
	
	
	
	
	
__blcic_u32:
	move.l 4(sp), d1
	move.l d1, d0
	not.l d0
	addq.l #1, d1
	and.l d1, d0
	rts
	
	
	
	
	
__blcmsk_u32:
	move.l 4(sp), d0
	move.l d0, d1
	addq.l #1, d1
	or.l d1, d0
	rts
	
	
	
	
	
__blcs_u32:
	move.l 4(sp), d0
	move.l d0, d1
	addq.l #1, d1
	or.l d1, d0
	rts
	
	
	
	
	
__blsfill_u32:
	move.l 4(sp), d0
	move.l d0, d1
	subq.l #1, d1
	or.l d1, d0
	rts
	
	
	
	
	
__blsic_u32:
	move.l 4(sp), d1
	move.l d1, d0
	not.l d0
	subq.l #1, d1
	or.l d1, d0
	rts
	
	
	
	
	
__t1mskc_u32:
	move.l 4(sp), d1
	move.l d1, d0
	not.l d0
	addq.l #1, d1
	or.l d1, d0
	rts
	
	
	
	
	
__tzmsk_u32:
	move.l 4(sp), d1
	move.l d1, d0
	not.l d0
	subq.l #1, d1
	and.l d1, d0
	rts
	
	
	
	
	
__blcfill_u64:
	movem.l #0x3C00, -(sp)
	move.l 20(sp), d2
	move.l 24(sp), d3
	clr.l d4
	
	moveq #1, d5
	add.l d3, d5
	addx.l d2, d4
	
	move.l d4, d0
	and.l d2, d0
	
	move.l d5, d1
	and.l d3, d1
	
	movem.l (sp)+, #0x3C
	rts
	
	
	
	
	
__blci_u64:
	movem.l #0x3C00, -(sp)
	move.l 20(sp), d2
	move.l 24(sp), d3
	clr.l d4
	
	moveq #1, d5
	add.l d3, d5
	addx.l d2, d4
	
	move.l d4, d0
	not.l d0
	
	move.l d5, d1
	not.l d1
	
	or.l d2, d0
	or.l d3, d1
	
	movem.l (sp)+, #0x3C
	rts
	
	
	
	
	
__blcic_u64:
	movem.l #0x3800, -(sp)
	move.l 16(sp), d2
	move.l 20(sp), d3
	move.l d2, d0
	not.l d0
	
	move.l d3, d1
	not.l d1
	clr.l d4
	addq.l #1, d3
	addx.l d4, d2
	and.l d2, d0
	and.l d3, d1
	
	movem.l (sp)+, #0x1C
	rts
	
	
	
	
	
__blcmsk_u64:
	movem.l #0x3C00, -(sp)
	move.l 20(sp), d2
	move.l 24(sp), d3
	clr.l d4
	
	moveq #1, d5
	add.l d3, d5
	addx.l d2, d4
	
	move.l d4, d0
	eor.l d2, d0
	
	move.l d5, d1
	eor.l d3, d1
	
	movem.l (sp)+, #0x3C
	rts
	
	
	
	
	
__blcs_u64:
	movem.l #0x3C00, -(sp)
	move.l 20(sp), d2
	move.l 24(sp), d3
	clr.l d4
	
	moveq #1, d5
	add.l d3, d5
	addx.l d2, d4
	
	move.l d4, d0
	or.l d2, d0
	
	move.l d5, d1
	or.l d3, d1
	
	movem.l (sp)+, #0x3C
	rts
	
	
	
	
	
__blsfill_u64:
	movem.l #0x3C00, -(sp)
	move.l 20(sp), d2
	move.l 24(sp), d3
	
	moveq #-1, d4	
	moveq #-1, d5
	add.l d3, d5
	addx.l d2, d4
	
	move.l d4, d0
	or.l d2, d0
	
	move.l d5, d1
	or.l d3, d1
	
	movem.l (sp)+, #0x3C
	rts
	
	
	
	
	
__blsic_u64:
	movem.l #0x3800, -(sp)
	move.l 16(sp), d2
	move.l 20(sp), d3
	move.l d2, d0
	not.l d0
	
	move.l d3, d1
	not.l d1
	clr.l d4
	subq.l #1, d3
	subx.l d4, d2
	or.l d2, d0
	or.l d3, d1
	
	movem.l (sp)+, #0x1C
	rts
	
	
	
	
	
__t1mskc_u64:
	movem.l #0x3800, -(sp)
	move.l 16(sp), d2
	move.l 20(sp), d3
	move.l d2, d0
	not.l d0
	
	move.l d3, d1
	not.l d1
	clr.l d4
	addq.l #1, d3
	addx.l d4, d2
	or.l d2, d0
	or.l d3, d1
	
	movem.l (sp)+, #0x1C
	rts
	
	
	
	
	
__tzmsk_u64:
	movem.l #0x3800, -(sp)
	move.l 16(sp), d2
	move.l 20(sp), d3
	move.l d2, d0
	not.l d0
	
	move.l d3, d1
	not.l d1
	clr.l d4
	subq.l #1, d3
	subx.l d4, d2
	and.l d2, d0
	and.l d3, d1
	
	movem.l (sp)+, #0x1C
	rts