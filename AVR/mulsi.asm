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
