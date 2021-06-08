.include "standard.inc"

	.text

abs:
	sbrs r25, 7
	ret

	multiNeg r25, r24
	sbc r25, __zero_reg__
	ret





fabs:
	andi r25, 0x7F
	ret





isdigit:
	movw r18, r24
	subi16 r18, 0x30
	ldi16 r24, 1
	cpi16 r18, 10
	brlo .return

	ldi16 r24, 0

.return:
	ret





labs:
	sbrs r25, 7
	ret

	multiCom r25, r24, r23
	neg r22

	multiSbciMin1 r23, r24, r25
	ret





strlen:
	movw r30, r24

.loop:
	ld __tmp_reg__, Z+
	tst __tmp_reg__
	brne .loop

	sbiw r30, 1

	movw r18, r30
	sub16 r18, r24
	movw r24, r18
	ret
