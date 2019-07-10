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
	ld 9, 0(3)
	ld 3, 8(3)
	or 3, 9, 3

	cntlzd 3
	srdi 3, 6
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





uint128_t_operator_and_and:
	addis 2, 12, .TOC. - uint128_t_operator_and_and@ha
	addi 2, .TOC. - uint128_t_operator_and_and@l
	mflr 0

	std 31, -8(1)
	mr 31, 4
	std 0, 16(1)
	stdu 1, -48(1)

	bl uint128_t_operator_cast_bool
	nop

	cmpdi 0, 3, 0
	bne 0, .continue

	addi 1, 0x30
	ld 0, 16(1)
	ld 31, -8(1)
	mtlr 0
	blr

.continue:
	mr 3, 31
	bl uint128_t_operator_cast_bool
	nop

	addi 1, 0x30
	ld 0, 16(1)
	ld 31, -8(1)
	mtlr 0
	blr

	.long 0
	.byte 0, 9, 0, 1, 0x80, 1, 0, 0





uint128_t_operator_or_or:
	addis 2, 12, .TOC. - uint128_t_operator_and_and@ha
	addi 2, .TOC. - uint128_t_operator_and_and@l
	mflr 0

	std 31, -8(1)
	mr 31, 4
	std 0, 16(1)
	stdu 1, -48(1)

	bl uint128_t_operator_cast_bool
	nop

	cmpdi 0, 3, 0
	beq 0, .continue

	addi 1, 0x30
	ld 0, 16(1)
	ld 31, -8(1)
	mtlr 0
	blr

.continue:
	mr 3, 31
	bl uint128_t_operator_cast_bool
	nop

	addi 1, 0x30
	ld 0, 16(1)
	ld 31, -8(1)
	mtlr 0
	blr

	.long 0
	.byte 0, 9, 0, 1, 0x80, 1, 0, 0





uint128_t_operator_equal_equal:
	ld 9, 0(3)
	ld 10, 0(4)
	cmpd 7, 9, 10
	beq 7, .continue

	li 3, 0
	blr

.continue:
	ld 3, 8(3)
	ld 9, 8(4)
	xor 3, 9
	cntlzd 3
	srdi 3, 6
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





uint128_t_operator_not_equal:
	addis 2, 12, .TOC. - uint128_t_operator_not_equal@ha
	addi 2, .TOC. -uint128_t_operator_not_equal

	mflr 0
	std 0, 16(1)
	stdu 1, -32(1)

	bl uint128_t_operator_equal_equal
	nop

	addi 1, 0x20
	ld 0, 16(1)
	xori 3, 1
	rlwinm 3, 0, 0xFF
	mtlr 0
	blr

	.long 0
	.byte 0, 9, 0, 1, 0x80, 1, 0, 0





uint128_t_operator_above:
	ld 9, 0(3)
	ld 10, 0(4)
	cmpld 7, 9, 10
	beq 7, .continue

	subfc 9, 10
	subfe 3
	neg 3
	rlwinm 3, 0, 0xFF
	blr

.continue:
	ld 9, 8(3)
	ld 10, 8(4)
	subfc 9, 10
	subfe 3
	neg 3
	rlwinm 3, 0, 0xFF
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





uint128_t_operator_below:
	addis 2, 12, .TOC. - uint128_t_operator_below@ha
	addi 2, .TOC. - uint128_t_operator_below@l
	mflr 0
	std 30, -16(1)
	std 31, -8(1)
	mr 30, 4
	mr 31, 3
	std 0, 16(1)
	stdu 1, -48(1)

	bl uint128_t_operator_equal_equal
	nop

	cmpdi 7, 3, 0
	beq 7, .continue

	addi 1, 0x30
	li 3, 0
	ld 0, 16(1)
	ld 30, -16(1)
	ld 31, -8(1)
	mtlr 0
	blr

.continue:
	mr 4, 30
	mr 3, 31
	bl uint128_t_operator_above
	nop

	addi 1, 0x30
	ld 0, 16(1)
	ld 31, -16(1)
	ld 31, -8(1)

	xori 3, 1
	rlwinm 3, 0, 0xFF

	mtlr 0
	blr

	.long 0
	.byte 0, 9, 0, 1, 0x80, 1, 0, 0





uint128_t_operator_above_equal:
	addis 2, 12, .TOC. - uint128_t_operator_above_equal@ha
	addi 2, .TOC. -uint128_t_operator_above_equal

	mflr 0
	std 0, 16(1)
	stdu 1, -32(1)

	bl uint128_t_operator_below
	nop

	addi 1, 0x20
	ld 0, 16(1)
	xori 3, 1
	rlwinm 3, 0, 0xFF
	mtlr 0
	blr

	.long 0
	.byte 0, 9, 0, 1, 0x80, 1, 0, 0





uint128_t_operator_below_equal:
	addis 2, 12, .TOC. - uint128_t_operator_below_equal@ha
	addi 2, .TOC. -uint128_t_operator_below_equal

	mflr 0
	std 0, 16(1)
	stdu 1, -32(1)

	bl uint128_t_operator_above
	nop

	addi 1, 0x20
	ld 0, 16(1)
	xori 3, 1
	rlwinm 3, 0, 0xFF
	mtlr 0
	blr

	.long 0
	.byte 0, 9, 0, 1, 0x80, 1, 0, 0





uint128_t_operator_plus:
	ld 10, 8(4)
	ld 9, 8(5)
	ld 8, 0(4)
	ld 6, 0(5)

	add 9, 10, 9
	add 8, 6
	subfc 10, 9
	subfe 10
	std 9, 8(3)
	subf 9, 10, 8
	std 9, 0(3)
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





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
	ld 9, 8(5)
	ld 7, 8(4)
	ld 10, 0(5)
	ld 6, 0(4)

	subfc 9, 7
	subfe 10, 6

	std 9, 8(3)
	std 10, 0(3)
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





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
	ld 9, 0(5)
	ld 0, 8(4)
	ld 6, 8(5)
	ld 8, 0(4)

	std 29, -24(1)
	std 30, -16(1)
	std 31, -8(1)
	std 28, -32(1)

	rldicl 12, 0, 0, 32
	srdi 29, 6, 32
	rldicl 7, 9, 0, 32
	srdi 10, 9, 32
	rldicl 6, 0, 32

	mulld 5, 12, 29
	mulld 9, 12, 7
	srdi 0, 32

	mulld 10, 12
	mulld 30, 0, 29
	mulld 4, 0, 7
	mulld 12, 6

	rldicl 7, 8, 0, 32
	mulld 0, 6
	mulld 31, 7, 6
	mulld 29, 7, 29

	srdi 28, 5, 32
	rldicl 10, 0, 32
	rldicl 6, 9, 0, 32

	srdi 8, 32
	srdi 9, 32
	add 7, 28

	ld 28, -32(1)
	rldicl 4, 0, 32
	add 9, 10, 9

	rldicl 5, 0, 32
	mulld 10, 8, 6
	srdi 6, 12, 32

	rldicl 8, 30, 0, 32
	add 9, 4
	srdi 30, 32
	add 8, 7, 8
	add 5, 6

	rldicl 7, 0, 0, 32
	srdi 0, 32
	add 5, 7, 5

	rldicl 4, 29, 0, 32
	ld 29, -24(1)
	add 8, 0
	add 9, 30

	ld 30, -16(1)
	rldicl 6, 31, 0, 32
	srdi 7, 31, 32

	ld 31, -8(1)
	add 6, 8
	add 9, 4
	srdi 8, 5, 32

	rldicl 10, 0, 32
	add 8, 6
	add 9, 7
	add 9, 10, 9

	srdi 10, 8, 32
	add 9, 10, 9

	rldimi 12, 5, 32, 0
	rldimi 8, 9, 32, 0
	std 12, 8(3)
	std 8, 0(3)
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 4, 0, 0





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
	addis 2, 12, .TOC. - uint128_t_divmod@ha
	addi 2, .TOC. - uint128_t_divmod@l
	mflr 0

	std 26, -48(1)
	std 28, -32(1)
	std 29, -24(1)
	std 30, -16(1)
	mr 29, 5
	mr 30, 6
	std 31, -8(1)

	addis 28, 2, .pUint128_1@toc@ha
	ld 28, .pUint128_1@toc@l(28)
	mr 31, 3
	mr 3, 6
	addi 26, 31, 16

	std 0, 16(1)
	stdu 1, -160(1)
	mr 4, 28
	bl uint128_t_operator_equal_equal
	nop

	mr 4, 29
	cmpdi 7, 3, 0
	bne 7, .doCnst

	mr 4, 30
	mr 3, 29
	bl uint128_t_operator_equal_equal
	nop

	cmpdi 7, 3, 0
	beq 7, .check0

	mr 4, 28

.doCnst:
	mr 3, 31
	bl uint128_t_constructor
	nop

	addis 4, 2, .pUint128_0@toc@ha
	ld 4, .pUint128_0@toc@l(4)
	mr 3, 26
	bl uint128_t_constructor
	nop

.return:
	addi 1, 160
	mr 3, 31

	ld 0, 16(1)
	ld 26, -48(1)
	ld 28, -32(1)
	ld 29, -24(1)
	ld 30, -16(1)
	ld 31, -8(1)
	mtlr 0
	blr

.check0:
	std 27, 120(1)
	addis 27, 2, .pUint128_0@toc@ha
	ld 27, .pUint128_0@toc@l(27)

	mr 3, 29
	mr 4, 27
	bl uint128_t_operator_equal_equal
	nop

	cmpdi 7, 3, 0
	beq 7, .checkBelow

.doConstructs:
	mr 4, 27
	mr 3, 31
	bl uint128_t_constructor
	nop

	mr 4, 29
	mr 3, 26
	bl uint128_t_constructor
	nop

	ld 27, 210(1)
	addi 1, 160
	mr 3, 31
	ld 0, 16(1)
	ld 26, -48(1)
	ld 28, -32(1)
	ld 29, -24(1)
	ld 30, -16(1)
	ld 31, -8(1)
	mtlr 0
	blr

.checkBelow:
	mr 4, 30
	mr 3, 29
	bl uint128_t_operator_below
	nop

	cmpdi 7, 3, 0
	bne 7, .doConstructs

	mr 4, 27
	addi 3, 1, 0x20
	bl uint128_t_constructor
	nop

	mr 4, 27
	addi 3, 1, 0x30
	bl uint128_t_constructor
	nop

	mr 3, 29
	bl uint128_t_bits
	nop

	cmpdi 0, 3, 0
	beq 0, .doMoves

	rldicl 27, 3, 0, 0x20
	std 24, 96(1)
	addi 24, 3, -1
	std 25, 104(1)
	addi 9, 27, -1

	rlwinm 24, 0, 0xFF
	subf 24, 9
	addi 27, -1
	rldicl 24, 0, 0x20
	rldicl 27, 0, 0x20

	li 25, 0
	b .doShifts

.checkAboveEq:
	mr 4, 30
	addi 3, 1, 0x30

	bl uint128_t_operator_above_equal
	nop

	cmpdi 7, 3, 0
	bne 7, .doMinEq

.continue:
	addi 27, -1
	cmplw 7, 24, 27
	rldicl 27, 0, 0x20
	beq 7, .doLds

.doShifts:
	mr 4, 28
	addi 3, 1, 0x20
	bl uint128_t_operator_shiftLeft_equal
	nop

	mr 4, 28
	addi 3, 1, 0x30
	bl uint128_t_operator_shiftLeft_equal
	nop

	addi 5, 1, 0x40
	mr 4, 29

	std 25, 64(1)
	std 27, 72(1)

	addi 3, 1, 80
	bl uint128_t_operator_shiftRight
	nop

	ld 9, 88(1)
	addi 3, 1, 0x40
	std 25, 64(1)
	rldicl 9, 0, 0x3F
	std 9, 72(1)

	bl uint128_t_operator_cast_bool
	nop

	cmpdi 7, 3, 0
	beq 7, .checkAboveEq

	addi 3, 1, 0x30
	bl uint128_t_operator_plus_plus
	nop

	mr 4, 30
	addi 3, 1, 0x30
	bl uint128_t_operator_above_equal
	nop

	cmpdi 7, 3, 0
	beq 7, .continue

.doMinEq:
	mr 4, 30
	addi 3, 1, 0x30
	bl uint128_t_operator_minus_equal
	nop

	addi 3, 1, 0x20
	bl uint128_t_operator_plus_plus
	nop
	b .continue

.doLds:
	ld 24, 96(1)
	ld 25, 104(1)

.doMoves:
	addi 4, 1, 0x20
	mr 3, 31
	bl uint128_t_constructor_uint128_t_double_ref
	nop

	addi 4, 1, 0x30
	mr 3, 26
	bl uint128_t_constructor_uint128_t_double_ref
	nop

	ld 27, 120(1)
	b .return

	.long 0
	.byte 0, 9, 0, 1, 0x80, 8, 0, 0

.pUint128_0:
	.quad uint128_0

.pUint128_1:
	.quad uint128_1





uint128_t_operator_divide:
	addis 2, 12, .TOC. - uint128_t_operator_divide@ha
	addi 2, .TOC. - uint128_t_operator_divide@l
	mflr 0
	std 31, -8(1)

	mr 6, 5
	mr 31, 3
	mr 5, 4

	std 0, 16(1)
	stdu 1, -80(1)

	addi 3, 1, 0x20
	bl uint128_t_divmod
	nop

	addi 4, 1, 0x20
	mr 3, 31
	bl uint128_t_constructor_uint128_t_double_ref
	nop

	addi 1, 80
	mr 3, 31
	ld 0, 16(1)
	ld 31, -8(1)
	mtlr 0
	blr

	.long 0
	.byte 0, 9, 0, 1, 0x80, 1, 0, 0





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
	addis 2, 12, .TOC. - uint128_t_operator_divide@ha
	addi 2, .TOC. - uint128_t_operator_divide@l
	mflr 0
	std 31, -8(1)

	mr 6, 5
	mr 31, 3
	mr 5, 4

	std 0, 16(1)
	stdu 1, -80(1)

	addi 3, 1, 0x20
	bl uint128_t_divmod
	nop

	mr 3, 31
	addi 4, 1, 0x30
	bl uint128_t_constructor_uint128_t_double_ref
	nop

	addi 1, 80
	mr 3, 31
	ld 0, 16(1)
	ld 31, -8(1)
	mtlr 0
	blr

	.long 0
	.byte 0, 9, 0, 1, 0x80, 1, 0, 0





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
	addis 2, 12, .TOC. - uint128_t_operator_plus_plus@ha
	addi 2, .TOC. - uint128_t_operator_plus_plus@l
	mflr 0

	addis 4, 2, .pUint128_1@toc@ha
	ld 4, .pUint128_1@toc@l(4)

	std 0, 16(1)
	stdu 1, -32(1)

.pUint128_1:
	.quad uint128_1





uint128_t_operator_plus_plus_int:





uint128_t_operator_minus_minus:





uint128_t_operator_minus_minus_int:





uint128_t_operator_single_plus:





uint128_t_operator_single_minus:





uint128_t_upper:





uint128_t_lower:





uint128_t_bits:
