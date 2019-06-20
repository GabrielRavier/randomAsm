__fp_cmp:
	lsl r25
	sbc r0
	lsl r21
	sbc r26

	ldi r30, 0x80
	ldi r31, 0xFE

	cp r1, r22
	cpc r1, r23
	cpc r30, r24
	cpc r31, r25
	brlo .return

	cp r1, r18
	cpc r1, r19
	cpc r30, r20
	cpc r31, r21
	brlo .return

	sub r22, r18
	sbc r23, r19
	sbc r24, r20
	sbc r25, r21
	brne .checkSigns

	eor r0, r26
	breq .return

	or r18, r19
	or r18, r20
	or r18, r21
	brne .buildRetVal
	ret

.checkSigns:
	eor r0, r26
	brne .buildRetVal

	sbci r26, 1

.buildRetVal:
	lsr r26
	ldi r24, -1
	adc r24, r1
	adc r24, r1

.return:
	ret
