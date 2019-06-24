powi:
powil:
__powidf2:
	lui $5, %hi(.one)
	lwc1 $f0, %lo(.one)($5)
	move $2, $6
	lwc1 $f1, %lo(.one + 4)($5)

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

	bltz $6, .retRecip
	nop

	j $31
	nop

.retRecip:
	lwc1 $f2, %lo(.one)($5)
	nop
	lwc1 $f3, %lo(.one + 4)($5)

	j $31
	div.d $f0, $f2, $f0

.one:
	.word 0, 0x3FF00000





powif:
__powisf2:
	lui $6, %hi(.one)
	lwc1 $f0, %lo(.one)($6)
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
	lwc1 $f2, %lo(.one)($6)
	j $31
	div.s $f0, $f2, $f0
