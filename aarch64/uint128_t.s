.include "standard.inc"

	.bss

	.p2align 4
uint128_0:
	.zero 16

	.section .rodata

	.p2align 4
uint128_1:
	.quad 0, 1

	.text

START_FUNC uint128_t_constructor_default
	stp xzr, xzr, [x0]
	ret
END_FUNC uint128_t_constructor_default





START_FUNC uint128_t_constructor
START_FUNC uint128_t_operator_equal
	ldr q0, [x1]
	str q0, [x0]
	ret
END_FUNC uint128_t_constructor
END_FUNC uint128_t_operator_equal





START_FUNC uint128_t_constructor_uint128_t_double_ref
	ldr x2, [x1]
	str x2, [x0]
	ldr x2, [x1, 8]
	str x2, [x0, 8]
	cmp x0, x1
	beq .LDREFnoClear

	stp xzr, xzr, [x1]

.LDREFnoClear:
	ret
END_FUNC uint128_t_constructor_uint128_t_double_ref





START_FUNC uint128_t_operator_equal_const_uint128_t_double_ref
	cmp x0, x1
	beq .LEDREFreturn

	ldr x2, [x1]
	str x2, [x0]
	ldr x2, [x1, 8]
	str x2, [x0, 8]
	stp xzr, xzr, [x1]

.LEDREFreturn:
	ret
END_FUNC uint128_t_operator_equal_const_uint128_t_double_ref





START_FUNC uint128_t_operator_cast_bool
	ldp x1, x0, [x0]
	orr x0, x1, x0
	cmp x0, 0
	cset w0, ne
	ret
END_FUNC uint128_t_operator_cast_bool





.macro make_cast name, instr, reg0

START_FUNC \name
	\instr \reg0, [x0, 8]
	ret
END_FUNC \name

.endm

	make_cast uint128_t_operator_cast_uint8_t, ldrb, w0
	make_cast uint128_t_operator_cast_uint16_t, ldrh, w0
	make_cast uint128_t_operator_cast_uint32_t, ldr, w0
	make_cast uint128_t_operator_cast_uint64_t, ldr, x0





.macro make_operator name, instr, reg_1, reg_2, reg_3

START_FUNC \name
	ldr q0, [\reg_1]
	ldr q1, [\reg_2]
	\instr v0.16b, v0.16b, v1.16b
	str q0, [\reg_3]
	ret
END_FUNC \name

.endm

	make_operator uint128_t_operator_and, and, x0, x1, x8
	make_operator uint128_t_operator_and_equal, and, x1, x0, x0
	make_operator uint128_t_operator_or, orr, x0, x1, x8
	make_operator uint128_t_operator_or_equal, orr, x1, x0, x0
	make_operator uint128_t_operator_xor, eor, x0, x1, x8
	make_operator uint128_t_operator_xor_equal, eor, x1, x0, x0





START_FUNC uint128_t_operator_not
	ldr q0, [x0]
	not v0.16b, v0.16b
	str q0, [x8]
	ret
END_FUNC uint128_t_operator_not





START_FUNC uint128_t_operator_shiftLeft
	ldr x2, [x1, 8]
	ldr x1, [x1]
	cmp x2, 0x7F
	ccmp x1, 0, 0, ls
	beq .LLSnot_ret_0

	addr_to_reg x0, uint128_0
	ldr q0, [x0]
	str q0, [x8]

.LLSreturn_x8:
	mov x0, x8
	ret

LABEL_ALIGNED .LLSnot_ret_0
	ldr x1, [x0, 8]
	cmp x2, 64
	beq .LLSshift_eq_64
	cbnz x2, .LLSshift_not_0

	ldr x0, [x0]
	stp x0, x1, [x8]
	b .LLSreturn_x8

LABEL_ALIGNED .LLSshift_eq_64
	stp x1, xzr, [x8]
	b .LLSreturn_x8

LABEL_ALIGNED .LLSshift_not_0
	cmp x2, 0x3F
	bhi .LLSshift_above_3F

	ldr x0, [x0]
	neg w3, w2
	lsl x4, x1, x2
	lsr x1, x1, x3
	lsl x0, x0, x2
	add x0, x0, x1
	stp x0, x4, [x8]
	b .LLSreturn_x8

LABEL_ALIGNED .LLSshift_above_3F
	sub w2, w2, 0x40
	lsl x1, x1, x2
	stp x1, xzr, [x8]
	b .LLSreturn_x8
END_FUNC uint128_t_operator_shiftLeft





START_FUNC uint128_t_operator_shiftLeft_equal
	stp x29, x30, [sp, -48]!
	mov x29, sp
	add x8, sp, 32
	str x19, [sp, 16]
	mov x19, x0

	bl uint128_t_operator_shiftLeft
	ldr q0, [sp, 32]

	mov x0, x19
	str q0, [x19]
	ldr x19, [sp, 16]
	ldp x29, x30, [sp], 48
	ret
END_FUNC uint128_t_operator_shiftLeft_equal





START_FUNC uint128_t_operator_shiftRight
	ldr x9, [x1]
	cbnz x9, .LRSret_0

	ldr x9, [x1, 8]
	cmp x9, 128
	b.hs .LRSret_0
	cbz x9, .LRSshift_0

	cmp x9, 64
	b.ne .LRSshift_not_64

	ldr x9, [x0]
	stp xzr, x9, [x8]
	ret

.LRSshift_0:
	ldr q0, [x0]
	str q0, [x8]
	ret

.LRSshift_not_64:
	cmp x9, 63
	b.hi .LRSshift_above_63

	ldp x10, x11, [x0]
	neg x12, x9
	lsr x13, x10, x9
	lsl x10, x10, x12
	lsr x9, x11, x9
	add x9, x9, x10
	stp x13, x9, [x8]
	ret

.LRSshift_above_63:
	cmp x9, 64
	b.ne .LRSne_64

.LRSret_0:
	addr_to_reg x9, uint128_0
	ldr q0, [x9]
	str q0, [x8]
	ret

.LRSne_64:
	ldr x10, [x0]
	lsr x9, x10, x9
	stp xzr, x9, [x8]
	ret
END_FUNC uint128_t_operator_shiftRight





START_FUNC uint128_t_operator_shiftRight_equal
	stp x29, x30, [sp, -48]!
	mov x29, sp
	add x8, sp, 32
	str x19, [sp, 16]
	mov x19, x0

	bl uint128_t_operator_shiftRight
	ldr q0, [sp, 32]

	mov x0, x19
	str q0, [x19]
	ldr x19, [sp, 16]
	ldp x29, x30, [sp], 48
	ret
END_FUNC uint128_t_operator_shiftRight_equal





START_FUNC uint128_t_operator_exclamation_mark
	ldp x1, x0, [x0]
	orr x0, x1, x0

	cmp x0, 1
	cset w0, eq
	ret
END_FUNC uint128_t_operator_exclamation_mark





START_FUNC uint128_t_operator_and_and
	ldp x8, x9, [x0]
	ldp x10, x11, [x1]
	orr x8, x9, x8
	orr x9, x11, x10

	cmp x8, 0
	cset w8, ne

	cmp x9, 0
	cset w9, ne

	and w0, w8, w9
	ret
END_FUNC uint128_t_operator_and_and





START_FUNC uint128_t_operator_or_or
	ldp x8, x9, [x0]
	ldp x10, x11, [x1]
	orr x8, x9, x8
	orr x9, x11, x10
	orr x8, x8, x9

	cmp x8, 0
	cset w0, ne
	ret
END_FUNC uint128_t_operator_or_or





START_FUNC uint128_t_operator_equal_equal
	ldp x8, x11, [x1]
	ldp x9, x10, [x0]

	cmp x9, x8
	cset w8, eq

	cmp x10, x11
	cset w9, eq

	and w0, w8, w9
	ret
END_FUNC uint128_t_operator_equal_equal





START_FUNC uint128_t_operator_not_equal
	ldp x4, x2, [x0]
	ldp x3, x0, [x1]

	cmp x4, x3
	ccmp x2, x0, 0, eq
	cset w0, ne
	ret
END_FUNC uint128_t_operator_not_equal





.macro make_above_below name, compare1, compare2

START_FUNC \name
	ldp x10, x8, [x0]
	ldp x11, x9, [x1]

	cmp x8, x9
	cset w8, \compare1

	cmp x10, x11
	cset w9, \compare2
	csel w0, w8, w9, eq
	ret
END_FUNC \name

.endm

	make_above_below uint128_t_operator_above, hi, hi
	make_above_below uint128_t_operator_below, lo, lo
	make_above_below uint128_t_operator_above_equal, hs, hi
	make_above_below uint128_t_operator_below_equal, ls, lo





START_FUNC uint128_t_operator_plus
	ldp x9, x10, [x0]
	ldp x11, x12, [x1]
	add x9, x11, x9

	cmn x10, x12
	add x10, x12, x10
	cinc x9, x9, hs

	stp x9, x10, [x8]
	ret
END_FUNC uint128_t_operator_plus





START_FUNC uint128_t_operator_plus_equal
	ldp x5, x4, [x1]
	ldp x1, x3, [x0]

	adds x3, x3, x4
	adc x1, x1, x5

	stp x1, x3, [x0]
	ret
END_FUNC uint128_t_operator_plus_equal





.macro make_sub name, reg_1, reg_2, reg_3, reg_4, reg_5

START_FUNC \name
	ldp x9, x10, [x0]
	ldp x11, x12, [x1]

	subs \reg_1, \reg_1, \reg_2
	sub x9, x9, \reg_3
	cset \reg_4, lo

	sub x9, x9, \reg_3
	stp x9, \reg_1, [\reg_5]
	ret
END_FUNC \name

.endm

	make_sub uint128_t_operator_sub, x10, x12, x11, w11, x8
	make_sub uint128_t_operator_sub_equal, x8, x11, x10, w10, x0





START_FUNC uint128_t_operator_multiply
	ldp x9, x10, [x0]
	ldp x11, x12, [x1]
	lsr x14, x10, 32
	and x15, x10, 0xFFFFFFFF
	lsr x17, x12, 32
	umull x0, w12, w10
	umull x2, w11, w10

	lsr x16, x11, 32
	mul x15, x17, x15
	mul x3, x17, x14

	lsr x4, x0, 32
	lsr x5, x2, 32
	and x18, x12, 0xFFFFFFFF
	add x4, x4, w15, uxtw
	lsr x15, x15, 32
	lsr x7, x3, 32
	madd w10, w16, w10, w5
	umull x1, w12, w9
	mul x18, x18, x14

	add w10, w10, w7
	add x15, x15, w2, uxtw
	lsr x6, x1, 32
	madd w10, w11, w14, w10

	add x11, x15, x18, lsr 32
	add x16, x4, w18, uxtw
	add w10, w10, w6
	add x11, x11, w3, uxtw
	lsr x13, x9, 32
	madd w9, w17, w9, w10

	add x10, x11, x16, lsr 32
	madd w9, w12, w13, w9

	add x10, x10, w1, uxtw
	bfi x0, x16, 32, 32
	add x9, x10, x9, lsl 32

	stp x9, x0, [x8]
	ret
END_FUNC uint128_t_operator_multiply





START_FUNC uint128_t_operator_multiply_equal
	stp x29, x30, [sp, -48]!
	mov x29, sp
	add x8, sp, 32
	str x19, [sp, 16]
	mov x19, x0

	bl uint128_t_operator_multiply
	ldr q0, [sp, 32]

	mov x0, x19
	str q0, [x19]
	ldr x19, [sp, 16]
	ldp x29, x30, [sp], 48
	ret
END_FUNC uint128_t_operator_multiply_equal





START_FUNC uint128_t_divmod
	sub sp, sp, 144
	stp x29, x30, [sp, 64]
	stp x26, x25, [sp, 80]
	stp x24, x23, [sp, 96]
	stp x22, x21, [sp, 112]
	stp x20, x19, [sp, 128]
	add x29, sp, 64

	addr_to_reg x9, uint128_1

	ldp x12, x13, [x9]
	ldp x10, x11, [x2]
	mov x21, x2
	mov x20, x1
	mov x19, x8

	cmp x10, x12
	b.ne .LDMrhs_not_1

	cmp x11, x13
	b.ne .LDMrhs_not_1

.LDMreturn_lhs_0:
	ldr q0, [x20]
	str q0, [x19]
	b .LDMreturn_with_second_0

.LDMrhs_not_1:
	ldp x8, x9, [x20]
	cmp x8, x10
	b.ne .LDMlhs_rhs_not_eq

	cmp x9, x11
	b.ne .LDMlhs_rhs_not_eq

.LDMreturn_1_0:
	stp x12, x13, [x19]

.LDMreturn_with_second_0:
	stp xzr, xzr, [x19, 16]
	b .LDMreturn

.LDMlhs_rhs_not_eq:
	orr x12, x8, x9
	cbz x12, .LDMreturn_0_lhs

	cmp x9, x11
	cset w11, lo

	cmp x8, x10
	cset w10, lo
	csel w10, w11, w10, eq
	cmp w10, 1
	b.ne .LDMcontinue

.LDMreturn_0_lhs:
	stp xzr, xzr, [x19]
	b .LDMreturn_with_x89_second

.LDMcontinue:
	movi v0.2d, 0
	mov x0, x20
	add x25, sp, 16
	stp q0, q0, [sp, 16]
	bl uint128_t_bits

	movi v0.2d, 0
	tst w0, 0xFF
	b.eq .LDMafter_loop

	mov w8, -1
	addr_to_reg x24, uint128_1
	mov w22, w0
	add x23, x25, 16
	add x26, x8, w0, uxtb
	b .LDMstart_loop

.LDMloop:
	sub w22, w22, 1
	and w8, w22, 0xFF
	sub x26, x26, 1
	cbz w8, .LDMfinish_loop

.LDMstart_loop:
	sub x8, x29, 16
	add x0, sp, 16
	mov x1, x24
	bl uint128_t_operator_shiftLeft

	ldur q0, [x29, -16]
	sub x8, x29, 16
	mov x0, x23
	mov x1, x24
	str q0, [sp, 16]
	bl uint128_t_operator_shiftLeft

	ldur q0, [x29, -16]
	and x8, x26, 0xFFFFFFFF
	stp xzr, x8, [x29, -16]
	mov x8, sp
	sub x1, x29, 16
	mov x0, x20
	str q0, [sp, 32]
	bl uint128_t_operator_shiftRight

	ldr x8, [sp, 8]
	tbz w8, 0, .LDMskip_plus_plus

	mov x0, x23
	bl uint128_t_operator_plus_plus

.LDMskip_plus_plus:
	ldp x10, x8, [sp, 32]
	ldp x11, x9, [x21]

	cmp x8, x9
	cset w12, hs

	subs x10, x10, x11
	cset w11, hi
	csel w11, w12, w11, eq

	cmp w11, 1
	b.ne .LDMloop

	cset w9, lo
	sub x9, x10, x9
	add x0, sp, 16
	stp x9, x8, [sp, 32]
	bl uint128_t_operator_plus_plus
	b .LDMloop

.LDMfinish_loop:
	ldr q0, [sp, 16]

.LDMafter_loop:
	add x9, x19, 24
	add x10, x25, 24

	cmp x25, x19
	str q0, [x19]
	csel x9, x9, x10, eq
	ldr x8, [sp, 32]
	ldr x9, [x9]

.LDMreturn_with_x89_second:
	stp x8, x9, [x19, 16]

.LDMreturn:
	ldp x20, x19, [sp, 128]
	ldp x22, x21, [sp, 112]
	ldp x24, x23, [sp, 96]
	ldp x26, x25, [sp, 80]
	ldp x29, x30, [sp, 64]
	add sp, sp, 144
	ret
END_FUNC uint128_t_divmod





.macro make_divide_modulo name, offset

START_FUNC \name
	stp x29, x30, [sp, -64]!
	mov x2, x1
	mov x1, x0

	mov x29, sp
	str x19, [sp, 16]
	mov x19, x8

	add x8, sp, 32
	bl uint128_t_divmod

	ldr q0, [sp, \offset]
	mov x0, x19
	str q0, [x19]
	ldr x19, [sp, 16]
	ldp x29, x30, [sp], 64
	ret
END_FUNC \name

.endm

.macro make_divide_modulo_equal name, func

START_FUNC \name
	stp x29, x30, [sp, -48]!
	mov x29, sp
	add x8, sp, 32
	str x19, [sp, 16]
	mov x19, x0

	bl \func
	ldr q0, [sp, 32]
	mov x0, x19
	str q0, [x19]

	ldr x19, [sp, 16]
	ldp x29, x30, [sp], 48
	ret
END_FUNC \name

.endm

	make_divide_modulo uint128_t_operator_divide, 32
	make_divide_modulo_equal uint128_t_operator_divide_equal, uint128_t_operator_divide
	make_divide_modulo uint128_t_operator_modulo, 48
	make_divide_modulo_equal uint128_t_operator_modulo_equal, uint128_t_operator_modulo





START_FUNC uint128_t_operator_plus_plus
	ldp x9, x8, [x0]
	adds x8, x8, 1
	cinc x9, x9, hs
	stp x9, x8, [x0]
	ret
END_FUNC uint128_t_operator_plus_plus





START_FUNC uint128_t_operator_plus_plus_int
	ldr q0, [x0]
	str q0, [x8]
	b uint128_t_operator_plus_plus
END_FUNC uint128_t_operator_plus_plus_int





START_FUNC uint128_t_operator_minus_minus
	ldp x3, x2, [x0]

	cmp x2, 0
	sub x2, x2, 1
	cset x4, eq

	sub x3, x3, x4
	stp x3, x2, [x0]
	ret
END_FUNC uint128_t_operator_minus_minus





START_FUNC uint128_t_operator_minus_minus_int
	ldr q0, [x0]
	str q0, [x8]
	b uint128_t_operator_minus_minus
END_FUNC uint128_t_operator_minus_minus_int





START_FUNC uint128_t_operator_single_plus
	ldr q0, [x0]
	str q0, [x8]
	ret
END_FUNC uint128_t_operator_single_plus





START_FUNC uint128_t_operator_single_minus
	ldp x9, x10, [x0]

	neg x11, x9
	cmp x10, 0
	neg x10, x10
	csinv x9, x11, x9, eq

	stp x9, x10, [x8]
	ret
END_FUNC uint128_t_operator_single_minus





	make_empty_func uint128_t_upper





START_FUNC uint128_t_lower
	add x0, x0, 8
	ret
END_FUNC uint128_t_lower





START_FUNC uint128_t_bits
	ldr x1, [x0]
	cbnz x1, .LBx10

	ldr x1, [x0, 8]
	mov w0, 0x40
	clz x2, x1

	cmp x1, 0
	sub w0, w0, w2
	and w0, w0, 0xFF
	csel w0, w0, wzr, ne
	ret

.LBx10:
	clz x1, x1
	mov w0, -0x80
	sub w0, w0, w1
	and w0, w0, 0xFF
	ret
END_FUNC uint128_t_bits
