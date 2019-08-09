	.text

__ffsdi2:
	move.l 4(sp), d0
	move.l 8(sp), d1
	jne .ne

	tst.l d0
	jne .ne2

	rts

.ne:
	move.l d1, d0
	neg.l d0
	and.l d1, d0
	bfffo d0{#0:#0}, d0
	moveq #0x20, d1
	sub.l d0, d1
	move.l d1, d0
	rts

.ne2:
	move.l d0, d1
	neg.l d1
	and.l d1, d0
	bfffo d0{#0:#0}, d0

	moveq #0x40, d1
	sub.l d0, d1
	move.l d1, d0
	rts
