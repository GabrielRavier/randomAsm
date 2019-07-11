	.bss

uint128_0:
	.zero 16

	.data

uint128_1:
	.quad 0, 1

	.text

uint128_t_constructor_default:
	li 10, 0
	stw 10, 0(3)
	stw 10, 4(3)
	stw 10, 8(3)
	stw 10, 12(3)
	blr





uint128_t_constructor:
uint128_t_operator_equal:
	lxvd2x 0, 4
	stxvd2x 0, 3
	blr





uint128_t_constructor_uint128_t_double_ref:
	lwz 10, 0(4)
	lwz 11, 4(4)
	cmplw 7, 3, 4
	stw 10, 0(3)
	stw 11, 4(3)

	lwz 10, 8(4)
	lwz 11, 12(4)
	stw 10, 8(3)
	stw 11, 12(3)
	beqlr 7

	li 10, 0
	stw 10, 0(4)
	stw 10, 4(4)
	stw 10, 8(4)
	stw 10, 12(4)
	blr





uint128_t_operator_equal_const_uint128_t_double_ref:
	cmplw 7, 3, 4
	beqlr 7

	lwz 8, 0(4)
	lwz 9, 4(4)
	li 10, 0
	stw 8, 0(3)
	stw 9, 4(3)

	lwz 8, 8(4)
	lwz 9, 12(4)
	stw 8, 8(3)
	stw 9, 12(3)

	stw 10, 0(4)
	stw 10, 4(4)
	stw 10, 8(4)
	stw 10, 12(4)
	blr





uint128_t_operator_cast_bool:
	lwz 7, 8(3)
	lwz 9, 12(3)
	lwz 10, 0(3)
	lwz 8, 4(3)

	or 10, 7, 10
	or 9, 8
	or 9, 10, 9
	neg 3, 9
	and 3, 9, 3

	cntlzw 3
	addi 3, -0x20
	srwi 3, 0x1F
	blr





uint128_t_operator_cast_uint8_t:
	lbz 3, 15(3)
	blr





uint128_t_operator_cast_uint16_t:
	lhz 3, 14(3)
	blr





uint128_t_operator_cast_uint32_t:
	lwz 3, 12(3)
	blr





uint128_t_operator_cast_uint64_t:
	lwz 4, 12(3)
	lwz 3, 8(3)
	blr





uint128_t_operator_and:
	lxvd2x 12, 0, 4
	lxvd2x 0, 5
	xxland 0, 12, 0
	stxvd2x 0, 3
	blr





uint128_t_operator_and_equal:
	mflr 0
	stwu 1, -48(1)
	mr 5, 4

	stw 31, 44(1)
	mr 31, 3

	addi 3, 1, 8
	stw 0, 52(1)
	mr 4, 31
	bl uint128_t_operator_and

	mr 3, 31
	addi 4, 1, 8
	bl uint128_t_operator_equal_const_uint128_t_double_ref

	lwz 0, 52(1)
	mr 3, 31
	lwz 31, 44(1)
	addi 1, 0x30
	mtlr 0
	blr





uint128_t_operator_or:
	lxvd2x 12, 0, 4
	lxvd2x 0, 5
	xxlor 0, 12, 0
	stxvd2x 0, 3
	blr





uint128_t_operator_or_equal:
	mflr 0
	stwu 1, -48(1)
	mr 5, 4

	stw 31, 44(1)
	mr 31, 3

	addi 3, 1, 8
	stw 0, 52(1)
	mr 4, 31
	bl uint128_t_operator_or

	mr 3, 31
	addi 4, 1, 8
	bl uint128_t_operator_equal_const_uint128_t_double_ref

	lwz 0, 52(1)
	mr 3, 31
	lwz 31, 44(1)
	addi 1, 0x30
	mtlr 0
	blr






uint128_t_operator_xor:
	lxvd2x 12, 0, 4
	lxvd2x 0, 5
	xxlxor 0, 12, 0
	stxvd2x 0, 3
	blr





uint128_t_operator_xor_equal:
	mflr 0
	stwu 1, -48(1)
	mr 5, 4

	stw 31, 44(1)
	mr 31, 3

	addi 3, 1, 8
	stw 0, 52(1)
	mr 4, 31
	bl uint128_t_operator_xor

	mr 3, 31
	addi 4, 1, 8
	bl uint128_t_operator_equal_const_uint128_t_double_ref

	lwz 0, 52(1)
	mr 3, 31
	lwz 31, 44(1)
	addi 1, 0x30
	mtlr 0
	blr






uint128_t_operator_not:
	lxvd2x 0, 4
	xxlnor 0
	stxvd2x 0, 3
	blr





uint128_t_operator_shiftLeft:





uint128_t_operator_shiftLeft_equal:
	mflr 0
	stwu 1, -48(1)
	mr 5, 4

	stw 31, 44(1)
	mr 31, 3

	addi 3, 1, 8
	stw 0, 52(1)
	mr 4, 31
	bl uint128_t_operator_shiftLeft

	mr 3, 31
	addi 4, 1, 8
	bl uint128_t_operator_equal_const_uint128_t_double_ref

	lwz 0, 52(1)
	mr 3, 31
	lwz 31, 44(1)
	addi 1, 0x30
	mtlr 0
	blr






uint128_t_operator_shiftRight:





uint128_t_operator_shiftRight_equal:
	mflr 0
	stwu 1, -48(1)
	mr 5, 4

	stw 31, 44(1)
	mr 31, 3

	addi 3, 1, 8
	stw 0, 52(1)
	mr 4, 31
	bl uint128_t_operator_shiftRight

	mr 3, 31
	addi 4, 1, 8
	bl uint128_t_operator_equal_const_uint128_t_double_ref

	lwz 0, 52(1)
	mr 3, 31
	lwz 31, 44(1)
	addi 1, 0x30
	mtlr 0
	blr






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
	mflr 0
	stwu 1, -48(1)
	mr 5, 4

	stw 31, 44(1)
	mr 31, 3

	addi 3, 1, 8
	stw 0, 52(1)
	mr 4, 31
	bl uint128_t_operator_plus_equal

	mr 3, 31
	addi 4, 1, 8
	bl uint128_t_operator_equal_const_uint128_t_double_ref

	lwz 0, 52(1)
	mr 3, 31
	lwz 31, 44(1)
	addi 1, 0x30
	mtlr 0
	blr






uint128_t_operator_minus:





uint128_t_operator_minus_equal:
	mflr 0
	stwu 1, -48(1)
	mr 5, 4

	stw 31, 44(1)
	mr 31, 3

	addi 3, 1, 8
	stw 0, 52(1)
	mr 4, 31
	bl uint128_t_operator_minus_equal

	mr 3, 31
	addi 4, 1, 8
	bl uint128_t_operator_equal_const_uint128_t_double_ref

	lwz 0, 52(1)
	mr 3, 31
	lwz 31, 44(1)
	addi 1, 0x30
	mtlr 0
	blr





uint128_t_operator_multiply:





uint128_t_operator_multiply_equal:
	mflr 0
	stwu 1, -48(1)
	mr 5, 4

	stw 31, 44(1)
	mr 31, 3

	addi 3, 1, 8
	stw 0, 52(1)
	mr 4, 31
	bl uint128_t_operator_multiply

	mr 3, 31
	addi 4, 1, 8
	bl uint128_t_operator_equal_const_uint128_t_double_ref

	lwz 0, 52(1)
	mr 3, 31
	lwz 31, 44(1)
	addi 1, 0x30
	mtlr 0
	blr






uint128_t_divmod:





uint128_t_operator_divide:





uint128_t_operator_divide_equal:
	mflr 0
	stwu 1, -48(1)
	mr 5, 4

	stw 31, 44(1)
	mr 31, 3

	addi 3, 1, 8
	stw 0, 52(1)
	mr 4, 31
	bl uint128_t_operator_divide

	mr 3, 31
	addi 4, 1, 8
	bl uint128_t_operator_equal_const_uint128_t_double_ref

	lwz 0, 52(1)
	mr 3, 31
	lwz 31, 44(1)
	addi 1, 0x30
	mtlr 0
	blr






uint128_t_operator_modulo:





uint128_t_operator_modulo_equal:
	mflr 0
	stwu 1, -48(1)
	mr 5, 4

	stw 31, 44(1)
	mr 31, 3

	addi 3, 1, 8
	stw 0, 52(1)
	mr 4, 31
	bl uint128_t_operator_modulo

	mr 3, 31
	addi 4, 1, 8
	bl uint128_t_operator_equal_const_uint128_t_double_ref

	lwz 0, 52(1)
	mr 3, 31
	lwz 31, 44(1)
	addi 1, 0x30
	mtlr 0
	blr






uint128_t_operator_plus_plus:





uint128_t_operator_plus_plus_int:





uint128_t_operator_minus_minus:





uint128_t_operator_minus_minus_int:





uint128_t_operator_single_plus:





uint128_t_operator_single_minus:





uint128_t_upper:





uint128_t_lower:





uint128_t_bits:
