	.text

abs:
labs:
	move.l 4(sp), d0
	jlt .neg

	rts

.neg:
	neg.l d0
	rts





fabs:
	fdabs.d 4(sp), fp0
	rts





isdigit:
	moveq #-0x30, d0
	add.l 4(sp), d0

	moveq #9, d1
	cmp.l d0, d1
	scc d0
	extb.l d0
	neg.l d0
	rts





sqrt:
	fdsqrt.d 4(sp), fp0
	rts
