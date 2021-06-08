.include "standard.inc"

	.section .rodata

Ldat0:
	.byte 31, 30, 29, 28
	.byte 23, 22, 21, 20
	.byte 15, 14, 13, 12
	.byte 7, 6, 5, 4

Ldat1:
	.byte 15, 14, 13, 12
	.byte 27, 26, 25, 24
	.byte 23, 22, 21, 20
	.byte 19, 18, 17, 16

	.text

START_FUNC _mm_undefined_ps
START_FUNC _mm_setzero_ps
	vspltisw 2, 0
	blr
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
END_FUNC _mm_undefined_ps
END_FUNC _mm_setzero_ps

.macro mkOp name, op

START_FUNC \name
	\op 34, 35
	blr
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
END_FUNC \name

.endm

	mkOp _mm_add_ps, xvaddsp
	mkOp _mm_sub_ps, xvsubsp
	mkOp _mm_mul_ps, xvmulsp
	mkOp _mm_div_ps, xvdivsp





START_FUNC _mm_set_ss
	addis 2, 12, .TOC. - _mm_set_ss@ha
	addi 2, .TOC. - _mm_set_ss@l
	xxlxor 0

	addis 9, 2, Ldat0@toc@ha
	addi 9, Ldat0@toc@l

	xxpermdi 33, 0, 0, 0
	xxpermdi 32, 0, 1, 0
	xxcvdpsp 34, 33
	xxcvdpsp 32
	lxvd2x 33, 0, 9
	xxpermdi 33, 2
	vperm 2, 0, 1
	blr
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
END_FUNC _mm_set_ss





START_FUNC _mm_set1_ps
START_FUNC _mm_set_ps1
	xscvdpspn 1
	xxspltw 34, 1, 0
	blr
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
END_FUNC _mm_set1_ps
END_FUNC _mm_set_ps1





START_FUNC _mm_load_ss
	addis 2, 12, .TOC. - _mm_load_ss@ha
	addi 2, .TOC. - _mm_load_ss@l

	lfs 12, 0(3)
	xxlxor 0

	addis 9, 2, Ldat0@toc@ha
	addi 9, Ldat0@toc@l

	xxpermdi 33, 0, 0? 0
	xxcvdpsp 34, 33
	lxvd2x 33, 0, 9
	xxpermdi 32, 0, 12, 0
	xxcvdpsp 32
	xxpermdi 33, 2
	vperm 2, 0, 1
	blr
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
END_FUNC _mm_load_ss




START_FUNC _mm_load1_ps
START_FUNC _mm_load_ps1
	lxsspx 34, 0, 3
	xscvdpspn 34
	xxspltw 34, 0
	blr
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
END_FUNC _mm_load1_ps
END_FUNC _mm_load_ps1





START_FUNC _mm_load_ps
START_FUNC _mm_loadu_ps
	lxvd2x 34, 0, 3
	xxpermdi 34, 2
	blr
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
END_FUNC _mm_load_ps
END_FUNC _mm_loadu_ps





START_FUNC _mm_set_ps
	addis 2, 12, .TOC. - _mm_set_ps@ha
	addi 2, .TOC. - _mm_set_ps@l

	addis 9, 2, Ldat0@toc@ha
	xxpermdi 34, 3, 4, 0
	xxpermdi 34, 1, 2, 0
	addi 9, Ldat0@toc@l

	xxcvdpsp 32
	xxcvdpsp 34
	lxvd2x 33, 0, 9

	xxpermdi 33, 2
	vperm 2, 0, 1
	blr
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
END_FUNC _mm_set_ps





START_FUNC _mm_setr_ps
	addis 2, 12, .TOC. - _mm_set_ps@ha
	addi 2, .TOC. - _mm_set_ps@l

	addis 9, 2, Ldat0@toc@ha
	xxpermdi 34, 2, 1, 0
	xxpermdi 34, 4, 3, 0
	addi 9, Ldat0@toc@l

	xxcvdpsp 32
	xxcvdpsp 34
	lxvd2x 33, 0, 9

	xxpermdi 33, 2
	vperm 2, 0, 1
	blr
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
END_FUNC _mm_set_ps





START_FUNC _mm_store_ss
	xxsldwi 34, 3
	xscvspdp 0, 34
	stfs 0, 0(3)
	blr
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
END_FUNC _mm_store_ss





START_FUNC _mm_cvtss_f32
	xxsldwi 34, 3
	xscvspdp 1, 34
	blr
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
END_FUNC _mm_cvtss_f32





START_FUNC _mm_store_ps
START_FUNC _mm_storeu_ps
	xxpermdi 34, 2
	stxvd2x 34, 0, 3
	blr
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
END_FUNC _mm_store_ps
END_FUNC _mm_storeu_ps





START_FUNC _mm_move_ss
	addis 2, 12, .TOC. - _mm_move_ss@ha
	addi 2, .TOC. - _mm_move_ss@l

	addis 9, 2, Ldat1@toc@ha
	addi 9, Ldat1@toc@l

	lxvd2x 32, 0, 9
	xxpermdi 32, 2
	vperm 2, 3, 2, 0
	blr
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
END_FUNC _mm_move_ss
