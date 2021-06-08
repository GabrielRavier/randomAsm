	.text

ffs:
ffsl:
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





clz:
clzl:
	bfffo 4(sp){#0:#0}, d0
	rts





ctz:
ctzl:
	move.l 4(sp), d0
	move.l d0, d1
	neg.l d1
	and.l d1, d0
	bfffo d0{#0:#0}, d0

	moveq #0x1F, d1
	sub.l d0, d1
	move.l d1, d0
	rts





clrsb:
clrsbl:
	move.l 4(sp), -(sp)
	jsr __clrsbsi2
	addq.l 4, sp
	rts





popcount:
popcountl:
	move.l 4(sp), -(sp)
	jsr __popcountsi2
	addq.l #4, sp
	rts





parity:
parityl:
	move.l 4(sp), -(sp)
	jsr __paritysi2
	addq.l #4, sp
	rts





clzll:
	move.l 4(sp), d1
	move.l 8(sp), d0
	tst.l d1
	jeq .eq

	bfffo d1{#0:#0}, d0
	move.l d0, d1
	smi d0
	extb.l d0
	rts

.eq:
	bfffo d0{#0:#0}, d0
	moveq #0x20, d1
	add.l d1, d0
	move.l d0, d1
	smi d0
	extb.l d0
	rts





ctzll:
	.rept 2

		move.l 8(sp), -(sp)

	.endr

	jsr __ctzdi2
	addq.l #8, sp
	move.l d0, d1
	smi d0
	extb.l d0
	rts





clrsbll:
	.rept 2

		move.l 8(sp), -(sp)

	.endr

	jsr __clrsbdi2
	addq.l #8, sp
	move.l d0, d1
	smi d0
	extb.l d0
	rts





popcountll:
	.rept 2

		move.l 8(sp), -(sp)

	.endr

	jsr __popcountdi2
	addq.l #8, sp
	move.l d0, d1
	smi d0
	extb.l d0
	rts





parityll:
	.rept 2

		move.l 8(sp), -(sp)

	.endr

	jsr __paritydi2
	addq.l #8, sp
	move.l d0, d1
	smi d0
	extb.l d0
	rts
