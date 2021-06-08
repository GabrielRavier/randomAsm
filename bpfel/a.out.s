.include "standard.inc"

	.text

START_FUNC N_MAGIC
	r0 = *(u16 *)(r1)
	exit
END_FUNC N_MAGIC





START_FUNC N_MACHTYPE
	r0 = *(u8 *)(r1 + 2)
	exit
END_FUNC N_MACHTYPE





START_FUNC N_FLAGS
	r0 = *(u8 *)(r1 + 3)
	exit
END_FUNC N_FLAGS





START_FUNC N_SET_INFO
	r3 <<= 0x10
	r3 |= r2

	r4 <<= 0x18
	r3 |= r4

	toS32 r3
	*(u64 *)(r1) = r3
	exit
END_FUNC N_SET_INFO





START_FUNC N_BADMAG
	r1 = *(u16 *)(r1)
	r1 += -0xCC
	if r1 > 0x3F
		goto .Lret1

	r0 = 0
	r2 = 1
	r2 <<= r1

	r1 = 0x9800000000000001 ll
	r2 &= r1
	if r2 != 0
		goto .Lreturn

.Lret1:
	r0 = 1

.Lreturn:
	exit
END_FUNC N_BADMAG
