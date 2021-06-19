.include "standard.inc"

	.text

	make_empty_func _mm_undefined_ps





START_FUNC _mm_setzero_ps
	movi v0.4s, 0
	ret
END_FUNC _mm_setzero_ps





.macro mkOp name, op

START_FUNC \name
	\op v0.4s, v0.4s, v1.4s
	ret
END_FUNC \name

.endm

	mkOp _mm_add_ps, fadd
	mkOp _mm_sub_ps, fsub
	mkOp _mm_mul_ps, fmul
	mkOp _mm_div_ps, fdiv





START_FUNC _mm_set_ss
	movi v1.4s, 0
	ins v1.s[0], v0.s[0]
	mov v0.16b, v1.16b
	ret
END_FUNC _mm_set_ss





START_FUNC _mm_set1_ps
START_FUNC _mm_set_ps1
	dup v0.4s, v0.s[0]
	ret
END_FUNC _mm_set1_ps
END_FUNC _mm_set_ps1





START_FUNC _mm_load_ss
	movi v0.4s, 0
	ld1 {v0.s}[0], [x0]
	ret
END_FUNC _mm_load_ss





START_FUNC _mm_load1_ps
START_FUNC _mm_load_ps1
	ld1r {v0.4s}, [x0]
	ret
END_FUNC _mm_load1_ps
END_FUNC _mm_load_ps1





START_FUNC _mm_load_ps
START_FUNC _mm_loadu_ps
	ldr q0, [x0]
	ret
END_FUNC _mm_load_ps
END_FUNC _mm_loadu_ps





START_FUNC _mm_set_ps
	ins v3.s[1], v2.s[0]
	ins v3.s[2], v1.s[0]
	ins v3.s[3], v0.s[0]
	mov v0.16b, v3.16b
	ret
END_FUNC _mm_set_ps





START_FUNC _mm_setr_ps
	ins v0.s[1], v1.s[0]
	ins v0.s[2], v2.s[0]
	ins v0.s[3], v3.s[0]
	ret
END_FUNC _mm_setr_ps





START_FUNC _mm_store_ss
	str s0, [x0]
	ret
END_FUNC _mm_store_ss





	make_empty_func _mm_cvtss_f32





START_FUNC _mm_store_ps
START_FUNC _mm_storeu_ps
	str q0, [x0]
	ret
END_FUNC _mm_store_ps
END_FUNC _mm_storeu_ps





START_FUNC _mm_move_ss
	ins v0.s[0], v1.s[0]
	ret
END_FUNC _mm_move_ss
