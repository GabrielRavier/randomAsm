.include "standard.inc"

	.text

START_FUNC cimagf
	r0 = *(u32 *)(r1 + 4)
	exit
END_FUNC cimagf





START_FUNC cimagl
START_FUNC cimag
	r0 = *(u64 *)(r1 + 8)
	exit
END_FUNC cimagl
END_FUNC cimag





START_FUNC copysignf
	r0 = r1
	r2 &= 0x80000000
	r0 &= 0x7FFFFFFF
	r0 |= r2
	exit
END_FUNC copysignf





START_FUNC copysignl
START_FUNC copysign
	r0 = r1
	r1 = -0x8000000000000000 ll
	r2 &= r1
	r1 = 0x7FFFFFFFFFFFFFFF ll
	r0 &= r1
	r0 |= r2
	exit
END_FUNC copysignl
END_FUNC copysign





START_FUNC crealf
	r0 = *(u32 *)(r1)
	exit
END_FUNC crealf





START_FUNC creall
START_FUNC creal
	r0 = *(u64 *)(r1)
	exit
END_FUNC creall
END_FUNC creal





START_FUNC llabs
	r0 = r1
	r1 s>>= 0x3F
	r0 += r1
	r0 ^= r1
	exit
END_FUNC llabs
