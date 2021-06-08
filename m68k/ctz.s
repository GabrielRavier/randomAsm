	.text

__ctzdi2:
	move.l d2, -(sp)
	move.l 12(sp), d2
	seq d0
	extb.l d0

	move.l d0, d1
	not.l d1
	and.l d2, d1

	move.l d0, d2
	and.l 8(sp), d2
	or.l d2, d1

	move.l d1, d2
	neg.l d2
	and.l d2, d1
	bfffo d1{#0:#0}, d1

	moveq #0x1F, d2
	sub.l d1, d2

	move.l d2, d1
	moveq #0x20, d2
	and.l d2, d0
	add.l d1, d0

	move.l (sp)+, d2
	rts
