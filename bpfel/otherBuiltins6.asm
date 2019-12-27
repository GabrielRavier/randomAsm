.include "standard.inc"

	.text

START_FUNC popcount
	to32 r1
	r2 = r1
	r2 >>= 1
	r2 &= 0x55555555
	r1 -= r2

	r2 = 0x3333333333333333 ll
	r0 = r1
	r0 &= r2
	r1 >>= 2
	r0 += r1

	r1 = r0
	r1 >>= 4
	r0 += r1

	r1 = 0xF0F0F0F0F0F0F0F ll
	r0 &= r1

	r1 = 0x101010101010101 ll
	r0 *= r1
	r0 >>= 0x38
	exit
END_FUNC popcount





START_FUNC parity
	to32 r1
	r2 = r1
	r2 >>= 1
	r2 &= 0x55555555
	r1 -= r2

	r2 = 0x3333333333333333 ll
	r0 = r1
	r0 &= r2
	r1 >>= 2
	r0 += r1

	r1 = r0
	r1 >>= 4
	r0 += r1

	r1 = 0xF0F0F0F0F0F0F0F ll
	r0 &= r1

	r1 = 0x101010101010101 ll
	r0 *= r1
	r0 >>= 0x38
	r0 &= 1
	exit
END_FUNC parity





START_FUNC popcountl
START_FUNC popcountll
	r2 = r1
	r2 >>= 1

	r3 = 0x5555555555555555 ll
	r2 &= r3
	r1 -= r2

	r2 = 0x3333333333333333 ll
	r0 = r1
	r0 &= r2
	r1 >>= 2
	r1 &= r2
	r0 += r1

	r1 = r0
	r1 >>= 4
	r0 += r1

	r1 = 0xF0F0F0F0F0F0F0F ll
	r0 &= r1

	r1 = 0x101010101010101 ll
	r0 *= r1
	r0 >>= 0x38
	exit
END_FUNC popcountl
END_FUNC popcountll





START_FUNC parityl
START_FUNC parityll
	r2 = r1
	r2 >>= 1

	r3 = 0x5555555555555555 ll
	r2 &= r3
	r1 -= r2

	r2 = 0x3333333333333333 ll
	r0 = r1
	r0 &= r2
	r1 >>= 2
	r1 &= r2
	r0 += r1

	r1 = r0
	r1 >>= 4
	r0 += r1

	r1 = 0xF0F0F0F0F0F0F0F ll
	r0 &= r1

	r1 = 0x101010101010101 ll
	r0 *= r1
	r0 >>= 0x38
	r0 &= 1
	exit
END_FUNC parityl
END_FUNC parityll
