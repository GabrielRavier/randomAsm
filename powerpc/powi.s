	.text

powi:
__powidf2:
	lis 9, .one@ha
	lfd 0, .one@l(9)
	mr 9, 3

.loop:
	rlwinm 10, 9, 0, 31, 31
	srawi 9, 1
	addze. 9

	cmpwi 7, 10, 0
	beq- 7, .skipMul

	fmul 0, 1

.skipMul:
	beq- 0, .finish

	fmul 1
	b .loop

.finish:
	cmpwi 7, 3, 0
	fmr 1, 0
	bgelr+ 7

	lis 9, .one@ha
	lfd 0, .one@l(9)
	fdiv 1, 0, 1
	blr

.one:
	.long 0x3FF00000, 0





powif:
__powisf2:
	lis 10, .one@ha
	mr 9, 3
	lfs 0, .one@l(10)

.loop:
	rlwinm 10, 9, 0, 31, 31
	srawi 9, 1
	addze. 9

	cmpwi 7, 10, 0
	beq- 7, .skipMul

	fmuls 0, 1

.skipMul:
	beq- 0, .finish
	fmuls 1
	b .loop

.finish:
	cmpwi 7, 3, 0
	fmr 1, 0
	bgelr+ 7

	lis 9, .one@ha
	lfs 0, .one@l(9)

	fdivs 1, 0, 1
	blr

.one:
	.long 0x3F800000
