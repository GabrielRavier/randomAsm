.include "standard.inc"

	.text

START_FUNC __rold
	r3 = r2
	r3 &= 0x1F

	r0 = r1
	r0 <<= r3

	r2 = -r2
	r2 &= 0x1F
	to32 r1
	r0 |= r1
	exit
END_FUNC __rold





START_FUNC __rord
	r0 = r1
	to32 r1

	r3 = r2
	r3 &= 0x1F
	r1 >>= r3

	r2 = -r2
	r2 &= 0x1F
	r0 <<= r2
	r0 |= r1
	exit
END_FUNC __rord





START_FUNC __rolq
	r3 = r2
	r3 &= 0x3F

	r0 = r1
	r0 <<= r3

	r2 = -r2
	r2 &= 0x3F
!	r1 >>= r2
	r0 |= r1
	exit
END_FUNC __rolq





START_FUNC __rorq
	r3 = r2
	r3 &= 0x3F

	r0 = r1
	r0 >>= r3

	r2 = -r2
	r2 &= 0x3F
	r1 <<= r2
	r0 |= r1
	exit
END_FUNC __rorq
