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
	push r29
	push r28
	wmov r30, r24

	wmov r26, r22
	call __umulhisi3

	push r23
	push r22
	wmov r28, r18
	wmov r19, r24

	push r27
	push r26
	push r19
	push r18

	wmov r26, r30
	call __umulhisi3
	brtc .noSub

	sub r22, r28
	sbc r23, r29
	sbc r24, r18
	sbc r25, r19

.noSub:
	wmov r18, r28
	wmov r28, r22
	wmov r30, r24

	call __muldi3_6

	pop r26
	pop r27
	pop r18
	pop r19

	call __muldi3_6

	wmov r22, r28
	wmov r24, r30
	wmov r30, r18
	pop r18
	pop r19

	pop r28
	pop r29
	ret
