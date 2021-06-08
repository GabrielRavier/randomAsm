.include "standard.inc"

	.text

START_FUNC bzero1
	nop
	lqd $5, 0($3)
	ilh $6, 0
	cbd $4, 0($3)
	shufb $4, $6, $5, $4
	stqd $4, 0($3)
	nop
	bi $lr
END_FUNC bzero1





START_FUNC bzero2
	il $4, 14
	sfi $5, $4, 0
	il $4, -1
	rotqmby $5, $4, $5
	andi $7, $3, 0xF
	lnop

	ilh $6, 0
	shlqbyi $5, 14
	sfi $9, $7, 0x10
	ai $12, $3, 0
	and $6, $5

	lqd $11, 0x10($12)
	sfi $7, 0
	shlqby $8, $6, $9
	nop

	shlqby $9, $5, $9
	xor $10, $9, $4
	and $10, $11, $10
	or $10, $8

	lqd $8, 0($3)
	stqd $10, 0x01($12)
	rotqmby $5, $7
	nop

	rotqmby $6, $7
	xor $4, $5, $4
	and $4, $8, $4
	and $6, $5
	lnop

	or $4, $6
	stqd $4, 0($3)
	nop
	bi $lr
END_FUNC bzero2





START_FUNC bzero4
	il $4, 12
	sfi $5, $4, 0

	il $4, -1
	rotqmby $5, $4, $5
	andi $7, $3, 0xF
	lnop

	il $6, 0
	shlqbyi $5, 12
	sfi $9, $7, 0x10
	ai $12, $3, 0
	and $6, $5

	lqd $11, 0x10($12)
	sfi $7, 0
	shlqby $8, $6, $9
	nop

	shlqby $9, $5, $9
	xor $10, $9, $4
	and $10, $11, $10
	or $10, $8

	lqd $8, 0($3)
	stqd 10, 0x10($12)
	rotqmby $5, $7
	nop

	rotqmby $6, $7
	xor $4, $5, $4
	and $4, $8, $4
	and $6, $5
	lnop

	or $4, $6
	stqd $4, 0($3)
	nop
	bi $lr
END_FUNC bzero4





START_FUNC bzero8
	il $4, 8
	sfi $5, $4, 0
	il $4, -1
	rotqmby $5, $4, $5
	andi $7, $3, 0xF
	lnop

	il $6, 0
	shlqbyi $5, 8
	sfi $9, $7, 0x10
	ai $12, $3, 0
	and $6, $5

	lqd $11, 0x10($12)
	sfi $7, 0
	shlqby $8, $6, $9
	nop

	shlqby $9, $5, $9
	xor $10, $9, $4
	and $10, $11, $10
	or $10, $8

	lqd $8, 0($3)
	stqd $10, 0x10($12)
	rotqmby $5, $7
	nop

	rotqmby $6, $7
	xor $4, $5, $4
	and $4, $8, $4
	and $6, $5
	lnop

	or $4, $6
	stqd $4, 0($3)
	nop
	bi $lr
END_FUNC bzero8





.macro mkBzero num

START_FUNC bzero\num
	stqd $lr, 0x10($sp)
	stqd $sp, -0x30($sp)
	ai $sp, -0x30
	il $4, 0
	il $5, \num
	brasl $lr, memset
	nop
	lqd $lr, 0x40($sp)
	ai $sp, 0x30
	bi $lr
END_FUNC bzero\num

.endm

	.irp num, 16, 28, 32, 64, 128, 256, 512, 524, 932, 1024, 1456, 2048, 2112, 3072, 4096, 4380, 8192, 12288, 16384, 32768

		mkBzero \num

	.endr
