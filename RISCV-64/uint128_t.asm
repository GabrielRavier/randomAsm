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
	ld a5, 8(a1)
	ld a4, 0(a1)

	not a5
	not a4

	sd a4, 0(a0)
	sd a5, 8(a0)
	ret





uint128_t_operator_shiftLeft:
	ld a5, 0(a2)
	addi sp, -0x10
	sd s0, 0(sp)
	sd ra, 8(sp)
	mv s0, a0
	bnez a5, .ret0

	ld a5, 8(a2)
	li a4, 0x7F
	bleu a5, a4, .continue

.ret0:
	lui a1, %hi(uint128_0)
	addi a1, %lo(uint128_0)
	mv a0, s0
	call uint128_t_constructor

.return:
	mv a0, s0
	ld ra, 8(sp)
	ld s0, 0(sp)
	addi sp, 0x10
	jr ra

.continue:
	li a4, 0x40
	beq a5, a4, .return2
	beqz a5, .doCnst

	li a4, 0x3F
	bgtu a5, a4, .doShifts

	ld a2, 8(a1)
	ld a4, 0(a1)
	sext.w a5

	li a3, 0x40
	subw a3, a5
	sll a4, a5
	srl a3, a2, a3
	add a4, a3
	sll a5, a2, a5

	sd a4, 0(a0)
	sd a5, 8(a0)
	j .return

.doCnst:
	call uint128_t_constructor
	j .return

.return2:
	ld a5, 8(a1)
	ld ra, 8(sp)
	sd zero, 8(a0)
	sd a5, 0(a0)

	mv a0, s0
	ld s0, 0(sp)
	addi sp, 0x10
	jr ra

.doShifts:
	addi a4, a5, -0x41
	li a2, 0x3E
	bgtu a4, a2, .ret0

	ld a4, 8(a1)
	addiw a5, -0x40
	sd zero, 8(a0)
	sll a5, a4, a5
	sd a5, 0(a0)
	j .return





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
	ld a5, 0(a2)
	addi sp, -0x10
	sd s0, 0(sp)
	sd ra, 8(sp)
	mv s0, a0
	bnez a5, .ret0

	ld a5, 8(a2)
	li a4, 0x7F
	bleu a5, a4, .continue

.ret0:
	lui a1, %hi(uint128_0)
	addi a1, %lo(uint128_0)
	mv a0, s0
	call uint128_t_constructor

.return:
	mv a0, s0
	ld ra, 8(sp)
	ld s0, 0(sp)
	addi sp, 0x10
	jr ra

.continue:
	li a4, 0x40
	beq a5, a4, .return2
	beqz a5, .doCnst

	li a4, 0x3F
	bgtu a5, a4, .doShifts

	ld a2, 8(a1)
	ld a4, 0(a1)
	sext.w a5

	li a3, 0x40
	subw a3, a5
	srl a4, a5
	sll a3, a2, a3
	add a4, a3
	srl a5, a2, a5

	sd a4, 0(a0)
	sd a5, 8(a0)
	j .return

.doCnst:
	call uint128_t_constructor
	j .return

.return2:
	ld a5, 8(a1)
	ld ra, 8(sp)
	sd zero, 8(a0)
	sd a5, 0(a0)

	mv a0, s0
	ld s0, 0(sp)
	addi sp, 0x10
	jr ra

.doShifts:
	addi a4, a5, -0x41
	li a2, 0x3E
	bgtu a4, a2, .ret0

	ld a4, 8(a1)
	addiw a5, -0x40
	sd zero, 8(a0)
	srl a5, a4, a5
	sd a5, 0(a0)
	j .return





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
	ld a5, 0(a0)
	ld a0, 8(a0)
	or a0, a5, a0
	seqz a0
	ret





uint128_t_operator_and_and:
	addi sp, -0x10
	sd s0, 0(sp)
	sd ra, 8(sp)
	mv s0, a1

	call uint128_t_operator_cast_bool
	bnez a0, .continue

	ld ra, 8(sp)
	ld s0, 0(sp)
	addi sp, 0x10
	jr ra

.continue:
	mv a0, s0
	ld s0, 0(sp)
	ld ra, 8(sp)
	addi sp, 0x10
	tail uint128_t_operator_cast_bool





uint128_t_operator_or_or:
	addi sp, -0x10
	sd s0, 0(sp)
	sd ra, 8(sp)
	mv s0, a1

	call uint128_t_operator_cast_bool
	beqz a0, .continue

	ld ra, 8(sp)
	ld s0, 0(sp)
	addi sp, 0x10
	jr ra

.continue:
	mv a0, s0
	ld s0, 0(sp)
	ld ra, 8(sp)
	addi sp, 0x10
	tail uint128_t_operator_cast_bool





uint128_t_operator_equal_equal:
	ld a4, 0(a0)
	ld a5, 0(a1)
	beq a4, a5, .continue

	li a0, 0
	ret

.continue:
	ld a0, 8(a0)
	ld a1, 8(a1)
	sub a0, a5
	seqz a0
	ret





uint128_t_operator_not_equal:
	addi sp, -0x10
	sd ra, 8(sp)

	call uint128_t_operator_equal_equal
	ld ra, 8(sp)

	xori a0, 1
	andi a0, 0xFF
	addi sp, 0x10
	jr ra





uint128_t_operator_above:
	ld a5, 0(a0)
	ld a4, 0(a1)
	beq a5, a4, .continue

	sgtu a0, a,
	ret

.continue:
	ld a0, 8(a0)
	ld a5, 8(a1)
	sgtu a0, a5
	ret





uint128_t_operator_below:
	addi sp, -0x20
	sd s0, 16(sp)
	sd s1, 8(sp)
	sd ra, 24(sp)

	mv s0, a0
	mv s1, a1
	call uint128_t_operator_equal_equal
	beqz a0, .continue

	ld ra, 24(sp)
	ld s0, 16(sp)
	ld s1, 8(sp)
	li a0, 0
	addi sp, 0x20
	jr ra

.continue:
	mv a1, s1
	mv a0, s0
	call uint128_t_operator_above

	ld ra, 24(sp)
	ld s0, 16(sp)
	xori a0, 1
	ld s1, 8(sp)
	andi a0, 0xFF
	addi sp, 0x20
	jr ra





uint128_t_operator_above_equal:
	addi sp, -0x10
	sd ra, 8(sp)

	call uint128_t_operator_below
	ld ra, 8(sp)

	xori a0, 1
	andi a0, 0xFF
	addi sp, 0x10
	jr ra






uint128_t_operator_below_equal:
	addi sp, -0x10
	sd ra, 8(sp)

	call uint128_t_operator_above
	ld ra, 8(sp)

	xori a0, 1
	andi a0, 0xFF
	addi sp, 0x10
	jr ra





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
