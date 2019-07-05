	.text

abs:
	sbrs r25, 7
	ret

	neg r25
	neg r24
	sbc r25, __zero_reg__
	ret





fabs:
	andi r25, 0x7F
	ret





isdigit:
	movw r18, r24
	subi r18, 0x30
	sbc r19, __zero_reg__

	ldi r24, lo8(1)
	ldi r25, 0

	cpi r18, 10
	cpc r19, __zero_reg__
	brlo .return

	ldi r24, 0
	ldi r25, 0

.return:
	ret





labs:
	sbrs r25, 7
	ret

	com r25
	com r24
	com r23
	neg r22

	sbci r23, lo8(-1)
	sbci r24, lo8(-1)
	sbci r25, lo8(-1)
	ret





strlen:
	movw r30, r24

.loop:
	ld __tmp_reg__, Z+
	tst __tmp_reg__
	brne .loop

	sbiw r30, 1

	movw r18, r30
	sub r18, r24
	sbc r19, r25
	movw r24, r18
	ret
