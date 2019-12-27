	.text

cimagf:
	stwu 1, -16(1)
	stw 4, 8(1)
	lfs 1, 8(1)
	addi 1, 16
	blr





cimagl:
	stwu 1, -32(1)
	stw 7, 16(1)
	stw 8, 20(1)
	stw 9, 24(1)

	lfd 1, 16(1)
	lfd 2, 24(1)

	addi 1, 32
	blr





cimag:
	stwu 1, -16(1)
	stw 5, 8(1)
	stw 6, 12(1)
	lfd 1, 8(1)
	addi 1, 16
	blr





conjf:
	stwu 1, -16(1)
	mr 9, 3

	stw 4, 8(1)
	lfs 12, 8(1)
	fneg 0, 12

	stfs 0, 8(1)
	lwz 4, 8(1)
	addi 1, 16
	blr





conjl:
	stwu 1, -48(1)
	stw 7, 16(1)
	stw 8, 20(1)
	stw 9, 24(1)
	stw 10, 28(1)

	lfd 12, 16(1)
	lfd 13, 24(1)

	stw 28, 32(1)
	mr 28, 3

	fneg 0, 12
	fneg 1, 13

	stw 29, 36(1)
	stw 30, 40(1)
	mr 29, 4
	stw 31, 44(1)
	mr 30, 5
	stfd 0, 16(1)
	mr 31, 6
	stfd 1, 24(1)
	mr 3, 28

	lwz 7, 16(1)
	mr 4, 29
	lwz 8, 20(1)
	mr 5, 30
	lwz 9, 24(1)
	mr 6, 31
	lwz 10, 28(1)
	lwz 28, 32(1)
	lwz 29, 36(1)
	lwz 30, 40(1)
	lwz 31, 44(1)

	addi 1, 48
	blr





conj:
	stwu 1, -16(1)
	mr 11, 4
	mr 10, 3

	stw 5, 8(1)
	mr 3, 10
	stw 6, 12(1)
	lfd 12, 8(1)
	fneg 0, 12

	stfd 0, 8(1)
	lwz 5, 8(1)
	lwz 6, 12(1)
	addi 1, 16
	blr





copysignf:
	stwu 1, -16(1)
	fabs 1
	stfs 2, 8(1)

	lwz 9, 8(1)
	cmpwi 7, 9, 0
	bge- 7, .noNeg

	fneg 1

.noNeg:
	addi 1, 16
	blr





copysignl:
	fmr 0, 1
	stwu 1, -16(1)
	fabs 1
	stfd 3, 8(1)
	fcmpu 7, 0, 1

	lwz 9, 8(1)
	srwi 9, 31
	beq- 7, .noNeg

	fneg 2

.noNeg:
	cmpwi 7, 9, 0
	bne- 7, .noNeg2

	fneg 1
	fneg 2

.noNeg2:
	addi 1, 16
	blr





copysign:
	stwu 1, -16(1)
	fabs 1
	stfd 2, 8(1)

	lwz 9, 8(1)
	cmpwi 7, 9, 0
	bge- 7, .noNeg

	fneg 1

.noNeg:
	addi 1, 16
	blr





cprojf:
	mr 9, 4
	mr 10, 3
	blr





cprojl:
	stwu 1, -48(1)
	stw 24, 16(1)
	mr 24, 3

	stw 25, 20(1)
	mr 25, 4

	stw 26, 24(1)
	mr 26, 5

	stw 27, 28(1)
	mr 27, 6

	stw 28, 32(1)
	mr 28, 7

	stw 29, 36(1)
	mr 29, 8

	stw 30, 40(1)
	mr 30, 9

	stw 31, 44(1)
	mr 31, 10

	mr 3, 24
	mr 4, 25
	mr 5, 26
	mr 6, 27
	mr 7, 28
	mr 8, 29
	mr 9, 30
	mr 10, 31

	lwz 24, 16(1)
	lwz 25, 20(1)
	lwz 26, 24(1)
	lwz 27, 28(1)
	lwz 28, 32(1)
	lwz 29, 36(1)
	lwz 30, 40(1)
	lwz 31, 44(1)

	addi 1, 48
	blr





cproj:
	mr 11, 6
	mr 10, 5
	mr 9, 4
	mr 8, 3
	blr





crealf:
	stwu 1, -16(1)
	stw 3, 8(1)
	lfs 1, 8(1)
	addi 1, 16
	blr





creall:
	stwu 1, -32(1)
	stw 3, 16(1)
	stw 4, 20(1)
	stw 5, 24(1)
	stw 6, 28(1)

	lfd 1, 16(1)
	lfd 2, 24(1)
	addi 1, 32
	blr





creal:
	stwu 1, -16(1)
	stw 3, 8(1)
	stw 4, 12(1)

	lfd 1, 8(1)
	addi 1, 16
	blr





fmaf:
	fmadds 1, 2, 3
	blr





fmaxf:
fmax:
	fcmpu 7, 1, 2
	bgelr- 7

	fmr 1, 2
	blr





fmaxl:
	fcmpu 7, 1, 3
	bne 7, $+8

	fcmpu 7, 2, 4
	bgelr- 7

	fmr 1, 3
	fmr 2, 4
	blr





fma:
	fmadd 1, 2, 3
	blr





fminf:
fmin:
	fcmpu 7, 1, 2
	blelr- 7

	fmr 1, 2
	blr





fminl:
	fcmpu 7, 1, 3
	bne 7, $+8

	fcmpu 7, 2, 4
	blelr- 7

	fmr 1, 3
	fmr 2, 4
	blr





imaxabs:
llabs:
	srawi 10, 3, 31
	srawi 11, 3, 31

	xor 8, 10, 3
	xor 9, 11, 4

	subfc 4, 11, 9
	subfe 3, 10, 8
	blr
