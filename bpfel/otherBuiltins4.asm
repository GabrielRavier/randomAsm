.include "standard.inc"

	.text

START_FUNC abs
	r0 = r1
	r0 <<= 0x20
	r1 = r0
	r1 s>>= 0x3F
	r0 s>>= 0x20
	r0 += r1
	r0 ^= r1
	exit
END_FUNC abs





START_FUNC fabs
	r0 = r1
	r1 = 0x7FFFFFFFFFFFFFFF ll
	r0 &= r1
	exit
END_FUNC fabs





START_FUNC labs
	r0 = r1
	r1 s>>= 0x3F
	r0 += r1
	r0 ^= r1
	exit
END_FUNC labs
