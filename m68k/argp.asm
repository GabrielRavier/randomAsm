	.text

__argp_usage:
	pea 262.w
	move.l stderr, -(%sp)
	move.l 12(%sp), -(%sp)
	jsr __argp_state_help
	lea (12, %sp), %sp
	rts





__option_is_short:
	move.l 4(%sp), %a0
	moveq #8, %d0
	and.l 12(%a0), %d0
	jne .ret0

	move.l 4(%a0), %d1
	move.l %d1, %a0
	subq.l #1, %a0
	cmp.w #0xFE, %a0
	jls .continue

	rts

.continue:
	move.l %d1, -(%sp)
	jsr isprint
	addq.l #4, %sp
	tst.l %d0
	sne %d0
	extb.l %d0
	neg.l %d0
	rts

.ret0:
	clr.l %d0
	rts





__option_is_end:
	move.l 4(%sp), %a0
	move.l 4(%a0), %d0
	jne .ret0

	tst.l (%a0)
	jeq .continue

.return:
	rts

.ret0:
	clr.l %d0
	rts

.continue:
	tst.l 16(%a0)
	jne .return

	tst.l 20(%a0)
	seq %d0
	extb.l %d0
	neg.l %d0
	rts
