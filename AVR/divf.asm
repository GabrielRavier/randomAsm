	.text

__divsf3:
	call __divsf3x
	call __fp_round





.l0:
	call __fp_pscB
	brcs .nan

	call __fp_pscA
	brcs .nan
	brne .zr

.infA:
	cpi r11, 0xFF
	breq .nan

.inf:
	jmp __fp_inf

.l1:
	cpse r11, r1

.zr:
	jmp __fp_szero

.nan:
	jmp __fp_nan

__divsf3x:
	call __fp_split3
	brcs .l0

__divsf3_pse:
	tst r25
	breq .l1

	tst r11
	breq .inf

	sub r25, r11
	sbc r25, r11

	clr r27
	clr r26

.l2:
	cp r22, r18
	cpc r23, r19
	cpc r24, r10
	brlo .l3

	subi r25, lo8(-1)
	sbci r11, hi8(-1)

	lsl r18
	rol r19
	rol r10
	rol r26
	breq .l2

.l3:
	rcall .div
	mov r0, r30
	brmi .l5

.l4:
	ldi r30, 0x80
	rcall .div1

	subi r25, lo8(1)
	sbci r11, hi8(1)
	lsr r30
	rol r0
	brpl .l4

.l5:
	rcall .div
	mov r31, r30
	rcall .div

	lsl r22
	rol r23
	rol r24
	rol r27

	cp r18, r22
	cpc r19, r23
	cpc r10, r24
	cpc r26, r27

	ldi r27, 0x80
	breq .l4

	sbc r27

.l4:
	mov r24, r0
	movw r22, r30
	clr r31

	subi r25, lo8(-125)
	sbci r11, hi8(-125)
	brmi .l13

.l11:
	cpi r25, 254
	cpc r11, r1
	brlo .l15
	jmp __fp_inf

.l12:
	jmp __fp_szero

.l13:
	cpi r11, hi8(-24)
	brlt .l12

	cpi r25, lo8(-24)
	brlt .l12

.l14:
	lsr r24
	ror r23
	ror r22
	ror r27
	ror r31

	subi r25, -1
	brne .l14

.l15:
	lsl r24
	adc r25, r1
	lsr r25
	ror r24
	bld r25, 7
	ret

.div:
	ldi r30, 1

.div1:
	lsl r22
	rol r23
	rol r24
	rol r27

	cp r22, r18
	cpc r23, r19
	cpc r24, r10
	cpc r27, r26
	brcs .l22

	sub r22, r18
	sbc r23, r19
	sbc r24, r10
	sbc r27, r26

.l22:
	rol r30
	brcc .div1

	com r30
	ret
