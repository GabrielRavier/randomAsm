.include "standard.inc"

	.text

START_FUNC __ror
	moveq #0x1F, d1
	and.l 8(sp), d1
	move.l 4(sp), d0
	ror.l d1, d0
	rts
END_FUNC __ror





START_FUNC __rorll
	movem.l #0x3E00, -(sp)
	move.l 24(sp), d3
	move.l 28(sp), d4
	moveq #0x3F, d2
	and.l 32(sp), d2

	move.w #-0x20, a0
	add.l d2, a0
	tst.l a0
	jlt .Lcontinue

	move.l d3, d1
	move.l a0, d0
	lsr.l d0, d1
	clr.l d5
	neg.l d2

	moveq #0x3F, d0
	and.l d0, d2

	move.w #-0x20, a0
	add.l d2, a0
	tst.l a0
	jlt .Lreturn

.Lreturn2:
	move.l d4, d0
	move.l a0, d2
	lsl.l d2, d0
	clr.l d4
	or.l d5, d0
	or.l d4, d1
	movem.l (sp)+, #0x7C
	rts

.Lcontinue:
	moveq #0x1F, d1
	sub.l d2, d1

	move.l d3, d0
	add.l d0
	lsl.l d1, d0

	move.l d4, d1
	lsr.l d2, d1
	or.l d0, d1

	move.l d3, d5
	lsr.l d2, d5
	neg.l d2

	moveq #0x3F, d0
	and.l d0, d2

	move.w #-0x20, a0
	add.l d2, a0
	tst.l a0
	jge .Lreturn2

.Lreturn:
	move.l d4, d6
	lsr.l #1, d6

	moveq #0x1F, d0
	sub.l d2, d0
	lsr.l d0, d6

	move.l d3, d0
	lsl.l d2, d0
	or.l d6, d0
	lsl.l d2, d4
	or.l d5, d0
	or.l d4, d1
	movem.l (sp)+, #0x7C
	rts
END_FUNC __rorll





START_FUNC __rev16
	move.l 4(sp), d0

	.rept 2

		ror.w #8, d0
		swap d0

	.endr

	rts
END_FUNC __rev16





START_FUNC __rev16ll
	move.l d2, -(sp)
	move.l 8(sp), d0
	ror.w #8, d0
	swap d0
	ror.w #8, d0

	move.l 12(sp), d2
	ror.w #8, d2
	swap d2
	ror.w #8, d2
	swap d0

	move.l d2, d1
	swap d1
	move.l (sp)+, d2
	rts
END_FUNC __rev16ll
