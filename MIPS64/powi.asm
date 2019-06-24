powi:
__powidf2:
	lui $6, %hi(%neg(%gp_rel(powi)))
	daddu $6, $25
	daddiu $6, %lo(%neg(%gp_rel(powi)))
	ld $2, %got_page(.one)($6)
	ldc1 $f0, %got_ofst(.one)($2)
	move $2, $5

.loop:
	srl $3, $2, 31
	addu $3, $2

	andi $4, $2, 1
	beq $4, $0, .skipMul
	sra $2, $3, 1

	mul.d $f0, $f12

.skipMul:
	bne $2, $0, .loop
	mul.d $f12

	bltz $5, .retRecip
	nop

	j $31
	nop

.retRecip:
	j $31
	recip.d $f0

.one:
	.word 0, 0x3FF00000





powif:
__powisf2:
	lui $6, %hi(%neg(%gp_rel(powif)))
	daddu $6, $25
	daddiu $6, %lo(%neg(%gp_rel(powif)))
	ld $2, %got_page(.one)($6)
	lwc1 $f0, %got_ofst(.one)($2)
	move $2, $5

.loop:
	srl $3, $2, 31
	addu $3, $2

	andi $4, $2, 1
	beq $4, $0, .skipMul
	sra $2, $3, 1

	mul.s $f0, $f12

.skipMul:
	bne $2, $0, .loop
	mul.s $f12

	bltz $5, .retRecip
	nop

	j $31
	nop

.retRecip:
	j $31
	recip.s $f0

.one:
	.word 0x3F800000
