.include "standard.inc"

	.text

__mulsf3:
	call __mulsf3x
	jmp __fp_round





0:
	call __fp_pscA
	brcs 1f

	call __fp_pscB
	brcs 1f

	and r25, r21
	breq 1f

	jmp __fp_inf

1:
	jmp __fp_nan

2:
	clr r1
	jmp __fp_szero

__mulsf3x:
	call __fp_split3
	brcs 0b

__mulsf3_pse:
	mul r25, r21
	breq 2b

	add r25, r21
	ldi r21, 0
	adc r21

	mul r22, r18
	movw r30, r0

	mul r23, r18
	clr r27
	add r31, r0
	adc r27, r1

	mul r22, r19
	clr r26
	add r31, r0
	adc r27, r1
	adc r26

	mul r22, r20
	clr r22
	add r27, r0
	adc r26 r1
	adc r22

	mul r24, r18
	clr r18
	add r27, r0
	adc r26, r1
	adc r22, r18

	mul r23, r19
	add r27, r0
	adc r26, r1
	adc r22, r18

	mul r24, r19
	add r26, r0
	adc r22, r1
	adc r18

	mul r23, r20
	clr r19
	add r26, r0
	adc r22, r1
	adc r18, r19

	mul r24, r20
	add r22, r0
	adc r18, r1

	mov r24, r18
	mov r23, r22
	mov r22, r26

	clr r1

	subi r25, lo8(127)
	sbci r21, hi8(127)
	brmi .l13
	breq .l15

.l10:
	tst r24
	brmi .l11

	lsl r30
	multiRol r31, r27, r22, r23, r24

	subi r25, lo8(1)
	sbci r21, hi8(1)
	brne .l10

.l11:
	cpi r25, 254
	cpc r21, r1
	brlo .l15

	jmp __fp_inf

.l12:
	jmp __fp_szero

.l13:
	cpi r21, hi8(-24)
	brlt .l12

	cpi r25, lo8(-24)
	brlt .l12

.l14:
	lsr r24
	multiRor r23, r22, r27, r31, r30

	subi r25, -1
	brne .l14

.l15:
	or r31, r30

	lsl r24
	adc r25, r1
	lsr r25
	ror r24
	bld r25, 7
	ret
