.include "standard.inc"

	.text

START_FUNC signbitf
	r0 = r1
	r1 = 0x80000000 ll
	r0 &= r1
	r0 >>= 0x1F
	exit
END_FUNC signbitf





START_FUNC signbitl
START_FUNC signbit
	r0 = r1
	r0 >>= 0x3F
	exit
END_FUNC signbitl
END_FUNC signbit
