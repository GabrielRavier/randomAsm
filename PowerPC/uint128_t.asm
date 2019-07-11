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
	mflr 0
	stwu 1, -32(1)
	stw 0, 36(1)
	stw 31, 28(1)
	mr 31, 3
	stw 29, 20(1)
	stw 30, 24(1)

	lwz 8, 0(5)
	lwz 9, 4(5)
	lwz 10, 8(5)
	lwz 11, 12(5)

	or. 7, 8, 9
	bne 0, .l2

	cmpwi 7, 10, 0
	bne 7, .l2

	cmplwi 6, 11, 0x7F
	bgt 6, .l2

	cmpwi 6, 11, 0X40
	beq 6, .l24

	or. 9, 10, 11
	beq 0, .l25
	beq 7, .l26

.l8:
	addic 9, 11, -0x41
	addme 8, 10

	cmpwi 7, 8, 0
	bne 7, .l2

	cmplwi 7, 9, 0x3E
	bgt 7, .l2

	addic 9, 11, -0x60
	addi 10, 11, -0x40
	blt 0, .l17

	lwz 10, 12(4)
	slw 9, 10, 9
	li 10, 0
	stw 9, 0(31)
	stw 10, 4(31)

.l18:
	lwz 0, 36(1)
	li 10, 0
	lwz 29, 20(1)
	lwz 30, 24(1)
	mr 3, 31

	stw 10, 8(31)
	stw 10, 12(31)

	mtlr 0
	lwz 31, 28(1)
	addi 1, 0x20
	blr

.l2:
	lis 4, uint128_0@ha
	mr 3, 31
	la 4, uint128_0@l(4)
	bl uint128_t_constructor

.l1:
	lwz 0, 36(1)
	mr 3, 31
	lwz 29, 20(1)
	lwz 30, 24(1)
	lwz 31, 28(1)

	addi 1, 0x20
	mtlr 0
	blr

.l26:
	cmplwi 7, 11, 0x3F
	bgt 7, .l8

	subfic 9, 11, 0x40
	lwz 0, 8(4)
	lwz 3, 12(4)
	addic. 8, 9, -0x20
	blt 0, .l10

	srw 7, 0, 8
	li 6, 0

.l11:
	addic. 5, 11, -0x20
	blt 0, .l12

	lwz 4, 4(4)
	li 9, 0
	slw 8, 4, 5

.l13:
	cmpwi 7, 5, 0
	addc 9, 7
	adde 8, 6
	stw 8, 0(31)
	stw 9, 4(31)
	blt 7, .l14

	slw 5, 4, 5
	li 9, 0
	stw 5, 8(31)
	stw 9, 12(31)
	b .l1

.l24:
	lwz 10, 8(4)
	lwz 11, 12(4)
	stw 10, 0(3)
	stw 11, 4(3)

	li 10, 0
	stw 10, 8(3)
	stw 10, 12(3)
	b .l1

.l25:
	bl uint128_t_constructor
	b .l1

.l10:
	slwi 8, 0, 1
	subfic 5, 9, 0x1F
	slw 8, 5
	srw 7, 3, 9
	or 7, 8, 7
	srw 6, 0, 9
	b .l11

.l14:
	srwi 10, 3, 1
	subfic 9, 11, 0x1F
	srw 9, 10, 9
	slw 0, 11
	or 0, 9
	slw 3, 11
	stw 0, 8(31)
	stw 3, 12(31)
	b .l1

.l12:
	lwz 12, 4(4)
	lwz 30, 0(4)
	subfic 4, 11, 0x1F
	srwi 29, 12, 1
	slw 8, 30, 11
	srw 4, 29, 4
	slw 9, 12, 11
	or 8, 4, 8
	b .l13

.l17:
	lwz 6, 12(4)
	lwz 9, 8(4)
	subfic 7, 10, 0x1F
	mr 8, 6
	srwi 6, 1
	slw 9, 10
	srw 7, 6, 7
	or 9, 7
	slw 10, 8, 10
	stw 9, 0(31)
	stw 10, 4(31)
	b .l18





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
