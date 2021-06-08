.include "standard.inc"

	.text

START_FUNC _mulx_u64
	r6 = r3
	*(u64 *)(r10 - 0x28) = r1
	r8 = 0
	*(u64 *)(r10 - 0x30) = r8
	*(u64 *)(r10 - 8) = r2
	*(u64 *)(r10 - 0x10) = r8

	r7 = r10
	r7 += -0x20

	r2 = r10
	r2 += -0x30

	r3 = r10
	r3 += -0x10

	r1 = r7
	call uint128_t_operator_multiply

	r1 = 0x40
	*(u64 *)(r10 - 8) = r1
	*(u64 *)(r10 - 0x10) = r8

	r8 = r10
	r8 += -0x30

	r3 = r01
	r3 += -0x10
	r1 = r8
	r2 = r7
	call uint128_t_operator_shiftRight

	r1 = r8
	call uint128_t_operator_cast_uint64_t

	*(u64 *)(r6) = r0
	r1 = r7
	call uint128_t_operator_cast_uint64_t
	exit
END_FUNC _mulx_u64





START_FUNC _mulx_u32
	r0 = r2
	to32 r1
	to32 r0
	r0 *= r1

	r1 = r0
	r1 >>= 0x20
	*(u32 *)(r3) = r1
	exit
END_FUNC _mulx_u32
