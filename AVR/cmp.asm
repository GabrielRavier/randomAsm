.include "standard.inc"

	.text

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
	cp r18, r26
	multiCpcSameReg __tmp_reg__, r19, r20, r21, r22, r23, r24, r25
	ret
