_mulx_u64:
	stwu 1, -80(1)
	mflr 0

	stw 30, 72(1)
	li 30, 0

	stw 31, 76(1)
	li 31, 0

	stw 5, 16(1)
	addi 5, 1, 8

	stw 3, 32(1)
	addi 3, 1, 40

	stw 4, 36(1)
	addi 4, 1, 24

	stw 0, 84(1)
	stw 6, 20(1)
	stw 29, 68(1)
	mr 29, 7

	stw 30, 24(1)
	stw 31, 28(1)
	stw 30, 8(1)
	stw 31, 12(1)
	bl uint128_t_operator_multiply

	addi 5, 1, 8
	li 10, 0
	li 11, 64

	addi 4, 1, 40
	addi 3, 1, 24

	stw 10, 16(1)
	stw 11, 20(1)
	stw 30, 8(1)
	stw 31, 12(1)
	bl uint128_t_operator_shiftRight

	addi 3, 1, 24
	bl uint128_t_operator_cast_uint64_t

	stw 3, 0(29)
	addi 3, 1, 40
	stw 4, 4(29)
	bl uint128_t_operator_cast_uint64_t

	lwz 0, 84(1)
	lwz 29, 68(1)
	mtlr 0

	lwz 30, 72(1)
	lwz 31, 76(1)
	addi 1, 80
	blr





_mulx_u32:
	mulhwu 19, 3, 4
	mullw 11, 3, 4

	stw 10, 0(5)

	mr 3, 11
	blr
