	.text

_mulx_u64:
	addi sp, -0x40
	sw ra, 60(sp)
	sw s0, 56(sp)
	sw s1, 52(sp)
	sw s2, 48(sp)
	li s0, a4

	sw a1, 12(sp)
	sw a0, 8(sp)
	sw zero, 4(sp)
	sw zero, 0(sp)

	sw a3, 44(sp)
	sw a2, 40(sp)
	sw zero, 36(sp)
	sw zero, 32(sp)

	addi s2, sp, 0x10
	mv a1, sp
	addi a2, sp, 0x20

	mv a0, s2
	call uint128_t_operator_multiply

	li a0, 0x40
	sw a0, 40(sp)
	sw zero, 44(sp)
	sw zero, 36(sp)
	sw zero, 32(sp)

	mv s1, sp
	addi a2, sp, 0x20
	mv a0, a1
	mv a1, s2
	call uint128_t_operator_shiftRight

	mv a0, s1
	call uint128_t_operator_cast_uint64_t

	sw a1, 4(s0)
	sw a0, 0(s0)

	mv a0, s2
	call uint128_t_operator_cast_uint64_t

	lw s2, 48(sp)
	lw s1, 52(sp)
	lw s0, 56(sp)
	lw ra, 60(sp)
	addi sp, 0x40
	ret





_mulx_u32:
	mulhu a3, a1, a0
	sw a3, 0(a2)
	mul a0, a1, a0
	ret
