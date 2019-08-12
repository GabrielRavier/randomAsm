	.bss

uint128_0:
	.zero 16

	.data

uint128_1:
	.quad 0, 1

	.text

uint128_t_constructor_default:
	sw zero, 12(a0)
	sw zero, 8(a0)
	sw zero, 4(a0)
	sw zero, 0(a0)
	ret





uint128_t_constructor:
uint128_t_operator_equal:
	lw a2, 0(a1)
	lw a3, 4(a1)
	sw a3, 4(a0)
	sw a2, 0(a0)

	lw a2, 8(a1)
	lw a1, 12(a1)
	sw a1, 12(a0)
	sw a2, 8(a0)
	ret





uint128_t_constructor_uint128_t_double_ref:
	lw a2, 0(a1)
	lw a3, 4(a1)
	sw a3, 4(a0)
	sw a2, 0(a0)

	lw a2, 8(a1)
	lw a1, 12(a1)
	sw a1, 12(a0)
	sw a2, 8(a0)
	beq a0, a1, .return

	sw zero, 12(a0)
	sw zero, 8(a0)
	sw zero, 4(a0)
	sw zero, 0(a0)

.return:
	ret




uint128_t_operator_equal_const_uint128_t_double_ref:
	beq a0, a2, .return

	lw a2, 0(a1)
	lw a3, 4(a1)
	sw a3, 4(a0)
	sw a2, 0(a0)

	lw a2, 8(a1)
	lw a1, 12(a1)
	sw a1, 12(a0)
	sw a2, 8(a0)

	sw zero, 4(a1)
	sw zero, 12(a1)
	sw zero, 8(a1)
	sw zero, 0(a1)

.return:
	ret





uint128_t_operator_cast_bool:
	lw a1, 4(a0)
	lw a2, 12(a0)
	or a1, a2

	lw a2, 0(a0)
	lw a0, 8(a0)
	or a0, a2
	or a0, a1

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
	lw a1, 12(a0)
	lw a0, 8(a0)
	ret





uint128_t_operator_and:
	lw a3, 8(a1)
	lw a4, 8(a2)
	and a3, a4

	lw a6, 4(a2)
	lw a5, 0(a2)
	lw a2, 12(a2)
	lw a7, 4(a1)
	lw a4, 0(a1)
	lw a1, 12(a1)

	sw a3, 8(a0)

	and a1, a2
	sw a1, 12(a0)

	and a1, a5, a4
	sw a1, 0(a0)

	and a1, a6, a7
	sw a1, 4(a0)
	ret





uint128_t_operator_and_equal:
	addi sp, -0x20
	sw ra, 28(sp)
	sw s0, 24(sp)
	sw s1, 20(sp)

	mv a2, a1
	mv s0, a0
	mv s1, sp
	mv a0, s1
	mv a1, s0
	call uint128_t_operator_and

	mv a0, s0
	mv a1, s1
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mv a0, s0
	lw s1, 20(sp)
	lw s0, 24(sp)
	lw ra, 28(sp)
	addi sp, 0x20
	ret





uint128_t_operator_or:
	lw a3, 8(a1)
	lw a4, 8(a2)
	or a3, a4

	lw a6, 4(a2)
	lw a5, 0(a2)
	lw a2, 12(a1)
	lw a7, 4(a1)
	lw a4, 0(a1)
	lw a1, 12(a1)

	sw a3, 8(a0)

	or a1, a2
	sw a1, 12(a0)

	or a1, a5, a4
	sw a1, 0(a0)

	or a1, a6, a7
	sw a1, 4(a0)
	ret





uint128_t_operator_or_equal:
	addi sp, -0x20
	sw ra, 28(sp)
	sw s0, 24(sp)
	sw s1, 20(sp)

	mv a2, a1
	mv s0, a0
	mv s1, sp
	mv a0, s1
	mv a1, s0
	call uint128_t_operator_or

	mv a0, s0
	mv a1, s1
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mv a0, s0
	lw s1, 20(sp)
	lw s0, 24(sp)
	lw ra, 28(sp)
	addi sp, 0x20
	ret





uint128_t_operator_xor:
	lw a3, 8(a1)
	lw a4, 8(a2)
	xor a3, a4

	lw a6, 4(a2)
	lw a5, 0(a2)
	lw a2, 12(a2)
	lw a7, 4(a1)
	lw a4, 0(a1)
	lw a1, 12(a1)

	sw a3, 8(a0)

	xor a1, a2
	sw a1, 12(a0)

	xor a1, a5, a4
	sw a1, 0(a0)

	xor a1, a6, a7
	sw a1, 4(a0)
	ret





uint128_t_operator_xor_equal:
	addi sp, -0x20
	sw ra, 28(sp)
	sw s0, 24(sp)
	sw s1, 20(sp)

	mv a2, a1
	mv s0, a0
	mv s1, sp
	mv a0, s1
	mv a1, s0
	call uint128_t_operator_xor

	mv a0, s0
	mv a1, s1
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mv a0, s0
	lw s1, 20(sp)
	lw s0, 24(sp)
	lw ra, 28(sp)
	addi sp, 0x20
	ret





uint128_t_operator_not:
	lw a2, 4(a1)
	lw a3, 0(a1)
	lw a4, 12(a1)
	lw a1, 8(a1)

	not a1
	sw a1, 8(a0)

	not a1, a4
	sw a1, 12(a0)

	not a1, a3
	sw a1, 0(a0)

	not a1, a2
	sw a1, 4(a0)
	ret





uint128_t_operator_shiftLeft:
	addi sp, -0x10
	sw ra, 12(sp)

	lw a3, 8(a2)
	lw a4, 12(a2)
	beqz a4, .do7F

	snez a5, a4
	bnez a5, .do0

.up:
	lw a5, 4(a2)
	lw a2, 0(a2)

	or a2, a5
	bnez a2, .do0

	or a2, a3, a4
	beqz a2, .doCnst

	xori a2, a3, 0x40
	or a2, a4
	bnez a2, .doChecks

	lw a2, 8(a1)
	lw a1, 12(a1)
	sw zero, 12(a0)
	sw zero, 8(a0)
	sw a1, 4(a0)
	sw a2, 0(a0)
	lw ra, 12(sp)
	addi sp, 0x10
	ret

.do7F:
	li a5, 0x7F
	sltu a5, a3

	beqz a5, .up
	j .do0

.doChecks:
	beqz a4, .do3F

	snez a4
	beqz a4, .do40

.finalCheck:
	bnez a2, .doSll3

.do0:
	lui a1, %hi(uint128_0)
	addi a1, %lo(uint128_0)

.doCnst:
	call uint128_t_constructor

	lw ra, 12(sp)
	addi sp, 0x10
	ret

.do3F:
	li a4, 0x3F
	sltu a4, a3
	bnez a4, .finalCheck

.do40:
	li a2, 0x40
	sub t2, a2, a3
	li t1, 0x1F

	lw a5, 12(a1)
	lw a6, 0(a1)
	lw t3, 8(a1)
	lw a7, 4(a1)

	li a1, 0x20
	sub a1, a3
	bltz a1, .doSub

	srl t0, a5, a1
	sub t1, a3

	addi a2, a3, -0x20
	bgez a2, .doSll

.doSrlSll:
	srli a4, a6, 1
	srl t4, a4, t1
	sll a4, a7, a3
	or a7, a4, t4
	bgez a1, .doLi0

.doSrl:
	srl a1, a5, t2
	bgez a2, .doSll2

.doSrli:
	srli a2, t3, 1
	srl a2, t1
	sll a4, a5, a3
	or a2, a4
	sll a4, t3, a3
	sll a3, a6, a3
	j .doSwLw

.doSub:
	sub a4, t1, t0
	srli a1, a5, 1
	srl a1, a4
	sll a4, t2, t0
	or a6, a4, a1
	sub t1, a3

	addi a4, a3, -0x20
	bltz a4, .doSrlSll

.doSll:
	srl a1, a7, a4
	bltz a2, .doSrl

.doLi0:
	li a2, 0
	bltz a4, .doSrli

.doSll2:
	srl a4, t2, a4
	li a3, 0
	li a4, 0

.doSwLw:
	sw a5, 4(a0)
	sw a4, 0(a0)
	add a2, a1

	sw a2, 8(a0)
	sltu a1, a2, a1
	add a2, a3, a6
	add a1, a2

	sw a1, 12(a0)

	lw ra, 12(sp)
	addi sp, 0x10
	ret

.doSll3:
	lw a2, 8(a1)
	addi a4, a3, -0x60
	bltz a4, .doSub2

	srl a1, a2, a4
	li a2, 0
	j .return

.doSub2:
	li a4, 0x5F
	sub a4, a3
	slli a5, a2, 1
	sll a4, a5, a4

	lw a1, 0(a1)
	addi a3, -0x40
	srl a1, a3
	or a1, a4
	srl a2, a3

.return:
	sw zero, 4(a0)
	sw zero, 0(a0)
	sw a2, 12(a0)
	sw a1, 8(a0)
	lw ra, 12(sp)
	addi sp, 0x10
	ret





uint128_t_operator_shiftLeft_equal:
	addi sp, -0x20
	sw ra, 28(sp)
	sw s0, 24(sp)
	sw s1, 20(sp)

	mv a2, a1
	mv s0, a0
	mv s1, sp
	mv a0, s1
	mv a1, s0
	call uint128_t_operator_shiftLeft

	mv a0, s0
	mv a1, s1
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mv a0, s0
	lw s1, 20(sp)
	lw s0, 24(sp)
	lw ra, 28(sp)
	addi sp, 0x20
	ret





uint128_t_operator_shiftRight:
	addi sp, -0x10
	sw ra, 12(sp)

	lw a3, 8(a2)
	lw a4, 12(a2)
	beqz a4, .do7F

	snez a5, a4
	bnez a5, .do0

.up:
	lw a5, 4(a2)
	lw a2, 0(a2)

	or a2, a5
	bnez a2, .do0

	or a2, a3, a4
	beqz a2, .doCnst

	xori a2, a3, 0x40
	or a2, a4
	bnez a2, .doChecks

	lw a2, 8(a1)
	lw a1, 12(a1)
	sw zero, 12(a0)
	sw zero, 8(a0)
	sw a1, 4(a0)
	sw a2, 0(a0)
	lw ra, 12(sp)
	addi sp, 0x10
	ret

.do7F:
	li a5, 0x7F
	sltu a5, a3

	beqz a5, .up
	j .do0

.doChecks:
	beqz a4, .do3F

	snez a4
	beqz a4, .do40

.finalCheck:
	bnez a2, .doSll3

.do0:
	lui a1, %hi(uint128_0)
	addi a1, %lo(uint128_0)

.doCnst:
	call uint128_t_constructor

	lw ra, 12(sp)
	addi sp, 0x10
	ret

.do3F:
	li a4, 0x3F
	sltu a4, a3
	bnez a4, .finalCheck

.do40:
	li a2, 0x40
	sub t0, a2, a3
	li t1, 0x1F

	lw a5, 0(a1)
	lw a7, 12(a1)
	lw t2, 4(a1)
	lw t3, 8(a1)

	li a2, 0x20
	sub a2, a3
	bltz a2, .doSub

	sll a6, a5, a3
	sub t1, a3

	addi a4, a3, -0x20
	bgez a4, .doSll

.doSrlSll:
	slli a1, a7, 1
	sll t4, a1, t1
	srl a1, t3, a3
	or a1, t4
	bgez a2, .doLi0

.doSrl:
	sll a2, a5, t0
	bgez a4, .doSll2

.doSrli:
	slli a4, t2, 1
	sll a4, t1
	srl a5, a3
	or a4, a5
	srl a5, t2, a3
	srl a3, a7, a3
	j .doSwLw

.doSub:
	sub t0, t1, t2
	slli a2, a5, 1
	sll t0, a2, t0
	srl a2, t3, t2
	or t0, a2, t0
	sub t1, a3

	addi a2, a3, -0x20
	bltz a2, .doSrlSll

.doSll:
	sll a7, a6, a2
	bltz a1, .doSrl

.doLi0:
	li a1, 0
	bltz a2, .doSrli

.doSll2:
	sll a2, t3, a2
	li a3, 0
	li a4, 0

.doSwLw:
	sw a4, 8(a0)
	sw a2, 12(a0)
	add a1, a7
	add a2, t0, a3

	sw a2, 0(a0)
	sltu a2, t0
	add a1, a2

	sw a1, 4(a0)
	lw ra, 12(sp)
	addi sp, 0x10
	ret

.doSll3:
	lw a2, 8(a1)
	addi a4, a3, -0x60
	bltz a4, .doSub2

	sll a1, a2, a4
	li a2, 0
	j .return

.doSub2:
	li a4, 0x5F
	sub a4, a3
	srli a5, a2, 1
	srl a4, a5, a4

	lw a1, 12(a1)
	addi a3, -0x40
	sll a1, a3
	or a1, a4
	sll a2, a3

.return:
	sw zero, 12(a0)
	sw zero, 8(a0)
	sw a2, 0(a0)
	sw a1, 4(a0)
	lw ra, 12(sp)
	addi sp, 0x10
	ret





uint128_t_operator_shiftRight_equal:
	addi sp, -0x20
	sw ra, 28(sp)
	sw s0, 24(sp)
	sw s1, 20(sp)

	mv a2, a1
	mv s0, a0
	mv s1, sp
	mv a0, s1
	mv a1, s0
	call uint128_t_operator_shiftRight

	mv a0, s0
	mv a1, s1
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mv a0, s0
	lw s1, 20(sp)
	lw s0, 24(sp)
	lw ra, 28(sp)
	addi sp, 0x20
	ret





uint128_t_operator_exclamation_mark:
	addi sp, -0x10
	sw ra, 12(sp)

	call uint128_t_operator_cast_bool
	xori a0, 1

	lw ra, 12(sp)
	addi sp, 0x10
	ret





uint128_t_operator_and_and:
	addi sp, -0x10
	sw ra, 12(sp)
	sw s0, 8(sp)

	mv s0, a1
	call uint128_t_operator_cast_bool

	mv a1, a0
	li a0, 0
	beqz a1, .return

	mv a0, s0
	call uint128_t_operator_cast_bool

.return:
	lw s0, 8(sp)
	lw ra, 12(sp)
	addi sp, 0x10
	ret





uint128_t_operator_or_or:
	addi sp, -0x10
	sw ra, 12(sp)
	sw s0, 8(sp)

	mv s0, a1
	call uint128_t_operator_cast_bool

	mv a1, a0
	addi a0, 1
	bnez a1, .return

	mv a0, s0
	call uint128_t_operator_cast_bool

.return:
	lw s0, 8(sp)
	lw ra, 12(sp)
	addi sp, 0x10
	ret





uint128_t_operator_equal_equal:
	lw a2, 4(a1)
	lw a3, 4(a0)
	xor a2, a3

	lw a3, 0(a1)
	lw a4, 0(a0)
	xor a3, a4
	or a3, a2
	li a2, 0
	bnez a3, .retA2

	lw a2, 12(a1)
	lw a3, 12(a0)
	xor a2, a3

	lw a1, 8(a1)
	lw a0, 8(a0)
	xor a0, a1
	or a0, a2
	bnez a2, a0

.retA2:
	mv a0, a2
	ret





uint128_t_operator_not_equal:
	addi sp, -0x10
	sw ra, 12(sp)

	call uint128_t_operator_equal_equal
	xori a0, 1

	lw ra, 12(sp)
	addi sp, 0x10
	ret





uint128_t_operator_above:
	lw a6, 0(a1)
	lw a3, 4(a1)
	lw a7, 0(a0)
	lw a5, 4(a0)

	xor a2, a5, a3
	xor a4, a7, a6
	or a2, a4
	bnez a3, .nez

	lw a2, 12(a0)
	lw a3, 12(a1)
	beq a2, a3, .eq

	sltu a0, a3, a2
	andi a0, 1
	ret

.nez:
	beq a5, a3, .eq2

	sltu a0, a3, a5
	andi a0, 1
	ret

.eq:
	lw a0, 8(a0)
	lw a1, 8(a1)

	sltu a0, a1, a0
	andi a0, 1
	ret

.eq2:
	sltu a0, a6, a7
	andi a0, 1
	ret





uint128_t_operator_below:
	addi sp, -0x10
	sw ra, 12(sp)
	sw s0, 8(sp)
	sw s1, 4(sp)

	mv s0, a1
	mv s1, a0
	call uint128_t_operator_equal_equal
	beqz .skip

	li a0, 0
	j .return

.skip:
	mv a0, s1
	mv a1, s0
	call uint128_t_operator_above
	xori a0, 1

.return:
	lw s1, 4(sp)
	lw s0, 8(sp)
	lw ra, 12(sp)
	addi sp, 0x10
	ret





uint128_t_operator_above_equal:
	addi sp, -0x10
	sw ra, 12(sp)

	call uint128_t_operator_below
	xori a0, 1

	lw ra, 12(sp)
	addi sp, 0x10
	ret





uint128_t_operator_below_equal:
	addi sp, -0x10
	sw ra, 12(sp)

	call uint128_t_operator_above
	xori a0, 1

	lw ra, 12(sp)
	addi sp, 0x10
	ret





uint128_t_operator_plus:
	lw a4, 8(a2)
	lw a7, 8(a1)
	lw a3, 12(a2)
	lw t0, 12(a2)

	not a5, t0
	beq a3, a5, .doNot

	sltu a6, a5, a3
	j .return

.doNot:
	not a5, a7
	sltu a6, a5, a4

.return:
	add a3, t0
	add a5, a4, a7
	sltu a4, a5, a4
	add a7, a3, a4

	lw a4, 0(a2)
	lw a2, 4(a2)
	lw a3, 0(a1)
	lw a1, 4(a1)

	sw a5, 8(a0)
	sw a7, 12(a0)

	add a1, a2
	add a2, a4, a3

	sltu a3, a2, a4
	add a1, a3
	add a3, a2, a6

	sw a3, 0(a0)
	sltu a2, a3, a2
	add a1, a2
	sw a2, 4(a0)
	ret





uint128_t_operator_plus_equal:
	addi sp, -0x20
	sw ra, 28(sp)
	sw s0, 24(sp)
	sw s1, 20(sp)

	mv a2, a1
	mv s0, a0
	mv s1, sp
	mv a0, s1
	mv a1, s0
	call uint128_t_operator_plus

	mv a0, s0
	mv a1, s1
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mv a0, s0
	lw s1, 20(sp)
	lw s0, 24(sp)
	lw ra, 28(sp)
	addi sp, 0x20
	ret






uint128_t_operator_minus:
	lw a4, 12(a2)
	lw a3, 12(a1)
	lw a7, 8(a2)
	lw t0, 8(a1)
	sltu a5, t0, a7
	mv a6, a5
	beq a3, a4, .skip

	sltu a6, a3, a4

.skip:
	sub a3, a4
	sub a3, a5
	sub a4, t0, a7

	lw a7, 4(a2)
	lw a2, 0(a2)
	lw a5, 4(a1)
	lw a1, 0(a1)

	sw a4, 8(a0)
	sw a3, 12(a0)

	sub a3, a1, a2
	sub a4, a3, a6

	sw a4, 0(a0)

	sltu a1, a2
	sub a2, a5, a7
	sub a1, a2, a1
	sltu a2, a3, a6
	sub a1, a2

	sw a1, 4(a0)
	ret





uint128_t_operator_minus_equal:
	addi sp, -0x20
	sw ra, 28(sp)
	sw s0, 24(sp)
	sw s1, 20(sp)

	mv a2, a1
	mv s0, a0
	mv s1, sp
	mv a0, s1
	mv a1, s0
	call uint128_t_operator_minus

	mv a0, s0
	mv a1, s1
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mv a0, s0
	lw s1, 20(sp)
	lw s0, 24(sp)
	lw ra, 28(sp)
	addi sp, 0x20
	ret





uint128_t_operator_multiply:
	lw a3, 8(a1)
	lw t0, 12(a2)
	mulhu a6, t0, a3

	lw a7, 0(a2)
	mul a5, a7, a3

	add a4, a5, a6
	sltu a6, a4, a5

	lw t1, 12(a1)
	lw t2, 8(a2)
	mulhu a5, t2, t1

	add a5, a4
	sltu a4, a5, a4
	add a6, a4

	mul a4, t0, t1
	add t4, a5, a4
	sltu a4, t4, a5
	add a6, a5

	mulhu t3, t2, a3
	mul a5, t0, a3

	add a4, a5, t3
	sltu t3, a4, a5

	mul a5, t2, t1
	add a5, a4
	sltu a4, a5, a4
	add t3, a4

	lw a2, 4(a2)
	mul a2, a3
	mulhu a4, a7, a3

	add t5, a2, a4
	add a4, t4, t3
	sltu a2, a4, t4

	add t3, a6, a2
	mul a6, a7, t1
	mulhu a2, t0, t1

	add a2, t5
	mul a3, t2, a3

	lw a7, 4(a1)
	lw a1, 0(a1)

	sw a3, 8(a0)
	sw a5, 12(a0)

	mul a3, t2, a1
	add a3, a4
	sltu a4, a3, a4

	sw a3, 0(a1)

	add a3, t3, t4
	add a2, a6

	mulhu a4, t2, a1
	add a2, a4
	mul a1, t0, a1

	add a2, a4
	mul a1, t0, a1

	add a1, a2
	mul a2, t2, a7

	add a1, a2
	add a1, a3
	sw a1, 4(a0)
	ret





uint128_t_operator_multiply_equal:
	addi sp, -0x20
	sw ra, 28(sp)
	sw s0, 24(sp)
	sw s1, 20(sp)

	mv a2, a1
	mv s0, a0
	mv s1, sp
	mv a0, s1
	mv a1, s0
	call uint128_t_operator_multiply

	mv a0, s0
	mv a1, s1
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mv a0, s0
	lw s1, 20(sp)
	lw s0, 24(sp)
	lw ra, 28(sp)
	addi sp, 0x20
	ret





uint128_t_divmod:
	addi sp, -0x90
	sw ra, 140(sp)
	sw s0, 136(sp)
	sw s1, 132(sp)
	sw s2, 128(sp)
	sw s3, 124(sp)
	sw s4, 120(sp)
	sw s5, 116(sp)
	sw s6, 112(sp)
	sw s7, 108(sp)
	sw s8, 104(sp)
	sw s9, 100(sp)
	sw s10, 96(sp)
	sw s11, 92(sp)

	mv s11, a3
	mv s4, a2
	mv s2, a0

	lui a1, %hi(uint128_1)
	addi a1, %lo(uint128_1)
	mv a0, a3
	call uint128_t_operator_equal_equal
	beqz a0, .checkEq

	mv a0, s2
	mv a1, s4
	j .doCnst02

.checkEq:
	mv a0, s4
	mv a1, s11
	call uint128_t_operator_equal_equal
	beqz a0, .do0

	lui a1, %hi(uint128_1)
	addi a0, %lo(uint128_1)
	mv a0, s2

.doCnst02:
	call uint128_t_constructor
	addi a0, s2, 0x10

	lui a1, %hi(uint128_0)
	addi a1, %lo(uint128_0)
	call uint128_t_constructor
	j .return

.do0:
	lui s1, %hi(uint128_0)
	addi s1, %lo(uint128_0)

	mv a0, s4
	mv a1, s1
	call uint128_t_operator_equal_equal
	bnez a0, .doCnst

	mv a0, s4
	mv a1, s11
	call uint128_t_operator_below
	beqz a0, .doCnst0

.doCnst:
	mv a0, s2
	mv a1, s1
	call uint128_t_constructor

	addi a0, s2, 0x10
	mv a1, s4
	call uint128_t_constructor
	j .return

.doCnst0:
	lui s1, %hi(uint128_0)
	addi s1, %lo(uint128_0)
	addi a0, sp, 40
	mv a1, s1
	call uint128_t_constructor

	addi s3, sp, 56
	mv a0, s3
	mv a1, s1
	call uint128_t_constructor

	mv a0, s4
	call uint128_t_bits
	beqz a0, .doMoves

	mv s1, a0
	lui s5, %hi(uint128_1)
	addi s5, %lo(uint128_1)
	addi s6, sp, 40
	addi s7, sp, 8
	addi s8, sp, 72
	addi s9, sp, 24
	li s10, 1
	j .doShifts

.checkMoves:
	andi a0, s1, 0xFF
	mv s1, s0
	beq a0, s10, .doMoves

.doShifts:
	mv a0, s6
	mv a1, s5
	call uint128_t_operator_shiftLeft_equal

	mv a0, s3
	mv a1, s5
	call uint128_t_operator_shiftLeft_equal

	addi s0, s1, -1
	sw zero, 84(sp)
	sw s0, 80(sp)
	sw zero, 76(sp)
	sw zero, 72(sp)

	mv a0, s7
	mv a1, s4
	mv a2, s8
	call uint128_t_operator_shiftRight

	lw a0, 16(sp)
	andi a0, 1

	sw a0, 32(sp)
	sw zero, 36(sp)
	sw zero, 28(sp)
	sw zero, 24(sp)

	mv a0, s9
	call uint128_t_operator_cast_bool
	bnez a0, .doPlusPlus

	mv a0, s3
	mv a1, s11
	call uint128_t_operator_above_equal
	beqz a0, .checkMoves
	j .doMinusEqual

.doPlusPlus:
	mv a0, s3
	call uint128_t_operator_plus_plus

	mv a0, s3
	mv a1, s11
	call uint128_t_operator_above_equal
	beqz a0, .checkMoves

.doMinusEqual:
	mv a0, s3
	mv a1, s11
	call uint128_t_operator_minus_equal

	mv a0, s6
	call uint128_t_operator_plus_plus
	j .checkMoves

.doMoves:
	addi a1, sp, 40
	mv a0, s2
	call uint128_t_constructor_uint128_t_double_ref

	add a0, s2, 16
	mv a1, s3
	call uint128_t_constructor_uint128_t_double_ref

.return:
	lw s11, 92(sp)
	lw s10, 96(sp)
	lw s9, 100(sp)
	lw s9, 104(sp)
	lw s9, 108(sp)
	lw s9, 112(sp)
	lw s9, 116(sp)
	lw s9, 120(sp)
	lw s9, 124(sp)
	lw s9, 128(sp)
	lw s9, 132(sp)
	lw s9, 136(sp)
	lw s9, 140(sp)
	addi sp, 0x90
	ret





uint128_t_operator_divide:
	addi sp, -0x30
	sw ra, 44(sp)
	sw s0, 40(sp)
	sw s1, 36(sp)

	mv a3, a2
	mv s0, a0
	mv s1, sp
	mv a0, s1
	mv a2, a1
	call uint128_t_divmod

	mv a0, s0
	mv a1, s1
	call uint128_t_constructor_uint128_t_double_ref

	lw s1, 36(sp)
	lw s0, 40(sp)
	lw ra, 44(sp)
	addi sp, 48
	ret





uint128_t_operator_divide_equal:
	addi sp, -0x20
	sw ra, 28(sp)
	sw s0, 24(sp)
	sw s1, 20(sp)

	mv a2, a1
	mv s0, a0
	mv s1, sp
	mv a0, s1
	mv a1, s0
	call uint128_t_operator_divide

	mv a0, s0
	mv a1, s1
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mv a0, s0
	lw s1, 20(sp)
	lw s0, 24(sp)
	lw ra, 28(sp)
	addi sp, 0x20
	ret





uint128_t_operator_modulo:
	addi sp, -0x30
	sw ra, 44(sp)
	sw s0, 40(sp)

	mv a3, a2
	mv s0, a0
	addi a0, sp, 8
	mv a2, a1
	call uint128_t_divmod

	addi a1, sp, 24
	mv a0, s0
	call uint128_t_constructor_uint128_t_double_ref

	lw s0, 40(sp)
	lw ra, 44(sp)
	addi sp, 48
	ret





uint128_t_operator_modulo_equal:
	addi sp, -0x20
	sw ra, 28(sp)
	sw s0, 24(sp)
	sw s1, 20(sp)

	mv a2, a1
	mv s0, a0
	mv s1, sp
	mv a0, s1
	mv a1, s0
	call uint128_t_operator_modulo

	mv a0, s0
	mv a1, s1
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mv a0, s0
	lw s1, 20(sp)
	lw s0, 24(sp)
	lw ra, 28(sp)
	addi sp, 0x20
	ret





uint128_t_operator_plus_plus:
	lui a1, %hi(uint128_1)
	addi a1, %lo(uint128_1)
	tail uint128_t_operator_plus_equal





uint128_t_operator_plus_plus_int:
	addi sp, -0x10
	sw ra, 12(sp)
	sw s0, 8(sp)

	mv s0, a1
	call uint128_t_constructor

	mv a0, s0
	call uint128_t_operator_plus_plus

	lw s0, 8(sp)
	lw ra, 12(sp)
	addi sp, 0x10
	ret





uint128_t_operator_minus_minus:
	lui a1, %hi(uint128_1)
	addi a1, %lo(uint128_1)
	tail uint128_t_operator_minus_equal





uint128_t_operator_minus_minus_int:
	addi sp, -0x10
	sw ra, 12(sp)
	sw s0, 8(sp)

	mv s0, a1
	call uint128_t_constructor

	mv a0, s0
	call uint128_t_operator_minus_minus

	lw s0, 8(sp)
	lw ra, 12(sp)
	addi sp, 0x10
	ret





uint128_t_operator_single_plus:
	addi sp, -0x10
	sw ra, 12(sp)

	call uint128_t_constructor

	lw ra, 12(sp)
	addi sp, 0x10
	ret





uint128_t_operator_single_minus:
	addi sp, -0x20
	sw ra, 28(sp)
	sw s0, 24(sp)
	sw s1, 20(sp)

	mv s0, a0
	mv s1, sp
	mv a0, s1
	call uint128_t_operator_not

	lui a2, %hi(uint128_0)
	addi a2, %lo(uint128_0)
	call uint128_t_operator_plus

	lw s1, 20(sp)
	lw s0, 24(sp)
	lw ra, 28(sp)
	addi sp, 0x20
	ret





uint128_t_upper:
	ret





uint128_t_lower:
	addi a0, 8
	ret





uint128_t_bits:
	addi sp, -0x10
	sw ra, 12(sp)
	sw s0, 8(sp)

	mv a2, a0
	addi s0, 0x80

	lw a1, 4(a0)
	lw a0, 0(a0)
	or a3, a0, a1
	bnez a3, .doClz

	li s0, 0x40
	lw a1, 12(a2)
	lw a0, 8(a2)
	or a2, a0, a1
	beqz a2, .ret0

.doClz:
	call clzll
	sub a0, s0, a0
	andi a0, 0xFF

.return:
	lw s0, 8(sp)
	lw ra, 12(sp)
	addi sp, 0x10
	ret

.ret0:
	li a0, 0
	j .return
