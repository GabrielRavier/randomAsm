.include "standard.inc"

	.text

START_FUNC __andn_u32
START_FUNC __andn_u64
	andc $3, $4, $3
	bi $lr
END_FUNC __andn_u32
END_FUNC __andn_u64





START_FUNC __blsi_u32
	sfi $4, $3, 0
	lnop

	and $3, $4
	bi $lr
END_FUNC __blsi_u32





START_FUNC __blsmsk_u32
	ai $4, $3, -1
	lnop

	xor $3, $4, $3
	bi $lr
END_FUNC __blsmsk_u32





START_FUNC __blsr_u32
	ai $4, $3, -1
	lnop

	and $3, $4, $3
	bi $lr
END_FUNC __blsr_u32





	.section .rodata
	.align 4

Ldat0:
	.long 0x4050607
	.long 0xC0C0C0C0
	.long 0xC0D0E0F
	.long 0xC0C0C0C0

	.text

START_FUNC __blsi_u64
	nop
	lqa $6, Ldat0
	il $4, 0
	lnop

	bg $5, $4, $3
	shufb $5, $6
	sfx $5, $4, $3
	lnop

	and $3, $5
	bi $lr
END_FUNC __blsi_u64





	.section .rodata
	.align 4

Ldat1:
	.long 0x4050607
	.long 0x80808080
	.long 0xC0D0E0F
	.long 0x80808080

	.text

START_FUNC __blsmsk_u64
	nop
	lqa $6, Ldat1
	il $4, -1
	lnop

	cg $5, $3, $4
	shufb $5, $6
	addx $5, $3, $4
	lnop

	xor $3, $5, $3
	bi $lr
END_FUNC __blsmsk_u64





START_FUNC __blsr_u64
	nop
	lqa $6, Ldat1
	il $4, -1
	nop

	cg $5, $3, $4
	shufb $5, $6
	addx $5, $3, $4
	lnop

	and $3, $5, $3
	bi $lr
END_FUNC __blsr_u64
