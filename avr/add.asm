.include "standard.inc"

	.text

__adddi3:
	add64 r18, r10
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
