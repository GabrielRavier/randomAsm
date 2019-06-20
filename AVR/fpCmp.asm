__fp_cmp:
	lsl ra3
	sbc r0
	lsl rb3
	sbc rbe

	ldi zl, 0x80
	ldi zh, 0xFE

	cp r1, ra0
	cpc r1, ra1
	cpc zl, ra2
	cpc zh, ra3
	brlo .return

	cp r1, rb0
	cpc r1, rb1
	cpc zl, rb2
	cpc zh, rb3
	brlo .return

	sub ra0, rb0
	sbc ra1, rb1
	sbc ra2, rb2
	sbc ra3, rb3
	brne .checkSigns

	eor r0, rbe
	breq .return

	or rb0, rb1
	or rb0, rb2
	or rb0, rb3
	brne .buildRetVal
	ret

.checkSigns:
	eor r0, rbe
	brne .buildRetVal

	sbci rbe, 1

.buildRetVal:
	lsr rbe
	ldi ra2, -1
	adc ra2, r1
	adc ra2, r1

.return:
	ret
