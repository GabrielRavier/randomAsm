	.text

__clrsbdi2:
	srli a5, a0, 8
	andi a5, 0xFF

	addi sp, -0x10
	slliw a4, a5, 0x18
	sd ra, 8(sp)
	sd s0, 0(sp)
	sraiw a4, 24
	bnez a4, .nez

	andi a5, a0, 0xFF
	li a0, 0xF
	bnez a5, .nez2

.eqz:
	ld ra, 8(sp)
	ld s0, 0(sp)
	addi sp, 0x10
	jr ra

.nez:
	andi a5, 0xFF
	li a3, 0xFF
	beq a5, a3, .eq

	li s0, 0
	bltz a4, .ltz

	mv a0, a5
	call __clzdi2

	addw a0, s0
	addiw a0, -0x21

.return:
	ld ra, 8(sp)
	ld s0, 0(sp)
	addi sp, 0x10
	jr ra

.nez2:
	mv a0, a5
	li s0, 8
	call __clzdi2

	addw a0, s0
	addiw a0, -0x21
	j .return

.ltz:
	not a5
	andi a5, 0xFF

	mv a0, a5
	call __clzdi2
	addw a0, s0
	addiw a0, -0x21
	j .return

.eq:
	not a5, a0
	andi a5, 0xFF

	li a0, 0xF
	beqz a5, .eqz
	j .nez2
