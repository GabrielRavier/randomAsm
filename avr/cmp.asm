.include "standard.inc"

	.text

__cmpdi2:
	cmp64 r18, r10
	ret





__cmpdi2_s8:
	clt __tmp_reg__
	sbrc r26, 7

	com __tmp_reg__
	cp r18, r26
	multiCpcSameReg __tmp_reg__, r19, r20, r21, r22, r23, r24, r25
	ret
