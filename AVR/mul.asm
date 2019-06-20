__muldi3_6:
	call __umulhisi3

	add r20, r22
	adc r21, r23
	adc r28, r24
	adc r29, r25
	brcc .return

	adiw c6, 1

.return:
	ret





__mulsi3:
	movw r26, r22
	push r24
	push r25
	call __muluhisi3
	pop r27
	pop r26

	mul r26, r18
	add r24, r0
	adc r25, r1

	mul r26, b1
	add r25, r0
	mul r27, r18
	add r25, r0

	clr __zero_reg__
	ret





__muluhisi3:
	call __umulhisi3

	mul r26, r21
	add r25, r0
	mul r27, r20
	add r25, r0
	mul r26, r20
	add r24, r0
	adc r25, r1
	clr __zero_reg__
	ret
