.include "standard.inc"

	.text

START_FUNC __ror
	multiPush r12, r13, r14, r15, r16, r17
	mov32 r16, r18

	andi r16, 0x1F
	clr16 r17
	clr r19

	mov32 r12, r22
	mov r0, r16
	rjmp .l2

.l1:
	lsl32 r22

.l2:
	dec r16
	brpl .l1

	or32 r22, r12
	multiPop r17, r16, r15, r14, r13, r12
	ret
END_FUNC __ror





START_FUNC __rorll
	multiPush r12, r13, r14, r15, r16, r17
	mov r31, r18
	mov r30, r19

	movw r18, r16
	movw r16, r14

	andi r16, 0x3F
	clr16 r17
	clr r19
	ldi r26, 0x40

	mov r12, r26
	mov r13, __zero_reg__
	mov r14, __zero_reg__
	mov r15, __zero_reg__

	sub32 r12, r16
	mov r18, r31
	mov r19, r30
	mov r16, r12
	call __rotldi3

	multiPop r17, r16, r15, r14, r13, r12
	ret
END_FUNC __rorll





START_FUNC __rev16
	call __bswapsi2
	movw r18, r22
	movw r22, r24
	movw r24, r18
	ret
END_FUNC __rev16





START_FUNC __rev16ll
	multiPush r12, r13, r14, r15, r16, r17, r28, r29
	mov r27, r18
	mov r26, r19
	mov r31, r20
	mov r30, r21

	ldi r16, lo8(0x20)
	call __lshrdi3

	mov32 r22, r18
	call __bswapsi2

	mov32 r16, r22
	mov r22, r27
	mov r23, r26
	mov r24, r31
	mov r25, r30
	call __bswapsi2

	mov32 r12, r22
	movw r24, r16
	movw r16, r18
	mov32 r24, r16
	mov32 r18, r24

	ldi32 r22, 0
	ldi r16, 0x20
	call __ashldi3

	mov r29, r18
	mov r26, r19
	mov r31, r20
	movw r18, r12
	movw r14, r18
	movw r16, r12

	or r29, r16
	or r26, r17
	or r31, r18
	or r21, r19

	mov r18, r29
	mov r19, r26
	mov r20, r31

	multiPop r29, r28, r17, r16, r15, r14, r13, r12
	ret
