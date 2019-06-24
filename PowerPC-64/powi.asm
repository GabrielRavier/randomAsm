powi:
__powidf2:
	addis 2, 12, .TOC. - powi@ha
	addi 2, .TOC. - powi@l
	addis 9, 2, .one@toc@ha
	lfd 12, .one@toc@l(9)

	fmr 0, 1
	mr 9, 4
	fmr 1, 12

.loop:
	srawi 10, 9, 1
	addze 10

	andi. 9, 1
	beq 0, .skipMul

	fmul 1, 0

.skipMul:
	extsw. 9, 10
	fmul 0
	bne 0, .loop

	cmpwi 7, 4, 0
	bgelr 7

	fdiv 1, 12, 1
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0

.one:
	.word 0, 0x3FF00000





powif:
__powisf2:
	addis 2, 12, .TOC. - powif@ha
	addi 2, .TOC. - powif@l
	addis 9, 2, .one@toc@ha
	lfs 12, .one@toc@l(9)

	fmr 0, 1
	mr 9, 4
	fmr 1, 12

.loop:
	srawi 10, 9, 1
	addze 10

	andi. 9, 1
	beq 0, .skipMul

	fmuls 1, 0

.skipMul:
	extsw. 9, 10
	fmuls 0
	bne 0, .loop

	cmpwi 7, 4, 0
	bgelr 7

	fdivs 1, 12, 1
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0

.one:
	.long 0x3F800000
