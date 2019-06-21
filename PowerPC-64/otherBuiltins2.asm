cimagf:
cimag:
	fmr 1, 2
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





cimagl:
	fmr 1, 3
	fmr 2, 4
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





conjf:
	fneg 2
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





conjl:
	fneg 12, 3
	fneg 13, 4

	fmr 11, 2
	fmr 10, 1

	fmr 2, 11
	fmr 1, 10
	fmr 3, 12
	fmr 4, 13
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





conj:
	fneg 0, 2
	fmr 12, 1
	fmr 2, 0
	fmr 1, 12
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





copysignf:
copysign:
	fcpsgn 1, 2, 1
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





copysignl:
	fmr 0, 1
	fabs 1
	mfvsrd 9, 3
	fcmpu 7, 8, 1
	srdi 9, 63
	beq 7, .noNeg

	fneg 2

.noNeg:
	cmpwi 7, 9, 0
	beqlr 7

	fneg 1
	fneg 2
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





cprojf:
crealf:
creall:
creal:
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





cprojl:
	fmr 13, 4
	fmr 12, 3
	fmr 11, 2
	fmr 10, 1

	fmr 2, 11
	fmr 1, 10
	fmr 3, 12
	fmr 4, 13
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





cproj:
	fmr 0, 2
	fmr 12, 1

	fmr 2, 0
	fmr 1, 12
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





fmaf:
	fmadds 1, 2, 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





fmaxf:
fmax:
	xsmaxdp 1, 2
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





fmaxl:
	fcmpu 7, 1, 3
	bne 7, $+8

	fcmpu 7, 2, 4
	bgelr 7

	fmr 1, 3
	fmr 2, 4
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





fma:
	fmadd 1, 2, 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





fminf:
fmin:
	xsmindp 1, 2
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





fminl:
	fcmpu 7, 1, 3
	bne 7, $+8

	fcmpu 7, 2, 4
	blelr 7

	fmr 1, 3
	fmr 2, 4
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





imaxabs:
llabs:
	sradi 9, 3, 63
	xor 3, 9, 3

	subf 3, 9, 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





llrintf:
llrint:
lrintf:
lrint:
	fctid 0, 1
	mfvsrd 3, 0
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





llroundf:
llround:
lroundf:
lround:
	xsrdpi 1

	fctid 0, 1
	mfvsrd 3, 0
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





roundf:
round:
	frin 1
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





truncf:
trunc:
	friz 1
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
