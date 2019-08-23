	.text

_mm_malloc:
	li a5, 1
	beq a1, a5, .jmpMalloc

	addi sp, -0x20
	addi a5, a1, -2
	sd ra, 24(sp)
	andi a5, -3
	mv a2, a0
	bnez a5, .memAlign

	li a1, 8

.memAlign:
	addi a0, sp, 8
	call posix_memalign

	li a5, 0
	bnez a0, .retA5

	ld a5, 8(sp)

.retA5:
	ld ra, 24(sp)
	mv a0, a5
	addi sp, 0x20
	jr ra

.jmpMalloc:
	tail malloc





_mm_free:
	tail free
