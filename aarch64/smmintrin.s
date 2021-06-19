.include "standard.inc"

	.text

.macro make_cmp name, instr

START_FUNC \name
	\instr v0.2d, v0.2d, v1.2d
	ret
END_FUNC \name

.endm

	make_cmp _mm_cmpeq_epi64, cmeq





START_FUNC _mm_mullo_epi32
	mul v0.4s, v0.4s, v1.4s
	ret
END_FUNC _mm_mullo_epi32





	make_cmp _mm_cmpgt_epi64, cmgt
