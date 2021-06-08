.include "standard.inc"

	.text

START_FUNC N_MAGIC
	ai $3, 6
	lnop

	ai $4, $3, -2
	lqd $3, 0($3)
	rotqby $3, $4

	ila $4, 0xFFFF
	and $3, $4
	bi $lr
END_FUNC N_MAGIC





START_FUNC N_MACHTYPE
	ai $3, 5
	lnop

	ai $4, $3, -3
	lqd $3, 0($3)
	nop

	rotqby $3, $4
	andi $3, 0xFF
	bi $lr
END_FUNC N_MACHTYPE





START_FUNC N_FLAGS
	ai $3, 4
	lnop

	ai $4, $3, -3
	lqd $3, 0($3)
	nop

	rotqby $3, $4
	andi $3, 0xFF
	bi $lr
END_FUNC N_MACHTYPE





START_FUNC N_SET_INFO
	andi $5, 0xFF
	ila $7, 0xFFFF
	shli $5, 0x10
	lnop

	and $4, $7
	cdd $7, 0($3)
	shli $6, 0x18
	or $4, $5, $4
	or $4, $6
	lqd $6, 0($3)

	xswd $4
	shufb $4, $6, $7
	stqd $4, 0($3)
	bi $lr





	.section .rodata

	.align 4

Ldat0:
	.long 0xC0C0C0C0
	.long 0x14151617
	.long 0xC0C0C0C0
	.long 0x1C1D1E1F

Ldat1:
	.long 0x80808080
	.long 0x80800203
	.long 0x80808080
	.long 0x80800A0B

Ldat2:
	.long 0x4050607
	.long 0x80808080
	.long 0xC0D0E0F
	.long 0x80808080

Ldat3:
	.long 0x80808080
	.long 0x14151617
	.long 0x80808080
	.long 0x1C1D1E1F

Ldat4:
	.long 0x10203
	.long 0x14151617
	.long 0x8090A0B
	.long 0x1C1D1E1F

	.text

START_FUNC N_BADMAG
	ai $3, 6
	lqa $4, Ldat0

	ai $7, $3, -2
	lnop

	il $5, -0xCC
	lqd $3, 0($3)

	lqa $6, Ldat1
	rotqdy $3, $7
	shufb $3, $6
	shufb $5, $4
	nop

	lqa $6, Ldat2
	cg $4, $3, $5
	shufb $4, $6
	addx $4, $3, $5

	lqa $3, Ldat3
	il $5, 0x3F
	shufb $5, $3
	ceq $6, $4, $5
	hbra .LBbrHint, .LBret1

	clgt $5, $4, $5
	xswd $7, $5
	selb $5, $7, $6

.LBbrHint
	brnz $5, .LBret1

	ilhu $5, 0x67FF
	lqa $6, Ldat4
	ilhu $8, 0x405
	lohl $5, 0xFFFF
	iohl $5, 0x607
	shufb $4, $8

	il $7, -2
	shufb $6, $5, $7, $6
	rotmi $7, $4, -3

	sfi $7, 0
	andi $4, 7
	rotqmby $6, $7

	sfi $7, 0
	lnop

	il $7, 1
	rotqmby $6, $7
	nop

	shufb $3, $7, $7, $3
	and $3, $4, $3
	shufb $3, $8
	nop
	bi $lr

.LBret1:
	li $3, 1
	bi $lr
END_FUNC N_BADMAG
