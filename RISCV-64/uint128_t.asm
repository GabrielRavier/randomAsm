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
	ld a3, 0(a1)
	ld a4, 0(a2)
	ld a5, 0(a1)
	ld a2, 0(a2)

	add a4, a3, a4
	sgtu a3, a4
	add a5, a2
	add a5, a3

	sd a5, 0(a0)
	sd a4, 8(a0)
	ret





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
	ld a4, 8(a1)
	ld a6, 8(a2)
	ld a5, 0(a1)
	ld a1, 0(a2)

	sgtu a2, a6, a4
	sub a4, a6
	sub a5, a1
	sub a5, a2

	sd a5, 0(a0)
	sd a4, 8(a0)
	ret





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
	ld a6, 8(a1)
	ld a3, 8(a2)
	ld a5, 0(a2)

	li a4, -1
	srli a4, 0x20
	and t1, a6, a4

	srli t5, a3, 0x20
	and t0, a5, a4
	mul a2, t1, t5

	srli a5, 0x20
	and t3, a3, a4

	srli a3, a6, 0x20
	ld a1, 0(a1)
	and t4, a1, a4

	srli a1, 0x20
	mul t0, t1, t0

	srli t2, a2, 0x20
	and a2, a4
	mul a5, t1
	and a6, t6, a4
	and a6, t2

	srli t6, 0x20
	mul t1, t3
	and a5, a4
	add a5, t6
	mul t0, a3, t0

	srli t6, t1, 0x20
	add t6, a2, t6
	and t1, a4
	mul t2, a3, t5
	and t0, a4
	add a5, t0
	mul a3, t3
	and a2, t2, a4

	srli t2, 0x20
	add t0, a5, t2
	add a6, a2
	mul a5, t4, t3
	and a2, a3, a4
	add a2, t6

	srli a3, 0x20
	add a3, a6, a3

	srli a6, a2, 0x20
	slli a2, 0x20
	or a2, t1

	sd a2, 8(a0)
	and a2, a5, a4
	mul t4, t5
	add a3, a2, a3
	add a3, a6, a3
	and a2, a3, a4

	srli t1, a5, 0x20
	srli a5, a3, 0x20
	mul a3, a1, t3

	and t4, a4
	add t4, t0, t4
	add t4, t1

	and a4, a3, a4
	add a4, t4
	add a5, a4

	slli a5, 0x20
	or a5, a2
	sd a5, 0(a0)
	ret





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
	addi sp, -0x80
	sd s3, 88(sp)
	lui s3, %hi(uint128_1)
	sd s0, 112(sp)
	addi a1, s3, %lo(uint128_1)
	mv s0, a0
	mv a0, a3
	sd s1, 104(sp)
	sd s2, 96(sp)
	sd s4, 80(sp)
	mv s2, a2
	sd ra, 120(sp)
	sd s5, 72(sp)
	sd s6, 64(sp)
	mv s1, a3

	call uint128_t_operator_equal_equal
	addi s4, s0, 0x10
	mv a1, s2
	bnez a0, .doConstructs

	mv a1, s1
	mv a0, s2
	call uint128_t_operator_equal_equal
	beqz a0, .check0

	addi a1, s3, %lo(uint128_1)

.doConstructs:
	mv a0, s0
	call uint128_t_constructor

	lui a1, %hi(uint128_0)
	addi a1, %lo(uint128_0)
	mv a0, s4
	call uint128_t_constructor

.return:
	mv a0, s0
	ld ra, 120(sp)
	ld s0, 112(sp)
	ld s1, 104(sp)
	ld s2, 96(sp)
	ld s3, 88(sp)
	ld s4, 80(sp)
	ld s5, 72(sp)
	ld s6, 64(sp)
	addi sp, 0x80
	jr ra

.check0:
	lui s5, %hi(uint128_0)
	addi a1, s5, %lo(uint128_0)
	mv a0, s2
	call uint128_t_operator_equal_equal
	beqz a0, .checkBelow

.do0s:
	addi a1, s5, %lo(uint128_0)
	mv a0, s0
	call uint128_t_constructor

	mv a1, s2
	mv a0, s4
	call uint128_t_constructor
	j .return

.checkBelow:
	mv a1, s1
	mv a0, s2
	call uint128_t_operator_below
	bnez a0, .do0s

	addi a1, s5, %lo(uint128_0)
	addi a0, sp, 0x20
	call uint128_t_constructor

	addi a0, sp, 0x30
	addi a1, s5, %lo(uint128_0)
	call uint128_t_constructor

	mv a0, s2
	call uint128_t_bits
	beqz a0, .doMoves

	sext.w s5, a0
	addiw a0, -1
	addiw s6, s5, -2
	andi a0, 0xFF
	addiw s5, -1
	subw s6, a0

.gotNe:
	addi a1, s3, %lo(uint128_1)
	addi a0, sp, 0x20
	call uint128_t_operator_shiftLeft_equal

	addi a1, s3, %lo(uint128_1)
	addi a0, sp, 0x30
	call uint128_t_operator_shiftLeft_equal

	slli a5, s5, 0x20
	srli a5, 0x20

	addi a2, sp, 0x10
	mv a1, s2
	mv a0, sp

	sd a5, 24(sp)
	sd zero, 16(sp)
	call uint128_t_operator_shiftRight

	ld a5, 8(sp)
	addi a0, sp, 0x10
	sd zero, 16(sp)
	andi a5, 1
	sd a5, 24(sp)

	call uint128_t_operator_cast_bool
	addiw s5, -1
	bnez a0, .doPlusPlus

.checkAboveEq:
	mv a1, s1
	addi a0, sp, 0x30
	call uint128_t_operator_above_equal
	bnez a0, .doMinEq

.checkNe:
	bne s6, s5, .gotNe

.doMoves:
	addi a1, sp, 0x20
	mv a0, s0
	call uint128_t_constructor_uint128_t_double_ref

	addi a1, sp, 0x30
	mv a0, s4
	call uint128_t_constructor_uint128_t_double_ref
	j .return

.doMinEq:
	mv a1, s1
	addi a0, sp, 0x30
	call uint128_t_operator_minus_equal

	addi a0, sp, 0x20
	call uint128_t_operator_plus_plus
	j .checkNe

.doPlusPlus:
	addi a0, sp, 0x30
	call uint128_t_operator_plus_plus
	j .checkAboveEq





uint128_t_operator_divide:
	addi sp, -0x30
	sd s0, 32(sp)
	mv a3, a2
	mv s0, a0
	mv a2, a1
	mv a0, sp
	sd ra, 40(sp)
	call uint128_t_divmod

	mv a0, s0
	mv a1, sp
	call uint128_t_constructor_uint128_t_double_ref

	mv a0, s0
	ld ra, 40(sp)
	ld s0, 32(sp)
	addi sp, 0x30
	jr ra





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
	addi sp, -0x30
	sd s0, 32(sp)
	mv a3, a2
	mv s0, a0
	mv a2, a1
	mv a0, sp
	sd ra, 40(sp)
	call uint128_t_divmod

	mv a0, s0
	addi a1, sp, 0x10
	call uint128_t_constructor_uint128_t_double_ref

	mv a0, s0
	ld ra, 40(sp)
	ld s0, 32(sp)
	addi sp, 0x30
	jr ra





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
	lui a1, %hi(uint128_1)
	addi a1, %lo(uint128_1)
	tail uint128_t_operator_plus_equal





uint128_t_operator_plus_plus_int:
	addi sp, -0x20
	sd ra, 24(sp)
	sd s0, 16(sp)
	sd s1, 8(sp)
	mv s0, a0
	mv s1, a1

	call uint128_t_constructor

	mv a0, s1
	call uint128_t_operator_plus_plus

	mv a0, s0
	ld ra, 24(sp)
	ld s0, 16(sp)
	ld s1, 8(sp)
	addi sp, 0x20
	jr ra





uint128_t_operator_minus_minus:
	lui a1, %hi(uint128_1)
	addi a1, %lo(uint128_1)
	tail uint128_t_operator_minus_equal





uint128_t_operator_minus_minus_int:
	addi sp, -0x20
	sd ra, 24(sp)
	sd s0, 16(sp)
	sd s1, 8(sp)
	mv s0, a0
	mv s1, a1

	call uint128_t_constructor

	mv a0, s1
	call uint128_t_operator_minus_minus

	mv a0, s0
	ld ra, 24(sp)
	ld s0, 16(sp)
	ld s1, 8(sp)
	addi sp, 0x20
	jr ra





uint128_t_operator_single_plus:
	addi sp, -0x10
	sd s0, 0(sp)
	sd ra, 8(sp)
	mv s0, a0

	call uint128_t_constructor

	mv a0, s0
	ld ra, 8(sp)
	ld s0, 0(sp)
	addi sp, 0x10
	jr ra





uint128_t_operator_single_minus:
	addi sp, -0x20
	sd s0, 16(sp)
	mv s0, a0
	mv a0, sp
	sd ra, 24(sp)

	call uint128_t_operator_not
	lui a2, %hi(uint128_1)
	mv a0, s0
	mv a1, sp
	addi a2, %lo(uint128_1)
	call uint128_t_operator_plus

	mv a0, s0
	ld ra, 24(sp)
	ld s0, 16(sp)
	addi sp, 0x20
	jr ra





uint128_t_upper:
	ret





uint128_t_lower:
	addi a0, 8
	ret





uint128_t_bits:
	ld a5, 0(a0)
	addi sp, -0x10
	sd ra, 8(sp)
	bnez a5, .nez2

	ld a5, 8(a0)
	li a0, 0
	bnez a5, .nez

	ld ra, 8(sp)
	addi sp, 0x10
	jr ra

.nez:
	mv a0, a5
	call __clzdi2

	ld ra, 8(sp)
	li a5, 0x40
	subw a0, a5, a0
	andi a0, 0xFF

	addi sp, 0x10
	jr ra

.nez2:
	mv a0, a5
	call __clzdi2

	ld ra, 8(sp)
	li a5, -0x80
	subw a0, a5, a0
	andi a0, 0xFF

	addi sp, 0x10
	jr ra
