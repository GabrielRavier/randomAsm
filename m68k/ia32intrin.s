	.text

__rold:
	moveq #0x1F, d1
	and.l 8(sp), d1
	move.l 4(sp), d0
	rol.l d1, d0
	rts





__rord:
	moveq #0x1F, d1
	and.l 8(sp), d1
	move.l 4(sp), d0
	ror.l d1, d0
	rts





__rolq:
	movem.l #0x3E00, -(sp)
	move.l 24(sp), d4
	move.l 28(sp), d3
	moveq #0x3F, d2
	and.l 32(sp), d2

	move.w #-0x20, a0
	add.l d2, a0
	tst.l a0
	jlt .lt

	move.l d3, d0
	move.l a0, d1
	lsl.l d1, d0
	clr.l d5
	neg.l d2
	moveq #0x3F, d1
	and.l d1, d2

	move.w #-0x20, a0
	add.l d2, a0
	tst.l a0
	jlt .ret2

.ret:
	move.l d4, d1
	move.l a0, d2
	lsr.l d2, d1
	clr.l d4
	or.l d4, d0
	or.l d5, d1
	movem.l (sp)+, #0x7C
	rts

.lt:
	moveq #0x1F, d0
	sub.l d2, d0

	move.l d3, d1
	lsr.l #1, d1
	lsr.l d0, d1

	move.l d4, d0
	lsl.l d2, d0
	or.l d1, d0

	move.l d3, d5
	lsl.l d2, d5
	neg.l d2

	moveq #0x3F, d1
	and.l d1, d2

	move.w #-0x20, a0
	add.l d2, a0
	tst.l a0
	jge .ret

.ret2:
	move.l d4, d6
	add.l d6

	moveq #0x1F, d1
	sub.l d2, d1
	lsl.l d1, d6

	move.l d3, d1
	lsr.l d2, d1
	or.l d6, d1
	lsr.l d2, d4
	or.l d4, d0
	or.l d5, d1

	movem.l (sp)+, #0x7C
	rts





__rorq:
	movem.l #0x3E00, -(sp)
	move.l 24(sp), d4
	move.l 28(sp), d3
	moveq #0x3F, d2
	and.l 32(sp), d2

	move.w #-0x20, a0
	add.l d2, a0
	tst.l a0
	jlt .lt

	move.l d3, d0
	move.l a0, d1
	lsr.l d1, d0
	clr.l d5
	neg.l d2
	moveq #0x3F, d1
	and.l d1, d2

	move.w #-0x20, a0
	add.l d2, a0
	tst.l a0
	jlt .ret2

.ret:
	move.l d4, d1
	move.l a0, d2
	lsl.l d2, d1
	clr.l d4
	or.l d4, d0
	or.l d5, d1
	movem.l (sp)+, #0x7C
	rts

.lt:
	moveq #0x1F, d0
	sub.l d2, d0

	move.l d3, d1
	add.l d0
	lsr.l d1, d0

	move.l d4, d1
	lsl.l d2, d1
	or.l d0, d1

	move.l d3, d5
	lsr.l d2, d5
	neg.l d2

	moveq #0x3F, d0
	and.l d0, d2

	move.w #-0x20, a0
	add.l d2, a0
	tst.l a0
	jge .ret

.ret2:
	move.l d4, d6
	lsr.l #1, d6

	moveq #0x1F, d0
	sub.l d2, d0
	lsl.l d0, d6

	move.l d3, d0
	lsr.l d2, d0
	or.l d6, d0
	lsr.l d2, d4
	or.l d5, d0
	or.l d4, d1

	movem.l (sp)+, #0x7C
	rts
