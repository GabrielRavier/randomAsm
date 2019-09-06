.include "standard.inc"

	.text

START_FUNC __argp_usage
	stqd $lr, 0x10($sp)
	stqd $sp, -0x30($sp)
	ai $sp, -0x30

	ila $4, stderr
	lqd $5, 0($4)
	rotqby $4, $5, $4
	il $5, 0x106
	brasl $lr, __argp_state_help

	nop
	lqd $lr, 0x40($sp)
	ai $sp, 0x30
	bi $lr
END_FUNC __argp_usage





START_FUNC __option_is_end
	ai $4, $3, 4
	lqd $5, 0($4)
	nop

	rotqby $5, $4
	ilh $4, 0
	brnz $5, .Lreturn
	nop

	lqd $6, 0($3)
	ai $5, $3, 0
	rotqby $5, $6, $5
	nop
	brnz $5, .Lreturn

	ai $5, $3, 0x10
	lqd $6, 0($5)
	rotqby $5, $6, $5
	brnz $5, .Lreturn

	ai $3, 0x14
	lqd $4, 0($3)
	nop

	rotqby $3, $4, $3
	ilhu $4, 0x303
	iohl $4, 0x303
	ceqi $3, 0
	shufb $4, $3, $3, $4

.Lreturn:
	andi $3, $4, 1
	bi $lr
