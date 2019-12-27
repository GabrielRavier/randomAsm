	.text

_mm_malloc:
	addi sp, -0x10
	sd ra, 12(sp)
	mv a2, a0
	li a0, 2

	beq a1, a0, .eq
	li a0, 1
	bne a1, a0, .ne

	mv a0, a2
	call malloc

	lw ra, 12(sp)
	addi sp, 0x10
	ret

.eq:
	li a1, 4

.ne:
	li a0, 8
	call posix_memalign
	beqz a0, .eqz
	li a0, 0

	lw ra, 12(sp)
	addi sp, 0x10
	ret

.eqz:
	lw a0, 8(sp)
	lw ra, 12(sp)
	addi sp, 0x10
	ret





_mm_free:
	tail free
