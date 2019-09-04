.include "standard.inc"

	.text

__fp_cmp:
	lsl r25
	sbc r0
	lsl r21
	sbc r26

	ldi16 r30, 0xFE80

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

	sub64 r22, r18
	brne .checkSigns

	eor r0, r26
	breq .return

	.irp reg, r19, r20, r21

		or r18, \reg

	.endr

	brne .buildRetVal
	ret

.checkSigns:
	eor r0, r26
	brne .buildRetVal

	sbci r26, 1

.buildRetVal:
	lsr r26
	ldi r24, -1

	.rept 2

		adc r24, r1

	.endr

.return:
	ret





__fp_round:
	mov r0, r25

	.irp instr, inc, lsl

		\instr r0

	.endr

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
	subi32 r22, -1

.return:
	ret





__fp_pscA:

	.irp instr, clr, dec

		\instr r0

	.endr

	cp r1, r22

	.irp reg, r23, r24

		cpc r1, \reg

	.endr

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
	ldi16 r22, 0
	ret





__fp_nan:
	ldi16 r24, 0xFFC0
	ret





__fp_zero:
	clt

__fp_szero:
	clr r27
	clr16 r22
	movw r24, r22
	cld r25, 7
	ret





__fp_split3:
	sbrc r21, 7
	subi r25, 0x80

	lsl16 r20
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

	.irp reg, r19, r20

		cpc r1, \reg

	.endr

	rol r21
	rjmp __fp_split3.l1

.l5:
	lsr r20
	rcall __fp_splitA
	rjmp .l8

.l6:
	cp r1, r22

	.irp reg, r23, r24

		cpc r1, \reg

	.endr

	rol r25
	rjmp .l3

.l7:
	lsr r24

	.irp reg, r23, r22

		cpc \reg, r1

	.endr

.l8:
	sec
	ret
