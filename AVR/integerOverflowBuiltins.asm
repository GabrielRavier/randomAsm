sadd_overflow:
	movw r30, r20

	ldi r21, 0
	movw r18, r24
	add r18, r22
	adc r19, r23

	sbrc r23, 7
	rjmp .check

	cp r18, r24
	cpc r19, r25
	brlt .ret1

.return:
	std Z+1, r19
	st Z, r18

	mov r24, r21
	ret

.check:
	cp r24, r18
	cpc r25, r19
	brge .return

.ret1:
	ldi r21, lo8(1)
	rjmp .return





saddl_overflow:
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17

	ldi r30, 0
	movw r12, r22
	movw r14, r24

	add r12, r18
	adc r13, r19
	adc r14, r20
	adc r15, r21

	sbrc r21, 7
	rjmp .checks

	cp r12, r22
	cpc r13, r23
	cpc r14, r24
	cpc r15, r25
	brlt .ret1

.return:
	movw r26, r16
	st X+, r12
	st X+, r13
	st X+, r14
	st X, r15
	sbiw r26, 3

	mov r24, r30
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	ret

.checks:
	cp r22, r12
	cpc r23, r13
	cpc r24, r14
	cpc r25, r15
	brge .return

.ret1:
	ldi r30, lo8(1)
	rjmp .return





saddll_overflow:
	push r2
	push r3
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

	in r28, __SP_L__
	in r29, __SP_H__
	sbiw r28, 0xF
	in __tmp_reg__, __SREG__
	cli

	out __SP_H__, r29
	out __SREG__, __tmp_reg__
	out __SP_L__, r28

	std Y+1, r18
	std Y+2, r19
	std Y+3, r20
	std Y+4, r21
	std Y+5, r22
	std Y+6, r23
	std Y+7, r24
	std Y+8, r25
	movw r30, r8

	std Y+15, __zero_reg__
	call __adddi3

	mov r3, r18
	mov r4, r19
	mov r5, r20
	mov r6, r21
	mov r7, r22
	mov r8, r23
	mov r9, r24

	mov r27, r25
	mov r18, r10
	mov r19, r11

	movw r20, r12
	movw r22, r14
	movw r24, r16

	ldi r26, 0
	call __cmpdi2_s8
	brlt .rltSigned

	mov r18, r3
	mov r19, r4
	mov r20, r5
	mov r21, r6
	mov r22, r7
	mov r23, r8
	mov r24, r9
	mov r25, r27

	ldd r10, Y+1
	ldd r11, Y+2
	ldd r12, Y+3
	ldd r13, Y+4
	ldd r14, Y+5
	ldd r15, Y+6
	ldd r16, Y+7
	ldd r17, Y+8
	call __cmpdi2
	brlt .ret1

.return:
	st Z, r3
	std Z+1, r4
	std Z+2, r5
	std Z+3, r6
	std Z+4, r7
	std Z+5, r8
	std Z+6, r9
	std Z+7, r27

	ldd r24, Z+15
	adiw r24, 0xF
	in __tmp_reg__, __SREG__
	cli

	out __SP_H__, r29
	out __SREG__, __tmp_reg__
	out __SP_L__, r28

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
	pop r3
	pop r2
	ret

.rltSigned:
	mov r18, r3
	mov r19, r4
	mov r20, r5
	mov r21, r6
	mov r22, r7
	mov r23, r8
	mov r24, r9
	mov r25, r27

	ldd r10, Y+1
	ldd r11, Y+2
	ldd r12, Y+3
	ldd r13, Y+4
	ldd r14, Y+5
	ldd r15, Y+6
	ldd r16, Y+7
	ldd r17, Y+8
	call __cmpdi2
	breq .return
	brlt .return

.ret1:
	ldi r24, lo8(1)
	std Y+15, r24
	rjmp .return





uadd_overflow:
	ldi r18, 0
	add r22, r24
	adc r23, r25

	cp r22, r24
	cpc r23, r25
	brlo .ret1

.return:
	movw r30, r20
	std Z+1, r23
	st Z, r22

	mov r24, r18
	ret

.ret1:
	ldi r18, lo8(1)
	rjmp .return





uaddl_overflow:
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17

	ldi r30, 0
	movw r12, r22
	movw r14, r24

	add r12, r18
	adc r13, r19
	adc r14, r20
	adc r15, r21

	cp r12, r22
	cpc r13, r23
	cpc r14, r24
	cpc r15, r25
	brlo .ret1

.return:
	movw r26, r16
	st X+, r12
	st X+, r13
	st X+, r14
	st X, r15
	sbiw r26, 3

	mov r24, r30
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	ret

.ret1:
	ldi r30, lo8(1)
	rjmp .return





uaddll_overflow:
	push r2
	push r3
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

	in r28, __SP_L__
	in r29, __SP_H__
	sbiw r28, 7
	in __tmp_reg__, __SREG__
	cli

	out __SP_H__, r29
	out __SREG__, __tmp_reg__
	out __SP_L__, r28

	movw r26, r18
	mov r7, r20
	mov r6, r21
	mov r5, r22
	mov r4, r23
	mov r3, r24
	mov r2, r25
	movw r30, r8

	std Y+7, __zero_reg__
	call __adddi3

	movw r8, r18
	std Y+1, r20
	std Y+2, r21
	std Y+3, r22
	std Y+4, r23
	std Y+5, r24
	std Y+6, r25

	movw r10, r26
	mov r12, r7
	mov r13, r6
	mov r14, r5
	mov r15, r4
	mov r16, r3
	mov r17, r2
	call __cmpdi2
	brlo .rlo

.return:
	st Z, r8
	std Z+1, r9
	ldd r24, Z+1
	std Z+2, r24
	ldd r24, Z+2
	std Z+3, r24
	ldd r24, Z+3
	std Z+4, r24
	ldd r24, Z+4
	std Z+5, r24
	ldd r24, Z+5
	std Z+6, r24
	ldd r24, Z+6
	std Z+7, r24
	ldd r24, Z+7

	adiw r28, 7
	in __tmp_reg__, __SREG__
	cli
	out __SP_H__, r29
	out __SREG__, __tmp_reg__
	out __SP_L__, r28

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
	pop r3
	pop r2
	ret

.rlo:
	ldi r24, lo8(1)
	std Y+7, r24
	rjmp .return
