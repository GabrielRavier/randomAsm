	.text

clz:
	slli a0, 32
	addi sp, -0x10
	srli a0, 32
	sd ra, 8(sp)

	call __clzdi2

	ld ra, 8(sp)
	addiw a0, -0x20
	addi sp, 0x10
	jr ra





ctz:
	slli a0, 32
	addi sp, -0x10
	srli a0, 32
	sd ra, 8(sp)
	call __ctzdi2

	ld ra, 8(sp)
	sext.w a0
	addi sp, 0x10
	jr ra





clrsb:
	addi sp, -0x10
	sd ra, 8(sp)

	call __clrsbdi2
	la ra, 8(sp)
	addiw a0, -0x20
	addi sp, 0x10
	jr ra





popcount:
	slli a0, 32
	addi sp, -0x10
	srli a0, 32
	sd ra, 8(sp)

	call __popcountdi2

	ld ra, 8(sp)
	sext.w a0
	addi sp, 0x10
	jr ra





parity:
	slli a0, 32
	addi sp, -0x10
	srli a0, 32
	sd ra, 8(sp)

	call __paritydi2

	ld ra, 8(sp)
	sext.w a0
	addi sp, 0x10
	jr ra





clzl:
clzll:
	addi sp, -0x10
	sd ra, 8(sp)

	call __clzdi2

	ld ra, 8(sp)
	sext.w a0
	addi sp, 0x10
	jr ra





ctzl:
ctzll:
	addi sp, -0x10
	sd ra, 8(sp)

	call __ctzdi2

	ld ra, 8(sp)
	sext.w a0
	addi sp, 0x10
	jr ra





clrsbl:
clrsbll:
	addi sp, -0x10
	sd ra, 8(sp)

	call __clrsbdi2

	ld ra, 8(sp)
	sext.w a0
	addi sp, 0x10
	jr ra





popcountl:
popcountll:
	addi sp, -0x10
	sd ra, 8(sp)

	call __popcountdi2

	ld ra, 8(sp)
	sext.w a0
	addi sp, 0x10
	jr ra





parityl:
parityll:
	addi sp, -0x10
	sd ra, 8(sp)

	call __paritydi2

	ld ra, 8(sp)
	sext.w a0
	addi sp, 0x10
	jr ra
