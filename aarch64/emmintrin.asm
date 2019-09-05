.include "standard.inc"

	.text

START_FUNC _mm_set_sd
	mov v0.8b
	ret
END_FUNC _mm_set_sd





START_FUNC _mm_set1_pd
START_FUNC _mm_set_pd1
	dup v0.2d, v0.d[0]
	ret
END_FUNC _mm_set1_pd
END_FUNC _mm_set_pd1





START_FUNC _mm_set_pd
	dup v1.2d, v1.d[0]
	ins v1.d[1], v0.d[0]
	mov v0.16b, v1.16b
	ret
END_FUNC _mm_set_pd





START_FUNC _mm_setr_pd
	dup v0.2d, v0.d[0]
	ins v0.d[1], v1.d[0]
	ret
END_FUNC _mm_setr_pd





START_FUNC _mm_undefined_pd
START_FUNC _mm_setzero_pd
	movi v0.2d, 0
	ret
END_FUNC _mm_undefined_pd
END_FUNC _mm_setzero_pd





START_FUNC _mm_move_sd
	adrp x0, .moveSdDat
	ldr q2, [x0, #:lo12:.moveSdDat]
	tbl v0.16b, {v0.16b - v1.16b}, v2.16b
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





START_FUNC _mm_cvtsd_f64
START_FUNC _mm_movepi64_pi64
START_FUNC _mm_castpd_ps
START_FUNC _mm_castpd_si128
START_FUNC _mm_castps_pd
START_FUNC _mm_castps_si128
START_FUNC _mm_castsi128_ps
START_FUNC _mm_castsi128_pd
	ret
END_FUNC _mm_cvtsd_f64
END_FUNC _mm_movepi64_pi64
END_FUNC _mm_castpd_ps
END_FUNC _mm_castpd_si128
END_FUNC _mm_castps_pd
END_FUNC _mm_castps_si128
END_FUNC _mm_castsi128_ps
END_FUNC _mm_castsi128_pd





_mm_storeh_pd:
	st1 {v0.d}[1], [x0]
	ret





_mm_cvtsi128_si64:
_mm_cvtsi128_si64x:
	umov x0, v0.d[0]
	ret





_mm_add_pd:
	fadd v0.2d, v1.2d
	ret





_mm_sub_pd:
	fsub v0.2d, v1.2d
	ret





_mm_mul_pd:
	fmul v0.2d, v1.2d
	ret





_mm_div_pd:
	fdiv v0.2d, v1.2d
	ret





_mm_set_epi64x:
	dup v0.2d, x1
	ins v0.d[1], x0
	ret





_mm_set_epi64:
	dup v1.2d, v1.d[0]
	ins v1.d[1], v0.d[0]
	mov v0.16b, v1.16b
	ret





_mm_set_epi32:
	dup v0.4s, w3
	ins v0.s[1], w2
	ins v0.s[2], w1
	ins v0.s[3], w0
	ret





_mm_set_epi16:
	dup v0.8h, w7
	ins v0.h[1], w6
	ins v0.h[2], w5
	ins v0.h[3], w4
	ins v0.h[4], w3
	ins v0.h[5], w2
	ins v0.h[6], w1
	ins v0.h[7], w0
	ret





_mm_set_epi8:
	ldrb w8, [sp, 56]
	ldrb w13, [sp, 48]
	ldrb w12, [sp, 40]
	dup v0.16b, w8

	ldrb w11, [sp, 32]
	ldrb w10, [sp, 24]
	ldrb w9, [sp, 16]
	ldrb w8, [sp, 8]

	ins v0.b[1], w13
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





_mm_set1_epi64x:
	dup v0.2d, x0
	ret





_mm_set1_epi64:
	dup v0.2d, v0.d[0]
	ret




_mm_set1_epi32:
	dup v0.4s, w0
	ret




_mm_set1_epi16:
	dup v0.8h, w0
	ret





_mm_set1_epi8:
	dup v0.16b, w0
	ret




_mm_setr_epi64:
	dup v0.2d, v0.d[0]
	ins v0.d[1], v1.d[0]
	ret





_mm_setr_epi32:
	dup v0.4s, w0
	ins v0.s[1], w1
	ins v0.s[2], w2
	ins v0.s[3], w3
	ret





_mm_setr_epi16:
	dup v0.8h, w0
	ins v0.h[1], w1
	ins v0.h[2], w2
	ins v0.h[3], w3
	ins v0.h[4], w4
	ins v0.h[5], w5
	ins v0.h[6], w6
	ins v0.h[7], w7
	ret





_mm_set_epi8:
	dup v0.16b, w0
	ldrb w12, [sp, 8]
	ldrb w11, [sp, 16]
	ldrb w10, [sp, 24]
	ins v0.b[1], w1

	ldrb w8, [sp, 40]
	ldrb w1, [sp, 48]
	ldrb w0, [sp, 56]

	ins v0.b[2], w2
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





_mm_movpi64_epi64:
	dup d0, v0.d[0]
	ret





_mm_undefined_si128:
_mm_setzero_si128:
	movi v0.4s, 0
	ret





_mm_add_epi8:
	add v0.16b, v1.16b
	ret





_mm_add_epi16:
	add v0.8h, v1.8h
	ret





_mm_add_epi32:
	add v0.4s, v1.4s
	ret





_mm_add_epi64:
	add v0.2d, v0.2d
	ret





_mm_sub_epi8:
	sub v0.16b, v1.16b
	ret





_mm_sub_epi16:
	sub v0.8h, v1.8h
	ret





_mm_sub_epi32:
	sub v0.4s, v1.4s
	ret





_mm_sub_epi64:
	sub v0.2d, v0.2d
	ret





_mm_and_si128:
	and v0.16b, v1.16b
	ret





_mm_or_si128:
	orr v0.16b, v1.16b
	ret





_mm_xor_si128:
	eor v0.16b, v1.16b
	ret





_mm_cmpeq_epi8:
	cmeq v0.16b, v1.16b
	ret





_mm_cmpeq_epi16:
	cmeq v0.8h, v1.8h
	ret





_mm_cmpeq_epi32:
	cmeq v0.4s, v1.4s
	ret





_mm_cmplt_epi8:
_mm_cmpgt_epi8:
	cmgt v0.16b, v1.16b
	ret





_mm_cmplt_epi16:
_mm_cmpgt_epi16:
	cmgt v0.8h, v1.8h
	ret





_mm_cmplt_epi32:
_mm_cmpgt_epi32:
	cmgt v0.4s, v1.4s
	ret





_mm_cvtsi32_si128:
	movi v0.4s, 0
	ins v0.s[0], w0
	ret





_mm_cvtsi64_si128:
_mm_cvtsi64x_si128:
	fmov d0, x0
	ret

	.section .rodata

.moveSdDat:
	.byte 16, 17, 18, 19, 20, 21, 22, 23, 8, 9, 10, 11, 12, 13, 14, 15
