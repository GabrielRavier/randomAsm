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
