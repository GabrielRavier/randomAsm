	.text

_mm_malloc:
	addis 2, 12, .TOC. - _mm_malloc@ha
	addi 2, .TOC. - _mm_malloc@l
	mflr 0

	cmpldi 7, 4, 1
	std 0, 16(1)
	stdu 1, -0x30(1)
	beq 7, .l9

	addi 9, 4, -2
	mr 5, 3
	rldicl 10, 9, 62, 1
	rldicl. 10, 2, 0
	beq 0, .l10

.l4:
	addi 3, 1, 0x20
	bl posix_memalign
	nop

	li 9, 0
	cmpdi 7, 3, 0
	bne 7, .l1
	ld 9, 32(1)

.l1:
	addi 1, 0x30
	mr 3, 9
	ld 0, 16(1)
	mtlr 0
	blr

.l10:
	li 4, 8
	b .l4

.l9:
	bl malloc
	nop
	mr 9, 3
	b .l1

	.long 0
	.byte 0, 9, 0, 1, 0x80, 0, 0, 0





_mm_free:
	addis 2, 12, .TOC. - _mm_free@ha
	addi 2, .TOC. - _mm_free@l
	mflr 0
	std 0, 16(1)
	stdu 1, -0x20(1)

	bl free
	nop

	addi 1, 0x20
	ld 0, 16(1)
	mtlr 0
	blr

	.long 0
	.byte 0, 9, 0, 1, 0x80, 0, 0, 0
