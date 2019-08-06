.include "standard.inc"

	.text

__negdi2:
	multiCom r22, r23, r24, r25, r19, r20, r21

	neg r18
	multiSbciMin1 r19, r20, r21, r22, r23, r24, r25

	ret
