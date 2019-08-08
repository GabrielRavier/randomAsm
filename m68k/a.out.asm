	.text

N_MAGIC:
	move.l 4(%sp), %a0
	clr.w %d0
	move.b (%a0), %d0
	rts





N_MACHTYPE:
	move.l 4(%sp), %a0
	move.b 1(%a0), %d0
	rts





N_FLAGS:
	move.l 4(%sp), %a0
	move.b (%a0), %d0
	rts





N_SET_INFO:
	move.l %d2, -(%sp)
	clr.l %d0

	move.b 19(%sp), %d0
	moveq #0x10, %d1
	lsl.l %d1, %d0
	or.w 14(%sp), %d0
	clr.l %d1

	move.b 23(%sp), %d1
	moveq #0x18, %d2
	lsl.l %d2, %d1
	move.l 8(%sp), %a0
	or.l %d1, %d0
	move.l %d0, (%a0)
	move.l (%sp)+, %d2
	rts





N_BADMAG:
	move.l %d2, -(%sp)
	move.l 8(%sp), %a0
	move.l (%a0), %d0
	and.l #0xFFFF, %d0

	move.l %d0, %d1
	add.l #-0x107, %d1
	lsr.l #1, %d1
	jeq .ret0

	cmp.l #0x10B, %d0
	jeq .ret0

	cmp.l #0xCC, %d0
	sne %d0
	neg.b %d0
	move.l (%sp)+, %d2
	rts

.ret0:
	clr.b %d0
	move.l (%sp)+, %d2
	rts
