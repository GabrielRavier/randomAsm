tosshreax:
	and #$1F
	sta tmp1

	jsr popeax

	ldy tmp1
	beq .return

	stx tmp1

.loop:
	lsr sreg+1
	ror sreg
	ror a
	dey
	bne .loop

	ldx tmp1

.return:
	rts
