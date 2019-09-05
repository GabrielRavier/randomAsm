.include "standard.inc"

	.text

START_FUNC uint128_t_constructor_default
	*(u64 *)(r1 + 8) = r2
	*(u64 *)(r1) = r2
	exit
END_FUNC uint128_t_constructor_default





START_FUNC uint128_t_constructor
START_FUNC uint128_t_operator_equal
	r3 = *(u64 *)(r2)
	*(u64 *)(r1) = r3
	r2 = *(u64 *)(r2 + 8)
	*(u64 *)(r1 + 8) = r2
	exit
END_FUNC uint128_t_constructor
END_FUNC uint128_t_operator_equal





START_FUNC uint128_t_constructor_uint128_t_double_ref
	r3 = *(u64 *)(r2)
	*(u64 *)(r1) = r3
	r3 = *(u64 *)(r2 + 8)
	*(u64 *)(r1 + 8) = r3

	if r1 == r2
		goto .return

	r1 = 0
	*(u64 *)(r2 + 8) = r1
	*(u64 *)(r2) = r1

.return:
	exit





START_FUNC uint128_t_operator_equal_const_uint128_t_double_ref
	r0 = r1
	if r0 == r2
		goto .return

	r1 = *(u64 *)(r2)
	*(u64 *)(r0) = r1
	r1 = *(u64 *)(r2 + 8)
	*(u64 *)(r0 + 8) = r1
	r1 = 0
	*(u64 *)(r2 + 8) = r1
	*(u64 *)(r2 + 0) = r1

.return:
	exit
END_FUNC uint128_t_operator_equal_const_uint128_t_double_ref





START_FUNC uint128_t_operator_cast_bool
	r2 = *(u64 *)(r1)
	r1 = *(u64 *)(r1 + 8)
	r1 |= r2
	r0 = 1
	if r1 != 0
		goto .ret1

	r0 = 0

.ret1:
	exit
END_FUNC uint128_t_operator_cast_bool





START_FUNC uint128_t_operator_cast_uint8_t
	r0 = *(u8 *)(r1 + 8)
	exit
END_FUNC uint128_t_operator_cast_uint8_t





START_FUNC uint128_t_operator_cast_uint16_t
	r0 = *(u16 *)(r1 + 8)
	exit
END_FUNC uint128_t_operator_cast_uint16_t





START_FUNC uint128_t_operator_cast_uint32_t
	r0 = *(u64 *)(r1 + 8)
	exit
END_FUNC uint128_t_operator_cast_uint32_t





START_FUNC uint128_t_operator_cast_uint64_t
	r0 = *(u64 *)(r1 + 8)
	exit
END_FUNC uint128_t_operator_cast_uint64_t
