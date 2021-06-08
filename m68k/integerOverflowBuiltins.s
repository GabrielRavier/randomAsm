	.text

sadd_overflow:
saddl_overflow:
	.irp reg, d3, d2

		move.l \reg, -(sp)

	.endr

	move.l 16(sp), d1
	clr.l d0

	move.l 12(sp), d3
	add.l d1, d3

	move.l 12(sp), d2
	eor.l d1, d2
	eor.l d3, d1
	not.l d2
	and.l d2, d1
	jlt .do1

	move.l 20(sp), a0
	move.l d3, (a0)

	.irp reg, d2, d3

		move.l (sp)+, \reg

	.endr

	rts

.do1:
	moveq #1, d0

	move.l 20(sp), a0
	move.l d3, (a0)

	.irp reg, d2, d3

		move.l (sp)+, \reg

	.endr

	rts





saddll_overflow:
	movem.l #0x3F00, -(sp)
	move.l 36(sp), d2
	move.l 40(sp), d3
	clr.l d0

	move.l 28(sp), d4
	move.l 32(sp), d5
	add.l d3, d5
	addx.l d2, d4

	move.l 28(sp), d6
	eor.l d2, d6

	move.l 32(sp), d1
	eor.l d3, d1

	move.l d4, d7
	eor.l d2, d7

	move.l d7, a0
	move.l d5, d7
	eor.l d3, d7

	.irp reg, d6, d1

		not.l \reg

	.endr

	move.l a0, d2
	and.l d6, d2

	move.l d7, d3
	and.l d1, d3
	tst.l d2
	jmi .do1

	move.l 44(sp), a0
	move.l d4, (a0)
	move.l d5, 4(a0)
	movem.l (sp)+, #0xFC
	rts

.do1:
	moveq #1, d0

	move.l 44(sp), a0
	move.l d4, (a0)
	move.l d5, 4(a0)
	movem.l (sp)+, #0xFC
	rts





uadd_overflow:
uaddl_overflow:
	move.l 4(sp), a0
	clr.l d0

	move.l a0, d1
	add.l 8(sp), d1
	cmp.l d1, a0
	jhi .do1

	move.l 12(sp), a0
	move.l d1, (a0)
	rts

.do1:
	moveq #1, d0

	move.l 12(sp), a0
	move.l d1, (a0)
	rts





uaddll_overflow:
	movem.l #0x3F00, -(sp)
	move.l 28(sp), d4
	move.l 32(sp), d5
	clr.l d0

	move.l 36(sp), d2
	move.l 40(sp), d3
	add.l d5, d3
	addx.l d4, d2

	move.l d2, d6
	move.l d3, d7
	sub.l d5, d7
	subx.l d3, d6
	jcs .do1

	move.l 44(sp), a0
	move.l d2, (a0)
	move.l d3, 4(a0)
	movem.l (sp)+, #0xFC
	rts

.do1:
	moveq #1, d0
	move.l 44(sp), a0
	move.l d2, (a0)
	move.l d3, 4(a0)
	movem.l (sp)+, #0xFC
	rts
