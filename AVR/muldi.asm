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
