.include "standard.inc"

	.text

.macro mk256 name, op

START_FUNC \name
	\op $3, $5
	lnop
	\op $4, $6
	bi $lr
END_FUNC \name

.endm

.macro mk256v64 name, num, instr1, instr2

	.section .rodata

	.align 4
Ldat\name:
	.long 0x4050607
	.long \num
	.long 0xC0D0E0F
	.long \num

	.text

START_FUNC \name
	nop
	lqa $8, Ldat\name
	lr $7, $3
	lnop

	\instr1 $3, $7, $5
	shufb $3, $8
	\instr2 $3, $7, $5
	lnop

	\instr1 $5, $4, $6
	shufb $5, $8
	\instr2 $5, $4, $6
	lnop

	lr $4, $6
	bi $lr
END_FUNC \name

.endm

	mk256 _mm256_add_epi8, a
	mk256 _mm256_add_epi16, ah
	mk256 _mm256_add_epi32, a
	mk256v64  _mm256_add_epi64, 0x80808080, cg, addx
	mk256 _mm256_and_si256, and





START_FUNC _mm256_mullo_epi16
	mpy $7, $3, $5
	lnop

	mpyhh $3, $3, $5
	fsmbi $5, 0xCCCC
	mpy $8, $4, $6
	mpyhh $4, $6
	shli $3, 0x10
	shli $4, 0x10
	selb $3, $7, $3, $5
	lnop

	selb $4, $8, $4, $5
	bi $lr
END_FUNC _mm256_mullo_epi16





START_FUNC _mm256_mullo_epi32
	mpyh $7, $5, $3
	mpyh $8, $3, $5
	mpyu $3, $5
	a $7, $8, $7

	mpyh $5, $6, $4
	mpyh $8, $4, $6
	mpyu $4, $6
	a $5, $8, $5
	a $3, $7, $3
	lnop

	a $4, $5, $4
	bi $lr
END_FUNC _mm256_mullo_epi32





	mk256 _mm256_or_si256, or
	mk256 _mm256_sub_epi16, sfh
	mk256 _mm256_sub_epi32, sf
	mk256v64 _mm256_sub_epi64, 0xC0C0C0C0, bg, sfx
	mk256 _mm256_xor_si256, xor
