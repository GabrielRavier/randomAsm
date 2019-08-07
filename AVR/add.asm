	.text

__adddi3:
	add r18, r10
	adc r19, r11
	adc r20, r12
	adc r21, r13
	adc r22, r14
	adc r23, r15
	adc r24, r16
	adc r25, r17
	ret





__adddi3_s8:
	clr __tmp_reg__
	sbrc r26, 7
	com __tmp_reg__

	add r18, r26

	.irp reg, r19, r20, r21, r22, r23, r24, r25

		adc \reg, __tmp_reg__

	.endr

	ret
