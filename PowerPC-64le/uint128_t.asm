	.bss

uint128_0:
	.zero 16

	.data

uint128_1:
	.quad 0, 1

	.text

uint128_t_constructor_default:
	vspltisw 0
	xxpermdi 0, 32, 32, 2
	stxvd2x 0, 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





uint128_t_constructor:
uint128_t_operator_equal:
	lxvd2x 0, 4
	stxvd2x 0, 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





uint128_t_constructor_uint128_t_double_ref:
	ld 9, 0(4)
	cmpld 7, 3, 4

	std 9, 0(3)
	ld 9, 8(4)
	std 9, 8(3)
	beqlr 7

	vspltisw 0
	xxpermdi 0, 32, 32, 2
	stxvd2x 0, 4
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





uint128_t_operator_equal_const_uint128_t_double_ref:
	cmpld 7, 3, 4
	beqlr 7

	ld 9, 0(4)
	vspltisw 0
	xxpermdi 0, 32, 32, 2

	std 9, 0(3)
	ld 9, 8(4)
	std 9, 8(3)
	stxvd2x 0, 4
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





uint128_t_operator_cast_bool:
	ld 9, 0(3)
	ld 3, 8(3)
	or 9, 3

	addic 3, 9, -1
	subfe 3, 9
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





uint128_t_operator_cast_uint8_t:
	lbz 3, 8(3)
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





uint128_t_operator_cast_uint16_t:
	lhz 3, 8(3)
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





uint128_t_operator_cast_uint32_t:
	lwz 3, 8(3)
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





uint128_t_operator_cast_uint64_t:
	ld 3, 8(3)
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





uint128_t_operator_and:
	lxvd2x 0, 4
	lxvd2x 12, 0, 5
	xxland 0, 12
	stxvd2x 0, 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





uint128_t_operator_and_equal:
	addis 2, 12, .TOC. - uint128_t_operator_and_equal@ha
	addi 2, .TOC. - uint128_t_operator_and_equal@l
	mflr 0

	std 31, -8(1)
	mr 31, 3
	mr 5, 4
	mr 4, 31

	std 0, 16(1)
	stdu 1, -64(1)

	addi 3, 1, 32
	bl uint128_t_operator_and
	nop

	addi 4, 1, 32
	mr 3, 31
	bl uint128_t_operator_equal_const_uint128_t_double_ref
	nop

	addi 1, 64
	mr 3, 31
	ld 0, 16(1)
	ld 31, -8(1)
	mtlr 0
	blr

	.long 0
	.byte 0, 9, 0, 1, 0x80, 1, 0, 0





uint128_t_operator_or:
	lxvd2x 0, 4
	lxvd2x 12, 0, 5
	xxlor 0, 12
	stxvd2x 0, 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





uint128_t_operator_or_equal:
	addis 2, 12, .TOC. - uint128_t_operator_or_equal@ha
	addi 2, .TOC. - uint128_t_operator_or_equal@l
	mflr 0

	std 31, -8(1)
	mr 31, 3
	mr 5, 4
	mr 4, 31

	std 0, 16(1)
	stdu 1, -64(1)

	addi 3, 1, 32
	bl uint128_t_operator_or
	nop

	addi 4, 1, 32
	mr 3, 31
	bl uint128_t_operator_equal_const_uint128_t_double_ref
	nop

	addi 1, 64
	mr 3, 31
	ld 0, 16(1)
	ld 31, -8(1)
	mtlr 0
	blr

	.long 0
	.byte 0, 9, 0, 1, 0x80, 1, 0, 0





uint128_t_operator_xor:
	lxvd2x 0, 4
	lxvd2x 12, 0, 5
	xxlxor 0, 12
	stxvd2x 0, 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





uint128_t_operator_xor_equal:
	addis 2, 12, .TOC. - uint128_t_operator_xor_equal@ha
	addi 2, .TOC. - uint128_t_operator_xor_equal@l
	mflr 0

	std 31, -8(1)
	mr 31, 3
	mr 5, 4
	mr 4, 31

	std 0, 16(1)
	stdu 1, -64(1)

	addi 3, 1, 32
	bl uint128_t_operator_xor
	nop

	addi 4, 1, 32
	mr 3, 31
	bl uint128_t_operator_equal_const_uint128_t_double_ref
	nop

	addi 1, 64
	mr 3, 31
	ld 0, 16(1)
	ld 31, -8(1)
	mtlr 0
	blr

	.long 0
	.byte 0, 9, 0, 1, 0x80, 1, 0, 0





uint128_t_operator_not:
	lxvd2x 0, 4
	xxlnor 0
	stxvd2x 0, 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





uint128_t_operator_shiftLeft:
	addis 2, 12, .TOC. - uint128_t_operator_shiftLeft@ha
	addi 2, .TOC. - uint128_t_operator_shiftLeft@l

	ld 10, 0(5)
	std 31, -8(1)
	mr 31, 3
	stdu 1, -48(1)

	cmpdi 7, 10, 0
	bne 7, .ret0

	ld 9, 8(5)
	cmpldi 7, 9, 0x7F
	ble 7, .got7F

.ret0:
	mflr 0
	addis 4, 2, .pUint128_0@toc@ha
	ld 4, .pUint128_0@toc@l(4)
	mr 3, 31

	std 0, 64(1)
	bl uint128_t_constructor
	nop

	ld 0, 64(1)
	mtlr 0

.return:
	addi 1, 48
	mr 3, 31
	ld 31, -8(1)
	blr

.got7F:
	cmpldi 7, 9, 0x40
	beq 7, .finish

	cmpdi 7, 9, 0
	beq 7, .doCnst

	cmpldi 7, 9, 0x3F
	bgt 7, .got3F

	ld 7, 8(4)
	ld 10, 0(4)
	rldicl 9, 0, 32
	subfic 8, 9, 0x40
	sld 10, 9
	srd 8, 7, 8
	add 10, 8
	sld 9, 7, 9

	std 10, 0(3)
	std 9, 8(3)
	b .return

.doCnst:
	mflr 0
	std 0, 64(1)

	bl uint128_t_constructor
	nop

	ld 0, 64(1)
	mtlr 0
	b .return

.finish:
	ld 9, 8(4)
	addi 1, 48
	std 10, 8(3)
	std 9, 0(3)

	mr 3, 31
	ld 31, -8(1)
	blr

.got3F:
	addi 7, 9, -0x41
	cmpldi 7, 0x3E
	bgt 7, .ret0

	ld 8, 8(4)
	addi 9, -0x40
	std 10, 8(3)
	sld 9, 8, 9
	std 9, 0(3)
	b .return

	.long 0
	.byte 0, 9, 0, 1, 0x80, 1, 0, 0

.pUint128_0:
	.quad uint128_0





uint128_t_operator_shiftLeft_equal:
	addis 2, 12, .TOC. - uint128_t_operator_shiftLeft_equal@ha
	addi 2, .TOC. - uint128_t_operator_shiftLeft_equal@l
	mflr 0

	std 31, -8(1)
	mr 31, 3
	mr 5, 4
	mr 4, 31

	std 0, 16(1)
	stdu 1, -64(1)

	addi 3, 1, 32
	bl uint128_t_operator_shiftLeft
	nop

	addi 4, 1, 32
	mr 3, 31
	bl uint128_t_operator_equal_const_uint128_t_double_ref
	nop

	addi 1, 64
	mr 3, 31
	ld 0, 16(1)
	ld 31, -8(1)
	mtlr 0
	blr

	.long 0
	.byte 0, 9, 0, 1, 0x80, 1, 0, 0





uint128_t_operator_shiftRight:
	addis 2, 12, .TOC. - uint128_t_operator_shiftLeft@ha
	addi 2, .TOC. - uint128_t_operator_shiftLeft@l

	ld 10, 0(5)
	std 31, -8(1)
	mr 31, 3
	stdu 1, -48(1)

	cmpdi 7, 10, 0
	bne 7, .ret0

	ld 9, 8(5)
	cmpldi 7, 9, 0x7F
	ble 7, .got7F

.ret0:
	mflr 0
	addis 4, 2, .pUint128_0@toc@ha
	ld 4, .pUint128_0@toc@l(4)
	mr 3, 31

	std 0, 64(1)
	bl uint128_t_constructor
	nop

	ld 0, 64(1)
	mtlr 0

.return:
	addi 1, 48
	mr 3, 31
	ld 31, -8(1)
	blr

.got7F:
	cmpldi 7, 9, 0x40
	beq 7, .finish

	cmpdi 7, 9, 0
	beq 7, .doCnst

	cmpldi 7, 9, 0x3F
	bgt 7, .got3F

	ld 7, 8(4)
	ld 8, 0(4)
	rldicl 9, 0, 32
	subfic 10, 9, 0x40
	srd 8, 9
	sld 10, 7, 10
	add 10, 8
	srd 9, 7, 9

	std 10, 0(3)
	std 9, 8(3)
	b .return

.doCnst:
	mflr 0
	std 0, 64(1)

	bl uint128_t_constructor
	nop

	ld 0, 64(1)
	mtlr 0
	b .return

.finish:
	std 10, 0(3)
	addi 1, 48
	ld 9, 0(4)
	std 9, 8(3)

	mr 3, 31
	ld 31, -8(1)
	blr

.got3F:
	addi 7, 9, -0x41
	cmpldi 7, 0x3E
	bgt 7, .ret0

	ld 8, 0(4)
	addi 9, -0x40
	std 10, 0(3)
	srd 9, 8, 9
	std 9, 8(3)
	b .return

	.long 0
	.byte 0, 9, 0, 1, 0x80, 1, 0, 0

.pUint128_0:
	.quad uint128_0





uint128_t_operator_shiftRight_equal:
	addis 2, 12, .TOC. - uint128_t_operator_shiftRight_equal@ha
	addi 2, .TOC. - uint128_t_operator_shiftRight_equal@l
	mflr 0

	std 31, -8(1)
	mr 31, 3
	mr 5, 4
	mr 4, 31

	std 0, 16(1)
	stdu 1, -64(1)

	addi 3, 1, 32
	bl uint128_t_operator_shiftRight
	nop

	addi 4, 1, 32
	mr 3, 31
	bl uint128_t_operator_equal_const_uint128_t_double_ref
	nop

	addi 1, 64
	mr 3, 31
	ld 0, 16(1)
	ld 31, -8(1)
	mtlr 0
	blr

	.long 0
	.byte 0, 9, 0, 1, 0x80, 1, 0, 0





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
	addis 2, 12, .TOC. - uint128_t_operator_plus_equal@ha
	addi 2, .TOC. - uint128_t_operator_plus_equal@l
	mflr 0

	std 31, -8(1)
	mr 31, 3
	mr 5, 4
	mr 4, 31

	std 0, 16(1)
	stdu 1, -64(1)

	addi 3, 1, 32
	bl uint128_t_operator_plus
	nop

	addi 4, 1, 32
	mr 3, 31
	bl uint128_t_operator_equal_const_uint128_t_double_ref
	nop

	addi 1, 64
	mr 3, 31
	ld 0, 16(1)
	ld 31, -8(1)
	mtlr 0
	blr

	.long 0
	.byte 0, 9, 0, 1, 0x80, 1, 0, 0





uint128_t_operator_minus:





uint128_t_operator_minus_equal:
	addis 2, 12, .TOC. - uint128_t_operator_minus_equal@ha
	addi 2, .TOC. - uint128_t_operator_minus_equal@l
	mflr 0

	std 31, -8(1)
	mr 31, 3
	mr 5, 4
	mr 4, 31

	std 0, 16(1)
	stdu 1, -64(1)

	addi 3, 1, 32
	bl uint128_t_operator_minus
	nop

	addi 4, 1, 32
	mr 3, 31
	bl uint128_t_operator_equal_const_uint128_t_double_ref
	nop

	addi 1, 64
	mr 3, 31
	ld 0, 16(1)
	ld 31, -8(1)
	mtlr 0
	blr

	.long 0
	.byte 0, 9, 0, 1, 0x80, 1, 0, 0





uint128_t_operator_multiply:





uint128_t_operator_multiply_equal:
	addis 2, 12, .TOC. - uint128_t_operator_multiply_equal@ha
	addi 2, .TOC. - uint128_t_operator_multiply_equal@l
	mflr 0

	std 31, -8(1)
	mr 31, 3
	mr 5, 4
	mr 4, 31

	std 0, 16(1)
	stdu 1, -64(1)

	addi 3, 1, 32
	bl uint128_t_operator_multiply
	nop

	addi 4, 1, 32
	mr 3, 31
	bl uint128_t_operator_equal_const_uint128_t_double_ref
	nop

	addi 1, 64
	mr 3, 31
	ld 0, 16(1)
	ld 31, -8(1)
	mtlr 0
	blr

	.long 0
	.byte 0, 9, 0, 1, 0x80, 1, 0, 0





uint128_t_divmod:





uint128_t_operator_divide:





uint128_t_operator_divide_equal:
	addis 2, 12, .TOC. - uint128_t_operator_divide_equal@ha
	addi 2, .TOC. - uint128_t_operator_divide_equal@l
	mflr 0

	std 31, -8(1)
	mr 31, 3
	mr 5, 4
	mr 4, 31

	std 0, 16(1)
	stdu 1, -64(1)

	addi 3, 1, 32
	bl uint128_t_operator_divide
	nop

	addi 4, 1, 32
	mr 3, 31
	bl uint128_t_operator_equal_const_uint128_t_double_ref
	nop

	addi 1, 64
	mr 3, 31
	ld 0, 16(1)
	ld 31, -8(1)
	mtlr 0
	blr

	.long 0
	.byte 0, 9, 0, 1, 0x80, 1, 0, 0





uint128_t_operator_modulo:





uint128_t_operator_modulo_equal:
	addis 2, 12, .TOC. - uint128_t_operator_modulo_equal@ha
	addi 2, .TOC. - uint128_t_operator_modulo_equal@l
	mflr 0

	std 31, -8(1)
	mr 31, 3
	mr 5, 4
	mr 4, 31

	std 0, 16(1)
	stdu 1, -64(1)

	addi 3, 1, 32
	bl uint128_t_operator_modulo
	nop

	addi 4, 1, 32
	mr 3, 31
	bl uint128_t_operator_equal_const_uint128_t_double_ref
	nop

	addi 1, 64
	mr 3, 31
	ld 0, 16(1)
	ld 31, -8(1)
	mtlr 0
	blr

	.long 0
	.byte 0, 9, 0, 1, 0x80, 1, 0, 0





uint128_t_operator_plus_plus:





uint128_t_operator_plus_plus_int:





uint128_t_operator_minus_minus:





uint128_t_operator_minus_minus_int:





uint128_t_operator_single_plus:





uint128_t_operator_single_minus:





uint128_t_upper:





uint128_t_lower:





uint128_t_bits:
