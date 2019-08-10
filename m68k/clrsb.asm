	.text

__clrsbsi2:
	move.l 4(sp), d0
	jlt .not
	jeq .ret1F

.doClz:
	bfffo d0{#0:#0}, d0
	subq.l #1, d0
	rts

.not:
	not.l d0
	jne .doClz

.ret1F:
	moveq #0x1F, d0
	rts





__clrsbdi2:
	move.l d2, -(sp)
	move.l 8(sp), d1
	move.l 12(sp), d0

	tst.l d1
	jeq .eq2

	moveq #-1, d2
	cmp.l d1, d2
	jeq .eq

	move.l d1, d0
	jlt .lt

	lea 0.w, a0
	bfffo d0{#0:#0}, d0
	lea -1(a0, d0.l), a0
	move.l a0, d0

.return:
	move.l (sp)+, d2
	rts

.eq:
	not.l d0

.eq2:
	tst.l d0
	jne .ne

	moveq #0x3F, d0
	move.l (sp)+, d2
	rts

.lt:
	not.l d0
	lea 0.w, a0
	bfffo d0{#0:#0}, d0
	lea -1(a0, d0.l), a0
	move.l a0, d0
	jra .return

.ne:
	move.w #0x20, a0
	bfffo d0{#0:#0}, d0
	lea -1(a0, d0.l), a0
	move.l a0, d0
	bra .return
