	.text

cabsf:
	mul.s $f13
	madd.s $f12, $f13, $f12, $f12

	j $31
	sqrt.s $f0, $f12





cabs:
	mul.d $f13
	madd.d $f12, $f13, $f12, $f12

	j $31
	sqrt.d $f0, $f12





cimagf:
	j $31
	mov.s $f0, $f13





cimagl:
	dmfc1 $2, $f14
	dmfc1 $3, $f15
	fmtc1 $2, $f0

	j $31
	dmtc1 $3, $2





cimag:
	j $31
	mov.d $f0, $13





conjf:
	neg.f $f2, $f13
	j $31
	mov.s $f0, $f12





conjl:
	dmfc1 $7, $f17
	li $3, -1
	dmfc1 $6, $f16

	dsll $3, 0x3F
	xor $3, $7
	move $2, $4

	sdc1 $f14, 0($4)
	sdc1 $f15, 8($4)
	sd $6, 16($4)

	j $31
	sd $3, 24($4)





conj:
	neg.d $f2, $f13
	j $31
	mov.d $f0, $f12





copysignf:
	mfc1 $2, $f13
	bgez $2, .noNeg
	abs.s $f0, $f12

	neg.s $f0

.noNeg:
	j $31
	nop





copysignl:
	dmfc1 $3, $f13
	dmfc1 $5, $f15

	dext $4, $3, 0, 63
	li $3, -1
	dsll $3, 0x3F
	dmfc1 $2, $f12
	and $3, $5
	or $3, $4, $3

	dmtc1 $3, $f2
	j $31
	dmtc1 $2, $f0





copysign:
	dmfc1 $2, $f13
	bgez $2, .noNeg
	abs.d $f0, $f12

	neg.d $f0

.noNeg:
	j $31
	nop





cprojf:
	mov.s $f2, $f13
	j $31
	mov.s $f0, $f12





cprojl:
	move $2, $4
	sdc1 $f14, 0($4)
	sdc1 $f15, 8($4)
	sdc1 $f16, 16($4)

	j $31
	sdc1 $f17, 24($4)





cproj:
	mov.d $f2, $f13
	j $31
	mov.d $f0, $f12





crealf:
	j $31
	mov.s $f0, $f12





creall:
	dmfc1 $2, $f12
	dmfc1 $3, $f13
	dmtc1 $2, $f0

	j $31
	dmtc1 $3, $f2





creal:
	j $31
	mov.d $f0, $f12





fmaxf:
	c.le.s $fcc0, $f13, $f12
	mov.s $f0, $f13

	j $31
	movt.s $f0, $f12, $fcc0





fmax:
	c.le.d $fcc0, $f13, $f12
	mov.s $f0, $f13

	j $31
	movt.d $f0, $f12, $fcc0





fminf:
	c.le.s $fcc0, $f12, $f13
	mov.s $f0, $f13

	j $31
	movt.s $f0, $f12, $fcc0





fmin:
	c.le.d $fcc0, $f12, $f13
	mov.s $f0, $f13

	j $31
	movt.d $f0, $f12, $fcc0





imaxabs:
llabs:
	dsubu $2, $0, $4
	slt $3, $4, 0

	j $31
	movz $2, $4, $3
