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
