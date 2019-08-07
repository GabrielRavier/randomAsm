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

	st64 Y, 1, r18

	ld32 r24, Y, 1
	ldi r20, lo8(1)
	ldi r21, 0
	sbiw r24, 0
	multiCpcZR r26, r27
	breq .skip0

	ldi016 r20

.skip0:
	multiNeg r21, r20
	sbc r21, __zero_reg__

	movw r16, r20
	mov __tmp_reg__, r21
	lsl r0
	multiSbc r18, r19

	ld32 r12, Y, 5
	and32 r12, r16
	com32 r16
	and32 r24, r16
	mov32 r22, r24
	or32 r22, r12
	call __ctzsi2

	andi r20, 0x20
	clr r21
	mov __tmp_reg__, r21

	lsl r0
	multiSbc r22, r23
	mov __tmp_reg__, r25

	lsl r0
	multiSbc r26, r27

	mov32 r16, r20
	add32 r16, r24
	mov32 r22, r16

	doSPEpilog 8

	multiPop r29, r28, r17, r16, r15, r14, r13, r12
	ret
