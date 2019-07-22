	.bss

uint128_0:
	.zero 16

	.data

uint128_1:
	.quad 0, 1

	.text

uint128_t_constructor_default:
	sd zero, 0(a0)
	sd zero, 8(a0)
	ret





uint128_t_constructor:
uint128_t_operator_equal:
	ld a4, 0(a1)
	ld a5, 8(a1)
	sd a4, 0(a0)
	sd a5, 8(a0)
	ret





uint128_t_constructor_uint128_t_double_ref:
	ld a5, 0(a1)
	sd a5, 0(a0)
	ld a5, 8(a1)
	sd a5, 8(a0)
	beq a0, a1, .return

	sd zero, 0(a1)
	sd zero, 8(a1)

.return:
	ret





uint128_t_operator_equal_const_uint128_t_double_ref:
	beq a0, a1, .return

	ld a5, 0(a1)
	sd a5, 0(a0)
	ld a5, 8(a1)
	sd a5, 8(a0)

	sd zero, 0(a1)
	sd zero, 8(a1)

.return:
	ret





uint128_t_operator_cast_bool:
	ld a5, 0(a0)
	ld a0, 8(a0)
	or a0, a5, a0
	snez a0
	ret





uint128_t_operator_cast_uint8_t:
	lbu a0, 8(a0)
	ret





uint128_t_operator_cast_uint16_t:
	lhu a0, 8(a0)
	ret





uint128_t_operator_cast_uint32_t:
	lw a0, 8(a0)
	ret





uint128_t_operator_cast_uint64_t:
	ld a0, 8(a0)
	ret





uint128_t_operator_and:
	ld a6, 8(a2)
	ld a5, 8(a1)
	ld a4, 0(a1)
	ld a2, 0(a2)
	and a5, a6

	sd a5, 8(a0)
	and a4, a2
	sd a4, 0(a0)
	ret





uint128_t_operator_and_equal:
	addi sp, -0x20
	sd s0, 16(sp)

	mv s0, a0
	mv a2, a1
	mv a0, sp
	mv a1, s0
	sd ra, 24(sp)
	call uint128_t_operator_and

	mv a1, sp
	mv a0, s0
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mv a0, s0
	ld ra, 24(sp)
	ld s0, 16(sp)
	addi sp, 0x20
	jr ra





uint128_t_operator_or:
	ld a6, 8(a2)
	ld a5, 8(a1)
	ld a4, 0(a1)
	ld a2, 0(a2)
	or a5, a6

	sd a5, 8(a0)
	or a4, a2
	sd a4, 0(a0)
	ret





uint128_t_operator_or_equal:
	addi sp, -0x20
	sd s0, 16(sp)

	mv s0, a0
	mv a2, a1
	mv a0, sp
	mv a1, s0
	sd ra, 24(sp)
	call uint128_t_operator_or

	mv a1, sp
	mv a0, s0
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mv a0, s0
	ld ra, 24(sp)
	ld s0, 16(sp)
	addi sp, 0x20
	jr ra





uint128_t_operator_xor:
	ld a6, 8(a2)
	ld a5, 8(a1)
	ld a4, 0(a1)
	ld a2, 0(a2)
	xor a5, a6

	sd a5, 8(a0)
	xor a4, a2
	sd a4, 0(a0)
	ret





uint128_t_operator_xor_equal:
	addi sp, -0x20
	sd s0, 16(sp)

	mv s0, a0
	mv a2, a1
	mv a0, sp
	mv a1, s0
	sd ra, 24(sp)
	call uint128_t_operator_xor

	mv a1, sp
	mv a0, s0
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mv a0, s0
	ld ra, 24(sp)
	ld s0, 16(sp)
	addi sp, 0x20
	jr ra





uint128_t_operator_not:





uint128_t_operator_shiftLeft:





uint128_t_operator_shiftLeft_equal:
	addi sp, -0x20
	sd s0, 16(sp)

	mv s0, a0
	mv a2, a1
	mv a0, sp
	mv a1, s0
	sd ra, 24(sp)
	call uint128_t_operator_shiftLeft

	mv a1, sp
	mv a0, s0
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mv a0, s0
	ld ra, 24(sp)
	ld s0, 16(sp)
	addi sp, 0x20
	jr ra





uint128_t_operator_shiftRight:





uint128_t_operator_shiftRight_equal:
	addi sp, -0x20
	sd s0, 16(sp)

	mv s0, a0
	mv a2, a1
	mv a0, sp
	mv a1, s0
	sd ra, 24(sp)
	call uint128_t_operator_shiftRight

	mv a1, sp
	mv a0, s0
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mv a0, s0
	ld ra, 24(sp)
	ld s0, 16(sp)
	addi sp, 0x20
	jr ra





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
	addi sp, -0x20
	sd s0, 16(sp)

	mv s0, a0
	mv a2, a1
	mv a0, sp
	mv a1, s0
	sd ra, 24(sp)
	call uint128_t_operator_plus

	mv a1, sp
	mv a0, s0
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mv a0, s0
	ld ra, 24(sp)
	ld s0, 16(sp)
	addi sp, 0x20
	jr ra





uint128_t_operator_minus:





uint128_t_operator_minus_equal:
	addi sp, -0x20
	sd s0, 16(sp)

	mv s0, a0
	mv a2, a1
	mv a0, sp
	mv a1, s0
	sd ra, 24(sp)
	call uint128_t_operator_minus

	mv a1, sp
	mv a0, s0
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mv a0, s0
	ld ra, 24(sp)
	ld s0, 16(sp)
	addi sp, 0x20
	jr ra





uint128_t_operator_multiply:





uint128_t_operator_multiply_equal:
	addi sp, -0x20
	sd s0, 16(sp)

	mv s0, a0
	mv a2, a1
	mv a0, sp
	mv a1, s0
	sd ra, 24(sp)
	call uint128_t_operator_multiply

	mv a1, sp
	mv a0, s0
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mv a0, s0
	ld ra, 24(sp)
	ld s0, 16(sp)
	addi sp, 0x20
	jr ra





uint128_t_divmod:





uint128_t_operator_divide:





uint128_t_operator_divide_equal:
	addi sp, -0x20
	sd s0, 16(sp)

	mv s0, a0
	mv a2, a1
	mv a0, sp
	mv a1, s0
	sd ra, 24(sp)
	call uint128_t_operator_divide

	mv a1, sp
	mv a0, s0
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mv a0, s0
	ld ra, 24(sp)
	ld s0, 16(sp)
	addi sp, 0x20
	jr ra





uint128_t_operator_modulo:





uint128_t_operator_modulo_equal:
	addi sp, -0x20
	sd s0, 16(sp)

	mv s0, a0
	mv a2, a1
	mv a0, sp
	mv a1, s0
	sd ra, 24(sp)
	call uint128_t_operator_modulo

	mv a1, sp
	mv a0, s0
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mv a0, s0
	ld ra, 24(sp)
	ld s0, 16(sp)
	addi sp, 0x20
	jr ra





uint128_t_operator_plus_plus:





uint128_t_operator_plus_plus_int:





uint128_t_operator_minus_minus:





uint128_t_operator_minus_minus_int:





uint128_t_operator_single_plus:





uint128_t_operator_single_minus:





uint128_t_upper:





uint128_t_lower:





uint128_t_bits:
