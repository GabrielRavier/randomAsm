.include "standard.inc"

	.text

__umulhisi3:
	mul a0, b0
	movw c0, r0
	mul a1, b1
	movw c2, r0
	mul a0, b1

	add c1, r0
	adc c2, r1
	clr __zero_reg__
	adc c3, __zero_reg__

	mul a1, b0

	add c1, r0
	adc c2, r1
	clr __zero_reg__
	adc c3, __zero_reg__
	ret





__umulsidi3:
	clt

__umulsidi3_helper:
	multiPush r29, r28
	movw r30, r24

	movw r26, r22
	call __umulhisi3

	multiPush r23, r22
	movw r28, r18
	movw r19, r24

	multiPush r27, r26, r19, r18

	movw r26, r30
	call __umulhisi3
	brtc .noSub

	sub r22, r28
	sbc r23, r29
	sbc r24, r18
	sbc r25, r19

.noSub:
	movw r18, r28
	movw r28, r22
	movw r30, r24

	call __muldi3_6

	multiPop r26, r27, r18, r19

	call __muldi3_6

	movw r22, r28
	movw r24, r30
	movw r30, r18

	multiPop r18, r19, r28, r29
	ret
