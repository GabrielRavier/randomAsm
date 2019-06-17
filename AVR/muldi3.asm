__muldi3:
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
	sbiw r28, 24
	in __tmp_reg__, __SREG__
	cli
	out __SP_H__, r29
	out __SREG__, __tmp_reg__
	out __SP_L__, r28

	std Y+17, r18
	std Y+18, r19
	std Y+19, r20
	std Y+20, r21
	std Y+21, r22
	std Y+22, r23
	std Y+23, r24
	std Y+24, r25

	std Y+9, r10
	std Y+10, r11
	std Y+11, r12
	std Y+12, r13
	std Y+13, r14
	std Y+14, r15
	std Y+15, r16
	std Y+16, r17

	ldd r4, Y+17
	ldd r5, Y+18
	ldd r6, Y+19
	ldd r7, Y+20
	ldd r8, Y+9
	ldd r9, Y+10
	ldd r10, Y+11
	ldd r11, Y+12

	mov r25, r7
	mov r24, r6
	mov r23, r5
	mov r22, r4

	mov r21, r11
	mov r20, r10
	mov r19, r9
	mov r18, r8
	rcall __muldsi3

	mov r14, r18
	mov r15, r19
	mov r16, r20
	mov r17, r21
	std Y+5, r22
	std Y+6, r23
	std Y+7, r24
	std Y+8, r25

	mov r25, r11
	mov r24, r10
	mov r23, r9
	mov r22, r8
	ldd r18, Y+21
	ldd r19, Y+22
	ldd r20, Y+23
	ldd r21, Y+24
	rcall __mulsi3

	mov r8, r22
	mov r9, r23
	mov r10, r24
	mov r11, r25
	mov r25, r7
	mov r24, r6
	mov r23, r5
	mov r22, r4
	ldd r18, Y+13
	ldd r19, Y+14
	ldd r20, Y+15
	ldd r21, Y+16
	rcall __mulsi3

	mov r27, r25
	mov r26, r24
	mov r25, r23
	mov r24, r22

	add r24, r8
	adc r25, r9
	adc r26, r10
	adc r27, r11

	ldd r20, Y+5
	ldd r21, Y+6
	ldd r22, Y+7
	ldd r23, Y+8

	add r20, r24
	adc r21, r25
	adc r22, r26
	adc r23, r27

	std Y+5, r20
	std Y+6, r21
	std Y+7, r22
	std Y+8, r23

	mov r22, r20
	ldd r23, Y+6
	mov r18, r14
	mov r19, r15
	mov r20, r16
	mov r21, r17
	ldd r24, Y+7
	ldd r25, Y+8

	adiw r28,24
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
	ret





__muldsi3:
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
	push r17
	push r28
	push r29

	in r28, __SP_L__
	in r29, __SP_H__
	sbiw r28, 24
	in __tmp_reg__, __SREG__
	cli
	out __SP_H__, r29
	out __SREG__, __tmp_reg__
	out __SP_L__, r28

	mov r8, r22
	mov r9, r23
	mov r10, r24
	mov r11, r25

	std Y+21, r18
	std Y+22, r19
	std Y+23, r20
	std Y+24, r21

	mov r18, r22
	mov r19, r23
	mov r20, r24
	mov r21, r25

	andi r20,hlo8(0xFFFF)
	andi r21,hhi8(0xFFFF)

	std Y+13, r18
	std Y+14, r19
	std Y+15, r20
	std Y+16, r21

	ldd r4, Y+21
	ldd r5, Y+22
	ldd r6, Y+23
	ldd r7, Y+24

	ldi r24,lo8(0xFFFF)
	ldi r25,hi8(0xFFFF)
	ldi r26,hlo8(0xFFFF)
	ldi r27,hhi8(0xFFFF)

	and r4, r24
	and r5, r25
	and r6, r26
	and r7, r27

	mov r25, r7
	mov r24, r6
	mov r23, r5
	mov r22, r4
	rcall __mulsi3

	std Y+9, r22
	std Y+10, r23
	std Y+11, r24
	std Y+12, r25

	ldd r18, Y+9
	ldd r19, Y+10
	ldd r20, Y+11
	ldd r21, Y+12

	mov r13, r21
	mov r12, r20
	clr r14
	clr r15

	mov r25, r11
	mov r24, r10
	clr r26
	clr r27

	std Y+17, r24
	std Y+18, r25
	std Y+19, r26
	std Y+20, r27

	mov r25, r7
	mov r24, r6
	mov r23, r5
	mov r22, r4

	ldd r18, Y+17
	ldd r19, Y+18
	ldd r20, Y+19
	ldd r21, Y+20
	rcall __mulsi3

	mov r27, r25
	mov r26, r24
	mov r25, r23
	mov r24, r22

	add r12, r24
	adc r13, r25
	adc r14, r26
	adc r15, r27

	mov r26, r12
	mov r27, r13
	clr r25
	clr r24

	ldd r20, Y+9
	ldd r21, Y+10
	ldd r22, Y+11
	ldd r23, Y+12

	andi r22,hlo8(0xFFFF)
	andi r23,hhi8(0xFFFF)

	add r24, r20
	adc r25, r21
	adc r26, r22
	adc r27, r23

	mov r9, r27
	mov r8, r26
	clr r10
	clr r11

	mov r18, r24
	mov r19, r25
	mov r20, r26
	mov r21, r27
	andi r20,hlo8(0xFFFF)
	andi r21,hhi8(0xFFFF)

	std Y+9, r18
	std Y+10, r19
	std Y+11, r20
	std Y+12, r21

	ldd r24, Y+21
	ldd r25, Y+22
	ldd r26, Y+23
	ldd r27, Y+24

	mov r5, r27
	mov r4, r26
	clr r6
	clr r7

	mov r25, r7
	mov r24, r6
	mov r23, r5
	mov r22, r4

	ldd r18, Y+13
	ldd r19, Y+14
	ldd r20, Y+15
	ldd r21, Y+16
	rcall __mulsi3

	mov r27, r25
	mov r26, r24
	mov r25, r23
	mov r24, r22

	add r8, r24
	adc r9, r25
	adc r10, r26
	adc r11, r27

	mov r26, r8
	mov r27, r9
	clr r25
	clr r24

	ldd r18, Y+9
	ldd r19, Y+10
	ldd r20, Y+11
	ldd r21, Y+12

	add r24, r18
	adc r25, r19
	adc r26, r20
	adc r27, r21

	mov r17, r24
	std Y+1, r24
	std Y+2, r25
	std Y+3, r26
	std Y+4, r27

	mov r13, r15
	mov r12, r14
	clr r14
	clr r15

	mov r25, r7
	mov r24, r6
	mov r23, r5
	mov r22, r4

	ldd r18, Y+17
	ldd r19, Y+18
	ldd r20, Y+19
	ldd r21, Y+20
	rcall __mulsi3

	mov r27, r25
	mov r26, r24
	mov r25, r23
	mov r24, r22

	add r24, r12
	adc r25, r13
	adc r26, r14
	adc r27, r15

	mov r9, r11
	mov r8, r10
	clr r10
	clr r11

	add r24, r8
	adc r25, r9
	adc r26, r10
	adc r27, r11

	std Y+5, r24
	std Y+6, r25
	std Y+7, r26
	std Y+8, r27

	mov r18, r17
	ldd r19, Y+2
	ldd r20, Y+3
	ldd r21, Y+4
	mov r22, r24
	ldd r23, Y+6
	ldd r24, Y+7
	ldd r25, Y+8

	adiw r28, 24
	in __tmp_reg__, __SREG__
	cli
	out __SP_H__, r29
	out __SREG__, __tmp_reg__
	out __SP_L__, r28

	pop r29
	pop r28
	pop r17
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
