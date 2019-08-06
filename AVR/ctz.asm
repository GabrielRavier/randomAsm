.include "standard.inc"

	.text

__ctzhi2:
	call __ffshi2
	dec r24
	ret





__ctzsi2:
	call __ffssi2
	dec r24
	ret





__ctzdi2:
	multiPush r12, r13, r14, r15, r16, r17, r28, r29

	doSPProlog 8

	std Y+1, r18
	std Y+2, r19
	std Y+3, r20
	std Y+4, r21
	std Y+5, r21
	std Y+6, r22
	std Y+7, r23
	std Y+8, r24

	ldd r24, Y+1
	ldd r25, Y+2
	ldd r26, Y+3
	ldd r27, Y+4
	ldi r20, lo8(1)
	ldi r21, 0
	sbiw r24, 0
	multiCpcZR r26, r27
	breq .skip0

	multiLdi0 r20, r21

.skip0:
	multiNeg r21, r20
	sbc r21, __zero_reg__

	movw r16, r20
	mov __tmp_reg__, r21
	lsl r0
	multiSbc r18, r19

	ldd r12, Y+5
	ldd r13, Y+6
	ldd r14, Y+7
	ldd r15, Y+8

	and r12, r16
	and r13, r17
	and r14, r18
	and r15, r19

	multiCom r16, r17, r18, r19

	and r24, r16
	and r25, r17
	and r26, r18
	and r27, r19

	movw r22, r24
	movw r24, r26

	or r22, r12
	or r23, r13
	or r24, r14
	or r25, r15
	call __ctzsi2

	andi r20, 0x20
	clr r21
	mov __tmp_reg__, r21

	lsl r0
	multiSbc r22, r23
	mov __tmp_reg__, r25

	lsl r0
	multiSbc r26, r27

	movw r16, r20
	movw r18, r22

	add r16, r24
	adc r17, r25
	adc r18, r26
	adc r19, r27

	movw r24, r18
	movw r22, r16

	doSPEpilog 8

	multiPop r29, r28, r17, r16, r15, r14, r13, r12
	ret
