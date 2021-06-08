	.text

cimagf:
	mtc1 $5, $f0
	j $31
	nop





cimagl:
cimag:
	mtc1 $6, $f0
	nop

	mtc1 $7, $f1
	j $31
	nop





conjf:
	mtc1 $5, $f0
	nop

	neg.s $f2, $f0
	mtc1 $4, $f0

	j $31
	nop





conjl:
conj:
	mtc1 $6, $f0
	nop

	mtc1 $7, $f1
	nop

	neg.d $f2, $f0
	mtc1 $4, $f0
	nop

	mtc1 $5, $f1
	j $31
	nop





copysignf:
	mfc1 $2, $f14
	nop

	bgez $2, .noNeg
	abs.s $f0, $f12

	neg.s $f0

.noNeg:
	j $31
	nop





copysignl:
copysign:
	mfc1 $3, $f15
	nop

	bgez $3, .noNeg
	abs.d $f0, $f12

	neg.d $f0

.noNeg:
	j $31
	nop





cprojf:
	mtc1 $5, $f2
	mtc1 $4, $f0
	j $31
	nop





cprojl:
cproj:
	mtc1 $6, $f2
	mtc1 $4, $f0
	mtc1 $7, $f3
	mtc1 $5, $f1
	j $31
	nop





crealf:
	mtc1 $4, $f0
	j $31
	nop





creall:
creal:
	mtc1 $4, $f0
	nop

	mtc1 $5, $f1
	j $31
	nop





fmaxf:
	c.le.s $f14, $f12
	nop

	bc1t .f12max
	mov.s $f0, $f12

	mov.s $f0, $f14

.f12max:
	j $31
	nop





fmaxl:
fmax:
	c.le.d $f14, $f12
	nop

	bc1t .f12max
	mov.s $f0, $f12

	mov.s $f0, $f14

.f12max:
	j $31
	nop





fminf:
	c.le.s $f12, $f14
	nop

	bc1t .f12min
	mov.s $f0, $f12

	mov.s $f0, $f14

.f12min:
	j $31
	nop





fminl:
fmin:
	c.le.d $f12, $f14
	nop

	bc1t .f12min
	mov.s $f0, $f12

	mov.s $f0, $f14

.f12max:
	j $31
	nop





imaxabs:
llabs:
	move $3, $5
	bltz $5, .doNeg
	move $2, $4

	j $31
	nop

.doNeg:
	subu $2, $0, $4
	sltu $6, $0, $2
	subu $3, $0, $5
	j $31
	subu $3, $6
