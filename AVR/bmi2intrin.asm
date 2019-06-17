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
	subi r28, lo8(80)
	sbci r29, hi8(80)
	in __tmp_reg__, __SREG__
	cli

	out __SP_H__, r29
	out __SREG__, __tmp_reg__
	out __SP_L__, r28

	std Y+49, __zero_reg__
	std Y+50, __zero_reg__
	std Y+51, __zero_reg__
	std Y+52, __zero_reg__
	std Y+53, __zero_reg__
	std Y+54, __zero_reg__
	std Y+55, __zero_reg__
	std Y+56, __zero_reg__
	std Y+57, r18
	std Y+58, r19
	std Y+59, r20
	std Y+60, r21
	std Y+61, r22
	std Y+62, r23
	std Y+63, r24

	adiw r28, 64-63
	std Y+63, r25
	sbiw r28, 64-63

	std Y+17, __zero_reg__
	std Y+18, __zero_reg__
	std Y+19, __zero_reg__
	std Y+20, __zero_reg__
	std Y+21, __zero_reg__
	std Y+22, __zero_reg__
	std Y+23, __zero_reg__
	std Y+24, __zero_reg__
	std Y+25, r10
	std Y+26, r11
	std Y+27, r12
	std Y+28, r13
	std Y+29, r14
	std Y+30, r15
	std Y+31, r16
	std Y+32, r17

	mov r24, r28
	mov r25, r29
	subi r24, lo8(-65)
	sbci r25, hi8(-65)

	mov r22, r28
	mov r23, r29
	subi r22, lo8(-49)
	sbci r23, hi8(-49)

	mov r20, r28
	mov r21, r29
	subi r20, lo8(-17)
	sbci r21, hi8(-17)
	rcall uint128_t_operator_multiply

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

	mov r24, r28
	mov r25, r29
	adiw r24, 33
	mov r22, r28
	mov r23, r29

	subi r22,lo8(-65))
	sbci r23,hi8(-65)

	mov r20,r28
	mov r21,r29

	subi r20,lo8(-1)
	sbci r21,hi8(-1)
	rcall uint128_t_operator_shiftRight

	mov r24, r28
	mov r25, r29
	adiw r24, 33
	rcall uint128_t_operator_cast_uint64_t

	mov r30, r8
	mov r31, r9

	st Z, r18
	std Z+1, r19
	std Z+2, r20
	std Z+3, r21
	std Z+4, r22
	std Z+5, r23
	std Z+6, r24
	std Z+7, r25

	mov r24, r28
	mov r25, r29

	subi r24, lo8(-65)
	sbci r25, hi8(-65)
	rcall uint128_t_operator_cast_uint64_t

	subi r28,lo8(-80)
	sbci r29,hi8(-80)

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
	sbiw r28, 10
	in __tmp_reg__, __SREG__
	cli

	out __SP_H__, r29
	out __SREG__, __tmp_reg__
	out __SP_L__, r28

	mov r12, r22
	mov r13, r23
	mov r14, r24
	mov r15, r25

	std Y+2, r17
	std Y+1, r16

	mov r16, r18
	mov r17, r19
	mov r18, r20
	mov r19, r21

	ldi r20, lo8(0)
	ldi r21, hi8(0)
	ldi r22, hlo8(0)
	ldi r23, hhi8(0)

	std Y+3, r16
	std Y+4, r17
	std Y+5, r18
	std Y+6, r19
	std Y+7, r20
	std Y+8, r21
	std Y+9, r22
	std Y+10, r23

	mov r2, r12
	mov r3, r13
	mov r4, r14
	mov r5, r15
	mov r18, r16
	mov r19, r17

	ldd r20, Y+5
	ldd r21, Y+6
	ldi r22, lo8(0)
	ldi r23, lo8(0)
	ldi r24, lo8(0)
	ldi r25, lo8(0)

	mov r10, r12
	mov r11, r3
	mov r12, r4
	mov r13, r5

	clr r14
	clr r15

	ldi r16, lo8(0)
	ldi r17, lo8(0)
	rcall __muldi3

	mov r12, r18
	mov r15, r19
	mov r17, r20
	mov r2, r21

	ldi r16, lo8(32)
	rcall __lshrdi3

	ldd r30, Y+1
	ldd r31, Y+2

	st Z, r18
	std Z+1, r19
	std Z+2, r20
	std Z+3, r21

	mov r22, r12
	mov r23, r15
	mov r24, r17
	mov r25, r2

	adiw r28, 10
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
