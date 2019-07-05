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
	adc r19, __tmp_reg__
	adc r20, __tmp_reg__
	adc r21, __tmp_reg__
	adc r22, __tmp_reg__
	adc r23, __tmp_reg__
	adc r24, __tmp_reg__
	adc r25, __tmp_reg__
	ret
