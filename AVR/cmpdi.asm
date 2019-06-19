__cmpdi2:
	cp r18, r10
	cpc r19, r11
	cpc r20, r12
	cpc r21, r13
	cpc r22, r14
	cpc r23, r15
	cpc r24, r16
	cpc r25, r17
	ret





__cmpdi2_s8:
	clt __tmp_reg__
	sbrc r26, 7

	com __tmp_reg__
	cp a0, r26
	cpc a1, __tmp_reg__
	cpc a2, __tmp_reg__
	cpc a3, __tmp_reg__
	cpc a4, __tmp_reg__
	cpc a5, __tmp_reg__
	cpc a6, __tmp_reg__
	cpc a7, __tmp_reg__
	ret
