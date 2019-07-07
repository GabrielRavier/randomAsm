	.bss

uint128_0:
	.zero 16

	.data

uint128_1:
	.quad 0, 1

	.text

uint128_t_constructor_default:
	pushm.w #1, r4
	mov.w r1, r4

	mov.w #0, @r12
	mov.w #0, 2(r12)
	mov.w #0, 4(r12)
	mov.w #0, 6(r12)
	mov.w #0, 8(r12)
	mov.w #0, 10(r12)
	mov.w #0, 12(r12)
	mov.w #0, 14(r12)

	popm.w #1, r4
	ret





uint128_t_constructor:
uint128_t_operator_equal:
	pushm.w #1, r4
	mov.w r1, r4

	mov.w 2(r13), r11
	mov.w 4(r13), r15
	mov.w 6(r13), r14

	mov.w @r13, @r12
	mov.w r11, 2(r12)
	mov.w r15, 4(r12)
	mov.w r14, 6(r12)

	mov.w 10(r13), r11
	mov.w 12(r13), r15
	mov.w 14(r13), r14

	mov.w 8(r13), 8(r12)
	mov.w r11, 10(r12)
	mov.w r15, 12(r12)
	mov.w r14, 14(r12)

	popm.w #1, r4
	ret





uint128_t_constructor_uint128_t_double_ref:
	pushm.w #1, r4
	mov.w r1, r4

	mov.w 2(r13), r11
	mov.w 4(r13), r15
	mov.w 6(r13), r14

	mov.w @r13, @r12
	mov.w r11, 2(r12)
	mov.w r15, 4(r12)
	mov.w r14, 6(r12)

	mov.w 10(r13), r11
	mov.w 12(r13), r15
	mov.w 14(r13), r14

	mov.w 8(r13), 8(r12)
	mov.w r11, 10(r12)
	mov.w r15, 12(r12)
	mov.w r14, 14(r12)

	cmp.w r13, r12
	jeq .return

	mov.w #0, @r13
	mov.w #0, 2(r13)
	mov.w #0, 4(r13)
	mov.w #0, 6(r13)
	mov.w #0, 8(r13)
	mov.w #0, 10(r13)
	mov.w #0, 12(r13)
	mov.w #0, 14(r13)

.return:
	popm.w #1, r4
	ret





uint128_t_operator_equal_const_uint128_t_double_ref:
	pushm.w #1, r4
	mov.w r1, r4

	cmp.w r13, r12
	jeq .return

	mov.w 2(r13), r11
	mov.w 4(r13), r15
	mov.w 6(r13), r14

	mov @r13, @r12
	mov.w r11, 2(r12)
	mov.w r15, 4(r12)
	mov.w r14, 6(r12)

	mov.w 10(r13), r11
	mov.w 12(r13), r15
	mov.w 14(r13), r14

	mov.w 8(r13), 8(r12)
	mov.w r11, 10(r12)
	mov.w r15, 12(r12)
	mov.w r14, 14(r12)

	mov.w #0, @r13
	mov.w #0, 2(r13)
	mov.w #0, 4(r13)
	mov.w #0, 6(r13)
	mov.w #0, 8(r13)
	mov.w #0, 10(r13)
	mov.w #0, 12(r13)
	mov.w #0, 14(r13)

.return:
	popm.w #1, r4
	ret





uint128_t_operator_cast_bool:





uint128_t_operator_cast_uint8_t:





uint128_t_operator_cast_uint16_t:





uint128_t_operator_cast_uint32_t:





uint128_t_operator_cast_uint64_t:





uint128_t_operator_and:





uint128_t_operator_and_equal:





uint128_t_operator_or:





uint128_t_operator_or_equal:





uint128_t_operator_xor:





uint128_t_operator_xor_equal:





uint128_t_operator_not:





uint128_t_operator_shiftLeft:





uint128_t_operator_shiftLeft_equal:





uint128_t_operator_shiftRight:





uint128_t_operator_shiftRight_equal:





uint128_t_operator_exclamation_mark:





uint128_t_operator_and_and:





uint128_t_operator_or_or:





uint128_t_operator_equal_equal:





uint128_t_operator_not_equal:





uint128_t_operator_above:





uint128_t_operator_below:





uint128_t_operator_above_equal:





uint128_t_operator_below_equal:





uint128_t_operator_plus:





uint128_t_operator_plus_equal:





uint128_t_operator_minus:





uint128_t_operator_minus_equal:





uint128_t_operator_multiply:





uint128_t_operator_multiply_equal:





uint128_t_divmod:





uint128_t_operator_divide:





uint128_t_operator_divide_equal:





uint128_t_operator_modulo:





uint128_t_operator_modulo_equal:





uint128_t_operator_plus_plus:





uint128_t_operator_plus_plus_int:





uint128_t_operator_minus_minus:





uint128_t_operator_minus_minus_int:





uint128_t_operator_single_plus:





uint128_t_operator_single_minus:





uint128_t_upper:





uint128_t_lower:





uint128_t_bits:
