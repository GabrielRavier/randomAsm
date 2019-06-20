ffsll:
ffsl:
	dsubu $2, $0, $4
	and $4, $2, $4
	dclz $4
	li $2, 0x40

	j $31
	subu $2, $4





ffs:
	subu $2, $0, $4
	and $4, $2, $4
	clz $4
	li $2, 32

	j $31
	subu $2, $4





isascii:
	li $2, -0x80
	and $2, $4, $2

	j $31
	sltu $2, 1





signbit:
	dmtc1 $0, $f0
	c.lt.d $fcc0, $f12, $f0
	bc1t $fcc0,.ret1
	nop

	move $2, $0
	j $31
	andi $2, 1

.ret1:
	li $2, 1
	j $31
	andi $2, 1





signbitf:
	mtc1 $0, $f0
	c.lt.s $fcc0, $f12, $f0
	bc1t $fcc0, .ret1
	nop

	move $2, $0
	j $31
	andi $2, 1

.ret1:
	li $2, 1
	j $31
	andi $2, 1





toascii:
	j $31
	andi $2, $4, 0x7F
