.include "standard.inc"

	.text

_mulx_u64:
	multiPush r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r28, r29

	doSPProlog 0x30

	multiStdZR Y+17, Y+18, Y+19, Y+20, Y+21, Y+22, Y+23, Y+24
	st64 Y, 25, r18

	multiStdZR Y+1, Y+2, Y+3, Y+4, Y+5, Y+6, Y+7, Y+8
	st64 Y, 9, r10

	movw r20, r28
	subi16 r20, -1

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
	subi16 r20, -1

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

	st64 Z, 0, r18

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

	ldi r16, 0x20
	call __lshrdi3
	st32 Y, 0, r18

	mov r22, r27
	mov r23, r26
	mov r24, r31
	mov r25, r30

	multiPop r29, r28, r17, r16
	ret
