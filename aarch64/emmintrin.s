.include "standard.inc"

	.text

START_FUNC _mm_set_sd
	dup d0, v0.d[0]
	ret
END_FUNC _mm_set_sd





START_FUNC _mm_set1_pd
START_FUNC _mm_set_pd1
	dup v0.2d, v0.d[0]
	ret
END_FUNC _mm_set1_pd
END_FUNC _mm_set_pd1





START_FUNC _mm_set_pd
	mov v1.d[1], v0.d[0]
	mov v0.16b, v1.16b
	ret
END_FUNC _mm_set_pd





START_FUNC _mm_setr_pd
	ins v0.d[1], v1.d[0]
	ret
END_FUNC _mm_setr_pd





START_FUNC _mm_setzero_pd
	movi v0.2d, 0
	ret
END_FUNC _mm_setzero_pd





START_FUNC _mm_move_sd
	ins v1.d[1], v0.d[1]
	mov v0.16b, v1.16b
	ret
END_FUNC _mm_move_sd





START_FUNC _mm_load_pd
START_FUNC _mm_loadu_pd
START_FUNC _mm_load_si128
START_FUNC _mm_loadu_si128
	ldr q0, [x0]
	ret
END_FUNC _mm_load_pd
END_FUNC _mm_loadu_pd
END_FUNC _mm_load_si128
END_FUNC _mm_loadu_si128





START_FUNC _mm_load1_pd
START_FUNC _mm_load_pd1
	ld1r {v0.2d}, [x0]
	ret
END_FUNC _mm_load1_pd
END_FUNC _mm_load_pd1





START_FUNC _mm_load_sd
START_FUNC _mm_loadl_epi64
START_FUNC _mm_loadu_si64
	ldr d0, [x0]
	ret
END_FUNC _mm_load_sd
END_FUNC _mm_loadl_epi64
END_FUNC _mm_loadu_si64





START_FUNC _mm_store_pd
START_FUNC _mm_storeu_pd
START_FUNC _mm_store_si128
START_FUNC _mm_storeu_si128
	str q0, [x0]
	ret
END_FUNC _mm_store_pd
END_FUNC _mm_storeu_pd
END_FUNC _mm_store_si128
END_FUNC _mm_storeu_si128





START_FUNC _mm_store_sd
START_FUNC _mm_storel_pd
START_FUNC _mm_storel_epi64
START_FUNC _mm_storeu_si64
	str d0, [x0]
	ret
END_FUNC _mm_store_sd
END_FUNC _mm_storel_pd
END_FUNC _mm_storel_epi64
END_FUNC _mm_storeu_si64





	make_empty_func _mm_cvtsd_f64
	make_empty_func _mm_movepi64_pi64
	make_empty_func _mm_castpd_ps
	make_empty_func _mm_castpd_si128
	make_empty_func _mm_castps_pd
	make_empty_func _mm_castps_si128
	make_empty_func _mm_castsi128_ps
	make_empty_func _mm_castsi128_pd
	make_empty_func _mm_undefined_pd
	make_empty_func _mm_undefined_si128





START_FUNC _mm_storeh_pd
	st1 {v0.d}[1], [x0]
	ret
END_FUNC _mm_storeh_pd





START_FUNC _mm_cvtsi128_si64
START_FUNC _mm_cvtsi128_si64x
	fmov x0, d0
	ret
END_FUNC _mm_cvtsi128_si64
END_FUNC _mm_cvtsi128_si64x




.macro make_arith_op name, op, reg0, reg1

START_FUNC \name
	\op \reg0, \reg0, \reg1
	ret
END_FUNC \name

.endm


.macro make_arith_op_d name, op

	make_arith_op \name, \op, v0.2d, v1.2d

.endm

	make_arith_op_d _mm_add_pd, fadd
	make_arith_op_d _mm_sub_pd, fsub
	make_arith_op_d _mm_mul_pd, fmul
	make_arith_op_d _mm_div_pd, fdiv





START_FUNC _mm_set_epi64x
	fmov d0, x1
	mov v0.d[1], x0
	ret
END_FUNC _mm_set_epi64x





START_FUNC _mm_set_epi64
	mov v1.d[1], v0.d[0]
	mov v0.16b, v1.16b
	ret
END_FUNC _mm_set_epi64





START_FUNC _mm_set_epi32
	fmov s0, w3
	mov v0.s[1], w2
	mov v0.s[2], w1
	mov v0.s[3], w0
	ret
END_FUNC _mm_set_epi32





START_FUNC _mm_set_epi16
	fmov s0, w7
	mov v0.h[1], w6
	mov v0.h[2], w5
	mov v0.h[3], w4
	mov v0.h[4], w3
	mov v0.h[5], w2
	mov v0.h[6], w1
	mov v0.h[7], w0
	ret
END_FUNC _mm_set_epi16





START_FUNC _mm_set_epi8
	ldrsb w8, [sp, 48]
	ldrsb w9, [sp, 56]
	fmov s0, w9

	ldrsb w12, [sp, 40]
	ldrsb w11, [sp, 32]
	ins v0.b[1], w8

	ldrsb w10, [sp, 24]
	ldrsb w9, [sp, 16]
	ldrsb w8, [sp, 8]

	ins v0.b[2], w12
	ins v0.b[3], w11
	ins v0.b[4], w10
	ins v0.b[5], w9
	ins v0.b[6], w8
	ld1 {v0.b}[7], [sp]

	ins v0.b[8], w7
	ins v0.b[9], w6
	ins v0.b[10], w5
	ins v0.b[11], w4
	ins v0.b[12], w3
	ins v0.b[13], w2
	ins v0.b[14], w1
	ins v0.b[15], w0
	ret
END_FUNC _mm_set_epi8





START_FUNC _mm_set1_epi64x
	dup v0.2d, x0
	ret
END_FUNC _mm_set1_epi64x





START_FUNC _mm_set1_epi64
	dup v0.2d, v0.d[0]
	ret
END_FUNC _mm_set1_epi64




START_FUNC _mm_set1_epi32
	dup v0.4s, w0
	ret
END_FUNC _mm_set1_epi32




START_FUNC _mm_set1_epi16
	dup v0.8h, w0
	ret
END_FUNC _mm_set1_epi16





START_FUNC _mm_set1_epi8
	dup v0.16b, w0
	ret
END_FUNC _mm_set1_epi8




START_FUNC _mm_setr_epi64
	mov v0.d[1], v1.d[0]
	ret
END_FUNC _mm_setr_epi64





START_FUNC _mm_setr_epi32
	fmov s0, w0
	mov v0.s[1], w1
	mov v0.s[2], w2
	mov v0.s[3], w3
	ret
END_FUNC _mm_setr_epi32





START_FUNC _mm_setr_epi16
	fmov s0, w0
	mov v0.h[1], w1
	mov v0.h[2], w2
	mov v0.h[3], w3
	mov v0.h[4], w4
	mov v0.h[5], w5
	mov v0.h[6], w6
	mov v0.h[7], w7
	ret
END_FUNC _mm_setr_epi16





START_FUNC _mm_setr_epi8
	fmov s0, w0
	ldrsb w12, [sp, 8]

	ins v0.b[1], w1
	ldrsb w11, [sp, 16]
	ldrsb w10, [sp, 24]
	ldrsb w9, [sp, 32]
	ldrsb w8, [sp, 40]

	ins v0.b[2], w2
	ldrsb w1, [sp, 48]
	ldrsb w0, [sp, 56]

	ins v0.b[3], w3
	ins v0.b[4], w4
	ins v0.b[5], w5
	ins v0.b[6], w6
	ins v0.b[7], w7
	ld1 {v0.b}[8], [sp]

	ins v0.b[9], w12
	ins v0.b[10], w11
	ins v0.b[11], w10
	ins v0.b[12], w9
	ins v0.b[13], w8
	ins v0.b[14], w1
	ins v0.b[15], w0
	ret
END_FUNC _mm_setr_epi8





START_FUNC _mm_setzero_si128
	movi v0.4s, 0
	ret
END_FUNC _mm_setzero_si128





.macro make_arith_op_family_no64 op, name1, name2, name3

	make_arith_op \name1, \op, v0.16b, v1.16b
	make_arith_op \name2, \op, v0.8h, v1.8h
	make_arith_op \name3, \op, v0.4s, v1.4s

.endm

.macro make_arith_op_family op, name1, name2, name3, name4

	make_arith_op_family_no64 \op, \name1, \name2, \name3
	make_arith_op \name4, \op, v0.2d, v1.2d

.endm

	make_arith_op_family add, _mm_add_epi8, _mm_add_epi16, _mm_add_epi32, _mm_add_epi64
	make_arith_op_family sub, _mm_sub_epi8, _mm_sub_epi16, _mm_sub_epi32, _mm_sub_epi64
	make_arith_op _mm_and_si128, and, v0.16b, v1.16b
	make_arith_op _mm_or_si128, orr, v0.16b, v1.16b
	make_arith_op _mm_xor_si128, eor, v0.16b, v1.16b
	make_arith_op_family_no64 cmeq, _mm_cmpeq_epi8, _mm_cmpeq_epi16, _mm_cmpeq_epi32
	make_arith_op_family_no64 cmgt, _mm_cmplt_epi8, _mm_cmplt_epi16, _mm_cmplt_epi32
	make_arith_op_family_no64 cmgt, _mm_cmpgt_epi8, _mm_cmpgt_epi16, _mm_cmpgt_epi32





START_FUNC _mm_cvtsi32_si128
	movi v0.4s, 0
	mov v0.s[0], w0
	ret
END_FUNC _mm_cvtsi32_si128





.macro make_cvtsi64_si128 name

START_FUNC \name
	fmov d0, x0
	ret
END_FUNC \name

.endm

	make_cvtsi64_si128 _mm_cvtsi64_si128
	make_cvtsi64_si128 _mm_cvtsi64x_si128
