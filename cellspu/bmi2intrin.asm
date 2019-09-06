.include "standard.inc"

	.rodata
	.align 4

Ldat0:
	.long 0x80808080
	.long 0x10203
	.long 0x80808080
	.long 0x8090A0B

Ldat1:
	.long 0x4050607
	.long 0x80808080
	.long 0xC0D0E0F
	.long 0x80808080

	.text

START_FUNC _mulx_u32
	lqa $7, Ldat0
	shufb $3, $7
	nop

	shufb $6, $4, $4, $7
	il $4, 0
	fsmbi $8, 0xF0F
	nop

	shlqbyi $7, $3, 4
	selb $9, $6, $4, $8
	lnop

	mpyh $10, $9, $7
	shlqbyi $17, $6, 2
	nop

	shlqbyi $16, $6, 4
	mpyu $7, $9

	shlqbyi $9, $3, 2
	mpyu $11, $17, $9
	mpyh $12, $17, $9
	a $13, $12, $11
	selb $11, $3, $4, $8
	mpyu $14, $16, $11
	mpyh $15, $16, $11
	a $13, $14, $13
	fsmbi $14, 0xF0F0
	mpyh $11, $16
	selb $12, $6, $4, $14
	mpyhhu $6, $12, $9
	lnop

	a $13, $15, $13
	shlqbyi $9, $6, 2
	a $11, $13
	lnop

	a $10, $7, $10
	fsmbi $13, 0xC3C3
	a $10, $11
	lnop

	selb $11, $3, $4, $14
	lqa $3, Ldat1
	mpyu $12, $11
	selb $8, $10, $4, $8
	selb $10, $9, $4, $13
	lnop

	cg $9, $12, $10
	shufb $9, $3
	addx $9, $12, $10
	lnop

	mpyhhu $7, $11, $17
	shlqbyi $7, 2
	selb $6, $7, $4, $13
	lnop

	cg $4, $9, $6
	shufb $4, $3
	addx $4, $9, $6
	lnop

	cg $6, $4, $8
	shufb $3, $6, $6, $3
	addx $3, $4, $8

	lqd $6, 0($5)
	cwd $4, 0($5)
	shufb $4, $3, $6, $4
	nop
	stqd $4, 0($5)

	ilhu $5, 0x405
	lnop

	iohl $5, 0x607
	shufb $3, $5
	nop
	bi $lr
