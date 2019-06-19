_mulx_u64:
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
	sbiw r28, 0x30
	in __tmp_reg__, __SREG__
	cli

	out __SP_H__, r29
	out __SREG__, __tmp_reg__
	out __SP_L__, r28

	std Y+17, __zero_reg__
	std Y+18, __zero_reg__
	std Y+19, __zero_reg__
	std Y+20, __zero_reg__
	std Y+21, __zero_reg__
	std Y+22, __zero_reg__
	std Y+23, __zero_reg__
	std Y+24, __zero_reg__
	std Y+25, r18
	std Y+26, r19
	std Y+27, r20
	std Y+28, r21
	std Y+29, r22
	std Y+30, r23
	std Y+31, r24
	std Y+32, r25

	std Y+1, __zero_reg__
	std Y+2, __zero_reg__
	std Y+3, __zero_reg__
	std Y+4, __zero_reg__
	std Y+5, __zero_reg__
	std Y+6, __zero_reg__
	std Y+7, __zero_reg__
	std Y+8, __zero_reg__
	std Y+9, r10
	std Y+10, r11
	std Y+11, r12
	std Y+12, r13
	std Y+13, r14
	std Y+14, r15
	std Y+15, r16
	std Y+16, r17

	movw r20, r28
	subi r20, -1
	sbci r21, -1

	movw r22, r28
	subi r22, -17
	sbci r23, -1

	movw r24, r28
	adiw r24, 0x21
	call uint128_t_operator_multiply

	std Y+1, __zero_reg__
	std Y+2, __zero_reg__
	std Y+3, __zero_reg__
	std Y+4, __zero_reg__
	std Y+5, __zero_reg__
	std Y+6, __zero_reg__
	std Y+7, __zero_reg__
	std Y+8, __zero_reg__
	ldi r24, lo8(64)
	std Y+9, r24
	std Y+10, __zero_reg__
	std Y+11, __zero_reg__
	std Y+12, __zero_reg__
	std Y+13, __zero_reg__
	std Y+14, __zero_reg__
	std Y+15, __zero_reg__
	std Y+16, __zero_reg__

	movw r20, r28
	subi r20, -1
	sbci r21, -1

	movw r22, r28
	subi r22, -0x21
	sbci r23, -1

	movw r24, r28
	adiw r24, 0x11
	rcall uint128_t_operator_shiftRight

	movw r24, r28
	adiw r24, 0x11
	rcall uint128_t_operator_cast_uint64_t

	movw r30, r8

	st Z, r18
	std Z+1, r19
	std Z+2, r20
	std Z+3, r21
	std Z+4, r22
	std Z+5, r23
	std Z+6, r24
	std Z+7, r25

	movw r24, r28
	adiw r24, 0x21
	rcall uint128_t_operator_cast_uint64_t

	adiw r28, 0x30
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
	ret





_mulx_u32:
	push r16
	push r17
	push r28
	push r29
	movw r28, r16

	call __umulsidi3
	mov r27, r18
	mov r26, r19
	mov r31, r20
	mov r30, r21

	ldi r16, lo8(32)
	call __lshrdi3
	st Y, r18
	std Y+1, r19
	std Y+2, r20
	std Y+3, r21

	mov r22, r27
	mov r23, r26
	mov r24, r31
	mov r25, r30

	pop r29
	pop r28
	pop r17
	pop r16
	ret
