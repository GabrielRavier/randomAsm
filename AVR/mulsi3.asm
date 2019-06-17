__mulsi3:
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29

	mov r27, r25
	mov r26, r24
	mov r25, r23
	mov r24, r22
	mov r23, r21
	mov r22, r20
	mov r21, r19
	mov r20, r18

	ldi r16, lo8(0)
	ldi r17, hi8(0)
	ldi r18, hlo8(0)
	ldi r19, hhi8(0)
	sbiw r24, 0
	cpc r26, __zero_reg__
	cpc r27, __zero_reg__
	brne .doAdd
	rjmp .return

.bigLoop:
	mov r29, r12
	mov r28, r13
	mov r31, r14
	mov r30, r15

.loop:
	mov r16, r29
	mov r17, r28
	mov r18, r31
	mov r19, r30

	lsr r27
	ror r26
	ror r25
	ror r24

	lsl r20
	rol r21
	rol r22
	rol r23

	sbiw r24, 0
	cpc r26, __zero_reg__
	cpc r27, __zero_reg__
	breq .return

.doAdd:
	mov r12, r16
	mov r13, r17
	mov r14, r18
	mov r15, r19

	add r12, r20
	adc r13, r21
	adc r14, r22
	adc r15, r23

	sbrc r24, 0
	rjmp .bigLoop

	mov r29, r16
	mov r28, r17
	mov r31, r18
	mov r30, r19
	rjmp .loop

.return:
	mov r22, r16
	mov r23, r17
	mov r24, r18
	mov r25, r19

	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	ret
