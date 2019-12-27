.include "standard.inc"

	.text

START_FUNC fabsf
	r0 = r1
	r0 &= 0x7FFFFFFF
	exit
END_FUNC fabsf





START_FUNC fabsl
	r0 = r1
	r1 = 0x7FFFFFFFFFFFFFFF ll
	r0 &= r1
	exit
END_FUNC fabsl





