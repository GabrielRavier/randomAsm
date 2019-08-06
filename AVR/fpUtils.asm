.include "standard.inc"

	.text

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





__fp_round:
	mov r0, r25
	inc r0
	lsl r0
	brne .l1

	tst r24
	brmi .return

.l1:
	lsl r27
	brcc .return

	or r27, r31
	sbrs r22, 0
	rjmp .return

.l2:
	subi r22, -1
	sbci r23, -1
	sbci r24, -1
	sbci r25, -1

.return:
	ret





__fp_pscA:
	clr r0
	dec r0
	cp r1, r22
	cpc r1, r23
	cpc r1, r24
	cpc r0, r25
	ret





__fp_pscB:
	clr r0
	dec r0
	cp r1, r18
	cpc r1, r19
	cpc r1, r20
	cpc r0, r21
	ret





__fp_inf:
	bld r25, 7
	ori r25, 0x7F
	ldi r24, 0x80
	multiLdi0 r23, r22
	ret





__fp_nan:
	ldi r25, 0xFF
	ldi r24, 0xC0
	ret





__fp_zero:
	clt

__fp_szero:
	multiClr r27, r22, r23
	movw r24, r22
	cld r25, 7
	ret





__fp_split3:
	sbrc r21, 7
	subi r25, 0x80

	lsl r20
	rol r21
	breq .l4

	cpi r21, 0xFF
	breq .l5

.l1:
	ror r20

__fp_splitA:
	lsl r24

.l2:
	bst r25, 7
	rol r25
	breq .l6

	cpi r25, 0xFF
	breq .l7

.l3:
	ror r24
	ret

.l4:
	cp r1, r18
	cpc r1, r19
	cpc r1, r20
	rol r21
	rjmp __fp_split3.l1

.l5:
	lsr r20
	rcall __fp_splitA
	rjmp .l8

.l6:
	cp r1, r22
	cpc r1, r23
	cpc r1, r24
	rol r25
	rjmp .l3

.l7:
	lsr r24
	cpc r23, r1
	cpc r22, r1

.l8:
	sec
	ret
