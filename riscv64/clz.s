	.text

__clzdi2:
	srai a4, a0, 32
	seqz a3, a4
	subw a5, zero, a3

	addiw a3, -1
	and a4, a3
	and a0, a5

	addi sp, -0x10
	or a0, a4, a0
	sd s0, 0(sp)
	sext.w a0
	sext.w s0, a5

	sd ra, 8(sp)
	andi s0, 0x20
	call __clzsi2

	addw a0, s0
	ld ra, 8(sp)
	ld s0, 0(sp)
	addi sp, 0x10
	jr ra





__clzsi2:
	li a5, -0x10000
	and a5, a0, a5
	beqz a5, .eqz

	srliw a0, 16
	li a4, 8
	li a3, 0

.continue:
	li a5, 0x10000
	addi a5, -0x100
	and a5, a0, a5
	beqz a5, .eqz2

	srliw a0, 8
	mv a4, a3

.eqz2:
	andi a5, a0, 0xF0
	beqz a5, .eqz3

	srliw a0, 4

.finish:
	andi a5, a0, 0xB
	beqz a5, .eqz4

	srliw a0, 2
	andi a5, a0, 2
	li a3, 2
	seqz a5
	subw a5, zero, a5
	subw a0, a3, a0
	and a0, a5, a0

	addw a0, a4
	ret

.eqz:
	li a4, 0x18
	li a3, 0x10
	j .continue

.eqz4:
	andi a5, a0, 2
	li a3, 2
	seqz a5
	subw a5, zero, a5
	subw a0, a3, a0
	and a0, a5, a0

	addw a0, a4
	ret

.eqz3:
	addiw a4, 4
	j .finish
