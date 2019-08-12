	.bss

uint128_0:
	.zero 16

	.data

uint128_1:
	.quad 0, 1

	.text

uint128_t_constructor_default:
	stp xzr, [x0]
	ret





uint128_t_constructor:
uint128_t_operator_equal:
	ldr q0, [x1]
	str q0, [x0]
	ret





uint128_t_constructor_uint128_t_double_ref:
	ldr x2, [x1]
	str x2, [x0]
	cmp x0, x1
	ldr x2, [x1, 8]
	str x2, [x0, 8]
	beq .noClear

	stp xzr, [x1]

.noClear:
	ret





uint128_t_operator_equal_const_uint128_t_double_ref:
	cmp x0, x1
	beq .return

	ldr x2, [x1]
	str x2, [x0]
	ldr x2, [x1, 8]
	str x2, [x0, 8]
	stp xzr, [x1]

.return:
	ret





uint128_t_operator_cast_bool:
	ldp x1, x0, [x0]
	orr x1, x0
	cmp x1, 0
	cset w0, ne
	ret





uint128_t_operator_cast_uint8_t:
	ldrb w0, [x0, #8]
	bx lr





uint128_t_operator_cast_uint16_t:
	ldrh w0, [x0, #8]
	bx lr





uint128_t_operator_cast_uint32_t:
	ldr w0, [x0, #8]
	bx lr





uint128_t_operator_cast_uint64_t:
	ldr x0, [x0, 8]
	ret





uint128_t_operator_and:
	ldr q0, [x0]
	mov x0, x8
	ldr q1, [x1]
	and v0.16b, v1.16b
	str q0, [x8]
	ret





uint128_t_operator_and_equal:
	ldr q1, [x1]
	ldr q0, [x0]
	and v0.16b, v1.16b
	str q0, [x0]
	ret





uint128_t_operator_or:
	ldr q0, [x0]
	mov x0, x8
	ldr q1, [x1]
	orr v0.16b, v1.16b
	str q0, [x0]
	ret





uint128_t_operator_or_equal:
	ldr q1, [x1]
	ldr q0, [x0]
	orr v0.16b, v1.16b
	str q0, [x0]
	ret





uint128_t_operator_xor:
	ldr q0, [x0]
	mov x0, x8
	ldr q1, [x1]
	eor v0.16b, v1.16b
	str q0, [x0]
	ret





uint128_t_operator_xor_equal:
	ldr q1, [x1]
	ldr q0, [x0]
	eor v0.16b, v1.16b
	str q0, [x0]
	ret





uint128_t_operator_not:
	ldr q0, [x0]
	mov x0, x8
	not v0.16b
	str q0, [x8]
	ret





uint128_t_operator_shiftLeft:
	stp x29, x30, [sp, -32]!
	mov x29, sp
	ldp x3, x2, [x1]
	str x19, [sp, 16]
	mov x19, x8

	cmp x2, 0x7F
	ccmp x3, 0, 0, ls
	beq .continue

.do0:
	adrp x1, uint128_0
	mov x0, x19
	add x1, :lo12:uint128_0
	bl uint128_t_constructor

.return:
	mov x0, x19
	ldr x19, [sp, 16]
	ldp x29, x30, [sp], 32
	ret

.continue:
	cmp x2, 0x40
	beq .do02
	cbz x2, .doConstruct

	cmp x2, 0x3F
	bhi .check64

	ldp x1, x0, [x0]
	neg w3, w2
	lsl x1, x2
	lsr x3, x0, x3
	add x1, x3
	lsl x2, x0, x2

	stp x1, x2, [x8]
	b .return

.doConstruct:
	mov x1, x0
	mov x0, x8
	bl uint128_t_constructor
	b .return

.do02:
	ldr x0, [x0, 8]
	stp x0, xzr, [x8]

	mov x0, x19
	ldr x19, [sp, 16]
	ldp x29, x30, [sp], 32
	ret

.check64:
	sub x1, x2, #0x41
	cmp x1, #0x3E
	bhi .do0

	ldr x0, [x0, 8]
	sub w2, #0x40
	lsl x2, x0, x2
	stp x2, wzr, [x8]
	b .return





uint128_t_operator_shiftLeft_equal:
	stp x29, x30, [sp, -48]!
	add x8, sp, 32
	mov x29, sp
	str x19, [sp, 16]
	mov x19, x0

	bl uint128_t_operator_shiftLeft
	add x1, sp, 32
	mov x0, x19
	bl uint128_t_operator_equal_const_uint128_t_double_ref

	mov x0, x19
	ldr x19, [sp, 16]
	ldp x29, x30, [sp], 48
	ret





uint128_t_operator_shiftRight:
	stp x29, x30, [sp, -32]!
	mov x29, sp
	ldp x3, x2, [x1]
	str x19, [sp, 16]
	mov x19, x8

	cmp x2, 0x7F
	ccmp x3, 0, 0, ls
	beq .continue

.ret0:
	adrp x1, uint128_0
	mov x0, x19
	add x1, :lo12:uint128_0
	bl uint128_t_constructor

.return:
	mov x0, x19
	ldr x19, [sp, 16]
	ldp x29, x30, [sp], 32
	ret

.continue:
	cmp x2, 0x40
	beq .got64
	cbz x2, .doConstruct


	cmp x2, 0x3F
	bhi .doShifts

	ldp x3, x0, [x0]
	neg w1, w2
	lsl x1, x3, x1
	lsr x3, x2
	lsr x2, x0, x2
	add x1, x2
	b .return

.doConstruct:
	mov x1, x0
	mov x0, x8
	bl uint128_t_constructor
	b .return

.got64:
	str xzr, [x9]
	ldr x0, [x0]
	str x0, [x8, 8]

	mov x0, x19
	ldr x19, [sp, 16]
	ldp x29, x30, [sp], 32
	ret

.doShift:
	sub x1, x2, #0x41
	cmp x1, 0x3E
	bhi .ret0

	ldr x0, [x0]
	sub w2, #0x40
	lsr x2, x0, x2
	stp xzr, x2, [x8]
	b .return





uint128_t_operator_shiftRight_equal:
	stp x29, x30, [sp, -48]!
	add x8, sp, 32
	mov x29, sp
	str x19, [sp, 16]
	mov x19, x0

	bl uint128_t_operator_shiftRight
	add x1, sp, 32
	mov x0, x19
	bl uint128_t_operator_equal_const_uint128_t_double_ref

	mov x0, x19
	ldr x19, [sp, 16]
	ldp x29, x30, [sp], 48
	ret





uint128_t_operator_exclamation_mark:
	ldp x1, x0, [x0]
	orr x1, x0

	cmp x1, 1
	cset w0, eq
	ret





uint128_t_operator_and_and:
	stp x29, x30, [sp, -32]!
	mov x29, sp
	str x1, [sp, 24]

	bl uint128_t_operator_cast_bool
	tst w0, 0xFF
	ldr x1, [sp, 24]
	bne .continue

	mov w0, 0
	ldp x29, x30, [sp], 32
	ret

.continue:
	ldp x29, x30, [sp], 32
	mov x0, x1
	b uint128_t_operator_cast_bool





uint128_t_operator_or_or:
	stp x29, x30, [sp, -32]!
	mov x29, sp
	str x1, [sp, 24]

	bl uint128_t_operator_cast_bool
	tst w0, 0xFF
	ldr x1, [sp, 24]
	beq .continue

	ldp x29, x30, [sp], 32
	ret

.continue:
	ldp x29, x30? [sp], 32
	mov x0, x1
	b uint128_t_operator_cast_bool





uint128_t_operator_equal_equal:
	ldr x3, [x0]
	ldr x2, [x1]
	cmp x3, x2
	beq .continue

	mov w0, 0
	ret

.continue:
	ldr x2, [x0, 8]
	ldr x0, [x1, 8]
	cmp x2, x0
	cset w0, eq
	ret





uint128_t_operator_not_equal:
	ldr x4, x2, [x0]
	ldr x3, x0, [x1]

	cmp x4, x3
	ccmp x2, x0, 0, eq
	cset w0, ne
	ret





uint128_t_operator_above:
	ldr x3, [x0]
	ldr x2, [x1]
	cmp x3, x2
	beq .continue

	cset w0, hi
	ret

.continue:
	ldr x2, [x0, 8]
	ldr x0, [x1, 8]
	cmp x2, x0
	cset w0, hi
	ret





uint128_t_operator_below:
	ldr x3, [x0]
	ldr x2, [x1]
	cmp x3, x2
	beq .continue

	cset w0, cc
	ret

.continue:
	ldr x2, [x0, 8]
	ldr x0, [x1, 8]
	cmp x2, x0
	cset w0, cc
	ret





uint128_t_operator_above_equal:
	stp x29, x30, [sp, -48]!
	mov x29, sp
	stp x19, x20, [sp, 16]
	mov x20, x0
	str x21, [sp, 32]
	mov x21, x1

	bl uint128_t_operator_above
	and w19, w0, 0xFF

	mov x1, x21
	mov x0, x20
	bl uint128_t_operator_equal_equal
	and w0, 0xFF

	cmp w19, 0
	ccmp w0, 0, 0, eq
	cset w0, ne

	ldp x19, x20, [sp, 16]
	ldr x21, [sp, 32]
	ldp x29, x30, [sp], 48
	ret





uint128_t_operator_below_equal:
	stp x29, x30, [sp, -48]!
	mov x29, sp
	stp x19, x20, [sp, 16]
	mov x20, x0
	str x21, [sp, 32]
	mov x21, x1

	bl uint128_t_operator_below
	and w19, w0, 0xFF

	mov x1, x21
	mov x0, x20
	bl uint128_t_operator_equal_equal
	and w0, 0xFF

	cmp w19, 0
	ccmp w0, 0, 0, eq
	cset w0, ne

	ldp x19, x20, [sp, 16]
	ldr x21, [sp, 32]
	ldp x29, x30, [sp], 48
	ret





uint128_t_operator_plus:
	mov x2, x0
	mov x0, x8

	ldr x3, [x1, 8]
	ldr x4, [x2, 8]
	ldr x1, [x1]
	add x3, x4, x3

	ldr x2, [x2]
	cmp x4, x3
	add x2, x1
	cinc x2, hi

	stp x2, x3, [x8]
	ret





uint128_t_operator_plus_equal:
	ldp x5, x3, [x1]
	ldp x1, x4, [x0]

	add x3, x4, x3
	add x1, x5

	cmp x4, x3
	cinc x1, hi

	stp x1, x3, [x0]
	ret





uint128_t_operator_minus:
	mov x4, x0
	mov x0, x8
	ldp x5, x3, [x1]
	ldp x1, x2, [x4]

	cmp x3, x2
	sub x1, x5
	cset x4, hi

	sub x2, x3
	sub x1, x4
	stp x1, x2, [x8]
	ret





uint128_t_operator_minus_equal:
	stp x29, x30, [sp, -48]!
	add x8, sp, 32
	mov x29, sp
	str x19, [sp, 16]
	mov x19, x0

	bl uint128_t_operator_minus
	add x1, sp, 32
	mov x0, x19
	bl uint128_t_operator_equal_const_uint128_t_double_ref

	mov x0, x19
	ldr x19, [sp, 16]
	ldp x29, x30, [sp], 48
	ret





uint128_t_operator_multiply:
	mov x3, x0
	mov x0, x8

	ldp x2, x9, [x1]
	ldp x4, x5, [x3]

	and x14, x9, 0xFFFFFFFF
	lsr x9, 32

	and x16, x2, 0xFFFFFFFF
	lsr x6, x2, 32

	and x15, x5, 0xFFFFFFFF
	lsr x5, 32

	and x13, x4, 0xFFFFFFFF
	lsr x4, 32

	mul x10, x15, x14
	mul x1, x15, x9
	mul x7, x5, x14
	lsr x3, x10, 32
	mul x12, x5, x9
	mul x2, x15, x16

	add x3, x1, uxtw
	add x3, x7, uxtw
	mul x11, x13, x14
	mul w5, w16

	lsr x1, 32
	mul w6, w15

	lsr x7, 32
	lsr x16, x3, 32
	mul w9, w13, w9

	add x7, x12, uxtw
	add x1, x2, uxtw
	add x13, x16, x11, uxtw
	mul w4, w14

	add x1, x7
	add x5, x12, lsr 32
	add x1, x13
	add x2, x6, x2, lsr 32
	add x11, x9, x11, lsr 32
	add x2, x5
	add x4, x1, lsr 32
	add x2, x11
	add x2, x4

	and x10, 0xFFFFFFFF
	and x1, 0xFFFFFFFF

	orr x3, x10, x3, lsl 32
	orr x1, x2, lsl 32

	stp x1, x3, [x8]
	ret





uint128_t_operator_multiply_equal:
	stp x29, x30, [sp, -48]!
	add x8, sp, 32
	mov x29, sp
	str x19, [sp, 16]
	mov x19, x0

	bl uint128_t_operator_multiply
	add x1, sp, 32
	mov x0, x19
	bl uint128_t_operator_equal_const_uint128_t_double_ref

	mov x0, x19
	ldr x19, [sp, 16]
	ldp x29, x30, [sp], 48
	ret





uint128_t_divmod:
	stp x29, x30, [sp, -144]!
	mov x0, x2
	mov x29, sp
	stp x19, x20, [sp, 16]

	adrp x19, uint128_1
	add x19, :lo12:uint128_1

	mov x20, x2
	stp x21, x22, [sp, 32]

	mov x21, x1
	mov x22, x8
	mov x1, x19
	stp x23, x24, [sp, 48]
	add x23, x8, 16

	bl uint128_t_operator_equal_equal
	mov x1, x21
	tst w0, 0xFF
	bne .ret0

	mov x1, x20
	mov x0, x21
	bl uint128_t_operator_equal_equal

	tst w0, 0xFF
	beq .check0

	mov x1, x19

.ret0:
	mov x0, x22
	bl uint128_t_constructor

	adrp x1, uint128_0
	mov x0, x23
	add x1, :lo12:uint128_0
	bl uint128_t_constructor

.return:
	mov x0, x22
	ldp x19, x20, [sp, 16]
	ldp x21, x22, [sp, 32]
	ldp x23, x24, [sp, 48]
	ldp x29, x30, [sp], 144
	ret

.check0:
	adrp x24, uint128_0
	add x24, :lo12:uint128_0
	mov x1, x24
	mov x0, x21
	bl uint128_t_operator_equal_equal

	tst w0, 0xFF
	beq .l5

.checkBelow:
	mov x1, x24
	mov x0, x21
	bl uint128_t_operator_below

	tst w0, 0xFF
	bne .checkBelow

	mov x1, x24
	add x0, sp, 112
	stp x25, x26, [sp, 64]
	bl uint128_t_constructor

	mov x1, x24
	add x25, sp, 128
	mov x0, x25
	bl uint128_t_constructor

	mov x0, x21
	bl uint128_t_bits

	sub w24, w0, #1
	sub w0, #2
	sub w26, w0, w24, uxtb
	b .doShifts

.checkAboveEqual:
	mov x1, x20
	mov x0, x25
	bl uint128_t_operator_above_equal

	tst w0, 0xFF
	bne .doMinusEqual

.checkForMoves:
	cmp w24, w26
	beq .doMoves

.doShifts:
	mov x1, x19
	add x0, sp, 112
	bl uint128_t_operator_shiftLeft_equal

	mov x1, x19
	mov x0, x25
	bl uint128_t_operator_shiftLeft_equal

	uxtw w2, w24
	add x8, sp, 80
	add x1, sp, 96
	mov x0, x21

	stp xzr, x2, [sp, 96]
	sub w24, #1
	bl uint128_t_operator_shiftRight

	ldr x1, [sp, 88]
	add x0, sp, 96
	and x1, 1
	stp xzr, x1, [sp, 96]
	bl uint128_t_operator_cast_bool

	tst w0, 0xFF
	beq .checkAboveEqual

	mov x0, x25
	bl uint128_t_operator_plus_plus

	mov x1, x20
	mov x0, x25
	bl uint128_t_operator_above_equal

	tst w0, 0xFF
	beq .checkForMoves

.doMinusEqual:
	mov x1, x20
	mov x0, x25
	bl uint128_t_operator_minus_equal

	add x0, sp, 112
	bl uint128_t_operator_plus_plus
	b .checkForMoves

.doMoves:
	add x1, sp, 112
	mov x0, x22
	bl uint128_t_constructor_uint128_t_double_ref

	add x1, sp, 128
	mov x0, x23
	bl uint128_t_constructor_uint128_t_double_ref

	ldp x25, x26, [sp, 64]
	b .return





uint128_t_operator_divide:
	stp x29, x30, [sp, -64]!
	mov x2, x1
	mov x1, x0

	mov x29, sp
	str x19, [sp, 16]
	mov x19, x8

	add x8, sp, 32
	bl uint128_t_divmod

	add x1, sp, 32
	mov x0, x19
	bl uint128_t_constructor_uint128_t_double_ref

	mov x0, x19
	ldr x19, [sp, 16]
	ldp x29, x30, [sp], 64
	ret





uint128_t_operator_divide_equal:
	stp x29, x30, [sp, -48]!
	add x8, sp, 32
	mov x29, sp
	str x19, [sp, 16]
	mov x19, x0

	bl uint128_t_operator_divide
	add x1, sp, 32
	mov x0, x19
	bl uint128_t_operator_equal_const_uint128_t_double_ref

	mov x0, x19
	ldr x19, [sp, 16]
	ldp x29, x30, [sp], 48
	ret





uint128_t_operator_modulo:
	stp x29, x30, [sp, -64]!
	mov x2, x1
	mov x1, x0

	mov x29, sp
	str x19, [sp, 16]
	mov x19, x8

	add x8, sp, 32
	bl uint128_t_divmod

	add x1, sp, 48
	mov x0, x19
	bl uint128_t_constructor_uint128_t_double_ref

	mov x0, x19
	ldr x19, [sp, 16]
	ldp x29, x30, [sp], 64
	ret





uint128_t_operator_modulo_equal:
	stp x29, x30, [sp, -48]!
	add x8, sp, 32
	mov x29, sp
	str x19, [sp, 16]
	mov x19, x0

	bl uint128_t_operator_modulo
	add x1, sp, 32
	mov x0, x19
	bl uint128_t_operator_equal_const_uint128_t_double_ref

	mov x0, x19
	ldr x19, [sp, 16]
	ldp x29, x30, [sp], 48
	ret





uint128_t_operator_plus_plus:
	adrp x1, uint128_1
	add x1, :l012:uint128_1
	b uint128_t_operator_plus_equal





uint128_t_operator_plus_plus_int:
	stp x29, x30, [sp, -48]!
	mov x1, x0
	mov x29, sp
	str x19, [sp, 16]
	mov x19, x0

	mov x0, x8
	str x8, [sp, 40]
	bl uint128_t_constructor

	mov x0, x19
	bl uint128_t_operator_plus_plus

	ldr x8, [sp, 40]
	ldr x19, [sp, 16]
	mov x0, x8
	ldp x29, x30, [sp], 48
	ret





uint128_t_operator_minus_minus:
	adrp x1, uint128_1
	add x1, :lo12:uint128_1
	b uint128_t_operator_minus_equal





uint128_t_operator_minus_minus_int:
	stp x29, x30, [sp, -48]!
	mov x1, x0
	mov x29, sp
	str x19, [sp, 16]
	mov x19, x0

	mov x0, x8
	str x8, [sp, 40]
	bl uint128_t_constructor

	mov x0, x19
	bl uint128_t_operator_minus_minus

	ldr x8, [sp, 40]
	ldr x19, [sp, 16]
	mov x0, x8
	ldp x29, x30, [sp], 48
	ret





uint128_t_operator_single_plus:
	stp x29, x30, [sp, -32]!
	mov x1, x0
	mov x0, x8
	mov x29, sp

	str x8, [sp, 24]
	bl uint128_t_constructor

	ldr x8, [sp, 24]
	ldp x29, x30, [sp], 32
	mov x0, x8
	ret





uint128_t_operator_single_minus:
	stp x29, x30, [sp, -48]!
	mov x29, sp
	str x19, [sp, 16]
	mov x19, x8

	add x8, sp, 32
	bl uint128_t_operator_not

	add x0, sp, 32
	mov x8, x19
	adrp x1, uint128_1
	add x1, :lo12:uint128_1
	bl uint128_t_operator_plus

	mov x0, x19
	ldr x19, [sp, 16]
	ldp x29, x30, [sp], 48
	ret





uint128_t_upper:
	ret





uint128_t_lower:
	add x0, #8
	ret





uint128_t_bits:
	ldr x1, [x0]
	cbnz x1, .x10

	ldr x1, [x0, 8]
	mov w0, 0x40
	clz x2, x1

	cmp x1, 0
	sub w0, w2
	and w0, 0xFF
	csel w0, wzr, ne
	ret

.x10:
	clz x1
	mov w0, -0x80
	sub w0, w1
	and w0, 0xFF
	ret
