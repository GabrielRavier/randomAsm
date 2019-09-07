.include "standard.inc"

	.text

START_FUNC __ror
	andi a1, 0x1F
	subw a5, zero, a1
	srlw a1, a0, a1
	sllw a0, a5
	or a0, a1, a0

	sext.w a0
	ret
END_FUNC __ror





START_FUNC __rorll
	andi a1, 0x3F
	subw a5, zero, a1
	srl a1, a0, a1
	sll a0, a5
	or a0, a1
	ret
END_FUNC __rorll





START_FUNC __rev16
	addi sp, -0x10
	sd ra, 8(sp)

	call __bswapsi2
	ld ra, 8(sp)

	slliw a5, a0, 0x10
	srliw a0, 0x10
	or a0, a5, a0

	sext.w a0
	addi sp, 0x10
	jr ra
END_FUNC __rev16





START_FUNC __rev16ll
	addi sp, -0x20
	sd s1, 8(sp)
	mv s1, a0

	srli a0, 0x20
	sd ra, 0x18(sp)
	sd s0, 0x10(sp)
	call __bswapsi2

	mv s0, a0
	mv a0, s1
	call __bswapsi2

	slliw a4, s0, 0x10
	slliw a5, a0, 0x10
	srliw s0, 0x10
	srliw a0, 0x10
	or a4, s0
	or a5, a0

	ld ra, 0x18(sp)
	ld s0, 0x10(sp)

	slli a5, 0x20
	slli a0, a4, 0x20
	srli a5, 0x20

	ld s1, 8(sp)
	or a0, a5
	addi sp, 0x20
	jr ra
END_FUNC __rev16ll
