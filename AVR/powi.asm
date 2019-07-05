	.text

powi:
powif:
powil:
__powisf2:
	push r4
	push r5
	push r6
	push r7
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29

	movw r8, r22
	movw r10, r24
	movw r4, r10
	movw r6, r20
	movw r12, r18
	movw r14, r20

	ldi r16, 0
	ldi r17, 0
	ldi r29, lo8(-0x80)
	ldi r28, lo8(0x3F)
	rjmp .startLoop

.loop:
	asr r15
	ror r14
	ror r13
	ror r12

	cp r12, __zero_reg__
	cpc r13, __zero_reg__
	cpc r14, __zero_reg__
	cpc r15, __zero_reg__
	breq .endLoop

	movw r20, r10
	movw r18, r8
	movw r24, r10
	movw r22, r8
	call __mulsf3

	movw r8, r22
	movw r10, r24

.startLoop:
	sbrs r12, 0
	rjmp .skipMul

	movw r20, r10
	movw r18, r8
	movw r22, r16

	mov r24, r29
	mov r25, r28
	call __mulsf3

	movw r16, r22
	mov r29, r24
	mov r28, r25

.skipMul:
	sbrs r15, 7
	rjmp .loop

	ldi r24, -1
	sub r12, r24
	sbc r13, r24
	sbc r14, r24
	sbc r15, r24
	rjmp .loop

.endLoop:
	sbrc r7, 7
	rjmp .doDiv

	mov r20, r17
	movw r18, r28

.return:
	mov r22, r16
	mov r23, r20
	mov r24, r19
	mov r25, r18

	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	ret

.doDiv:
	movw r18, r16
	mov r20, r29
	mov r21, r28

	ldi r22, 0
	ldi r23, 0
	ldi r24, lo8(-0x80)
	ldi r25, lo8(0x3F)
	call __divsf3

	mov r16, r22
	mov r20, r23
	mov r10, r24
	mov r18, r25
	rjmp .return
