bzero:
	move $6, $5
	j memset
	move $5, $0





ffsll:
	addiu $sp, -0x20
	sw $31, 28($sp)

	jal __ffsdi2
	nop

	lw $31, 28($sp)
	nop

	j $31
	addiu $sp, 0x20





ffsl:
ffs:
	addiu $sp, -0x20
	sw $31, 28($sp)

	jal __ffssi2
	nop

	lw $31, 28($sp)
	nop

	j $31
	addiu $sp, 0x20





isascii:
	li $2, -0x80
	and $2, $4, $2

	j $31
	sltu $2, 1





signbit:
signbitl:
	mtc1 $0, $f0
	nop

	mtc1 $0, $f1
	nop

	c.lt.d $f12, $f0
	nop

	bc1t .return
	li $2, 1

	move $2, $0

.return:
	j $31
	andi $2, 1





signbitf:
	mtc1 $0, $f0
	nop

	c.lt.s $f12, $f0
	nop

	bc1t .return
	li $2, 1

	move $2, $0

.return:
	j $31
	andi $2, 1





toascii:
	j $31
	andi $2, $4, 0x7F
