.include "standard.inc"

	.text

.macro ld256

	ld1 {v4.16b - v5.16b}, [x0]
	ld1 {v2.16b - v3.16b}, [x1]

.endm

.macro ld256_clang

	ldp q1, q0, [x0]
	ldp q2, q3, [x1]

.endm

.macro st256AndRet

	st1 {v0.16b - v1.16b}, [x8]
	ret

.endm

.macro st256AndRet_clang

	stp q1, q0, [x8]
	ret

.endm

.macro mk16b instr

	\instr v0.16b, v4.16b, v2.16b
	\instr v1.16b, v5.16b, v3.16b

.endm

.macro mk16b_clang instr

	\instr v1.16b, v1.16b, v2.16b
	\instr v0.16b, v0.16b, v3.16b

.endm

.macro mk8h instr

	\instr v0.8h, v4.8h, v2.8h
	\instr v1.8h, v5.8h, v3.8h

.endm

.macro mk8h_clang instr

	\instr v1.8h, v1.8h, v2.8h
	\instr v0.8h, v0.8h, v3.8h

.endm

.macro mk4s instr

	\instr v0.4s, v4.4s, v2.4s
	\instr v1.4s, v5.4s, v3.4s

.endm

.macro mk4s_clang instr

	\instr v1.4s, v1.4s, v2.4s
	\instr v0.4s, v0.4s, v3.4s

.endm

.macro mk2d instr

	\instr v0.2d, v4.2d, v2.2d
	\instr v1.2d, v5.2d, v3.2d

.endm

.macro mk2d_clang instr

	\instr v1.2d, v1.2d, v2.2d
	\instr v0.2d, v0.2d, v3.2d

.endm

.macro makeFunc name, mkMacro, instr

START_FUNC \name
	ld256
	\mkMacro \instr
	st256AndRet
END_FUNC \name

.endm

.macro makeFunc_clang name, mkMacro, instr

START_FUNC \name
	ld256_clang
	\mkMacro \instr
	st256AndRet_clang
END_FUNC \name

.endm

	makeFunc _mm256_add_epi8, mk16b, add
	makeFunc _mm256_add_epi16, mk8h, add
	makeFunc _mm256_add_epi32, mk4s, add
	makeFunc _mm256_add_epi64, mk2d, add
	makeFunc _mm256_and_si256, mk16b, and
	makeFunc _mm256_andnot_si256, mk16b, bic
	makeFunc_clang _mm256_cmpeq_epi8, mk16b_clang, cmeq
	makeFunc_clang _mm256_cmpeq_epi16, mk8h_clang, cmeq
	makeFunc_clang _mm256_cmpeq_epi32, mk4s_clang, cmeq
	makeFunc_clang _mm256_cmpeq_epi64, mk2d_clang, cmeq
	makeFunc_clang _mm256_cmpgt_epi8, mk16b_clang, cmhi
	makeFunc_clang _mm256_cmpgt_epi16, mk8h_clang, cmgt
	makeFunc_clang _mm256_cmpgt_epi32, mk4s_clang, cmgt
	makeFunc_clang _mm256_cmpgt_epi64, mk2d_clang, cmgt
	makeFunc _mm256_mullo_epi16, mk8h, mul
	makeFunc _mm256_mullo_epi32, mk4s, mul
	makeFunc _mm256_or_si256, mk16b, orr
	makeFunc _mm256_sub_epi8, mk16b, sub
	makeFunc _mm256_sub_epi16, mk8h, sub
	makeFunc _mm256_sub_epi32, mk4s, sub
	makeFunc _mm256_sub_epi64, mk2d, sub
	makeFunc _mm256_xor_si256, mk16b, eor
