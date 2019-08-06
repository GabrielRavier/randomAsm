.include "standard.inc"

	.text

_mulx_u64:
	multiPush r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r28, r29

	doSPProlog 0x30

	multiStdZR Y+17, Y+18, Y+19, Y+20, Y+21, Y+22, Y+23, Y+24
	std Y+25, r18
	std Y+26, r19
	std Y+27, r20
	std Y+28, r21
	std Y+29, r22
	std Y+30, r23
	std Y+31, r24
	std Y+32, r25

	multiStdZR Y+1, Y+2, Y+3, Y+4, Y+5, Y+6, Y+7, Y+8
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

	multiStdZR Y+1, Y+2, Y+3, Y+4, Y+5, Y+6, Y+7, Y+8
	ldi r24, lo8(64)
	std Y+9, r24
	multiStdZR Y+10, Y+11, Y+12, Y+13, Y+14, Y+15, Y+16

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

	doSPEpilog 0x30

	multiPop r29, r28, r17, r16, r15, r14, r13, r12, r11, r10, r9, r8
	ret





_mulx_u32:
	multiPush r16, r17, r28, r29
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

	multiPop r29, r28, r17, r16
	ret
