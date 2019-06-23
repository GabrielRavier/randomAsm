__ctzdi2:
	sext.w a5, a0
	addi sp, -0x10
	seqz a4, a5

	sd s0, 0(sp)
	srai a0, 32
	subw s0, zero, a4
	addiw a4, -1
	and a5, a4
	and a0, s0, a0
	or a0, a5, a0
	sext.w a0

	sd ra, 8(sp)
	andi s0, 0x20
	call __ctzsi2

	addw a0, s0
	ld ra, 8(sp)
	ld s0, 0(sp)
	addi sp, 0x10
	jr ra





__ctzsi2:
	slli a5, a0, 48
	srli a5, 48
	bnez a5, .nez

	srliw a0, 16
	li a4, 0x18
	li a3, 0x10

.continue:
	andi a5, a0, 0xFF
	bnez a5, .nez2

	srliw a0, 8
	mv a3, a4

.nez2:
	andi a5, a0, 0xF
	bnez a5, .nez3

	srliw a0, 4
	addiw a3, 4

.nez3:
	andi a5, a0, 3
	bnez a5, .nez4

	srliw a0, 2
	addiw a3, 2

.nez4:
	srliw a4, a0, 1
	not a5, a0
	andi a5, 1
	andi a0, a4, 1
	li a4, 2
	subw a4, a0
	subw a5, zero, a5
	and a5, a4, a5

	addw a0, a5, a3
	ret

.nez:
	li a4, 8
	li a3, 0
	j .continue
