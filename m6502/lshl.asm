tosshleax:
tosasleax:
	and #$1F
	sta tmp1

	jsr popeax

	ldy tmp1
	beq .return

	stx tmp1

.loop:
	asl a
	rol tmp1
	rol sreg
	rol sreg+1
	dey
	bne .loop

	ldx tmp1

.return:
	rts
