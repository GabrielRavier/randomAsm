	.text

bcmp:
	jra memcmp





bzero:
	move.l 8(sp), -(sp)
	clr.l -(sp)
	move.l 12(sp), -(sp)
	jsr memset

	lea (12, sp), sp
	rts





ffsll:
	move.l 8(sp), -(sp)
	move.l 8(sp), -(sp)
	jsr __ffsdi2

	addq.l #8, sp
	move.l d0 d1
	smi d0
	extb.l d0
	rts





ffsl:
ffs:
	move.l d2, -(sp)
	move.l 8(sp), d1
	move.l d1, d0
	neg.l d0
	and.l d1, d0
	bfffo d0{#0:#0}, d0

	moveq #0x1F, d2
	sub.l d0, d2
	move.l d2, d0
	tst.l d1
	jne .not0

	moveq #-1, d0

.not0:
	addq.l #1, d0
	move.l (sp)+, d2
	rts





isascii:
	moveq #-0x80, d0
	and.l 4(sp), d0
	seq d0
	extb.l d0
	neg.l d0
	rts





signbitf:
	moveq #1, d0
	ftst.s 4(sp)
	fjlt .ret1

	clr.l d0

.ret1:
	rts





signbit:
signbitl:
	moveq #1, d0
	ftst.d 4(sp)
	fjlt .ret1

	clr.l d0

.ret1:
	rts
