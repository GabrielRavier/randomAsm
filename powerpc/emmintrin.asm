	.text

_mm_set_sd:
	xxlxor 0
	xxpermdi 34, 1, 0, 0
	blr





_mm_set1_pd:
_mm_set_pd1:
	xxpermdi 34, 1, 1, 0
	blr





_mm_set_pd:
	xxpermdi 34, 2, 1, 0
	blr





_mm_setr_pd:
	xxpermdi 34, 1, 2, 0
	blr





_mm_undefined_pd:
_mm_setzero_pd:
_mm_undefined_si128:
_mm_setzero_si128:
	xxlxor 34
	blr





_mm_move_sd:
	xxpermdi 34, 35, 34, 1
	blr





_mm_load_pd:
_mm_loadu_pd:
_mm_load_si128:
_mm_loadu_si128:
	lxvd2x 34, 0, 3
	blr





_mm_load1_pd:
_mm_load_pd1:
	lxvdsx 34, 0, 3
	blr





_mm_load_sd:
	lfd 12, 0(3)
	xxlxor 0
	xxpermdi 34, 12, 0, 0
	blr





_mm_store_pd:
_mm_storeu_pd:
_mm_store_si128:
_mm_storeu_si128:
	stxvd2x 34, 0, 3
	blr





_mm_store_sd:
_mm_storel_pd:
	xxpermdi 0, 34, 34, 0
	stfd 0, 0(3)
	blr





_mm_cvtsd_f64:
	xxpermdi 1, 34, 34, 0
	blr





_mm_storeh_pd:
	xxpermdi 0, 34, 34, 2
	stfd 0, 0(3)
	blr





_mm_cvtsi128_si64:
_mm_cvtsi128_si64x:
	stwu 1, -16(1)
	xxpermdi 0, 34, 34, 0
	stfd 0, 8(1)
	ori 2, 0
	lwz 3, 8(1)
	lwz 4, 12(1)
	addi 1, 0x10
	blr





_mm_add_pd:
	xvadddp 34, 35
	blr





_mm_sub_pd:
	xvsubdp 34, 35
	blr





_mm_mul_pd:
	xvmuldp 34, 35
	blr





_mm_div_pd:
	xvdivdp 34, 35
	blr





_mm_set_epi64x:
_mm_set_epi64:
	stwu 1, -16(1)
	stw 5, 8(1)
	stw 6, 12(1)
	ori 2, 0

	lfd 0, 8(1)
	stw 3, 8(1)
	stw 4, 12(1)
	ori 2, 0

	lfd 12, 8(1)
	addi 1, 0x10
	xxpermdi 34, 0, 12, 0
	blr





_mm_set_epi32:
	stwu 1, -32(1)
	li 9, 0x10
	stw 6, 16(1)
	stw 5, 20(1)
	stw 4, 24(1)
	stw 3, 28(1)

	lxvd2x 34, 1, 9
	addi 1, 0x20
	blr





_mm_set_epi16:
	stwu 1, -32(1)
	sth 9, 18(1)
	sth 10, 16(1)
	li 9, 0x10
	sth 8, 20(1)
	sth 7, 22(1)
	sth 6, 24(1)
	sth 5, 26(1)
	sth 4, 28(1)
	sth 3, 30(1)

	lxvd2x 34, 1, 9
	addi 1, 0x20
	blr





_mm_set1_epi64x:
_mm_set1_epi64:
	stwu 1, -0x10(1)
	stw 3, 8(1)
	stw 4, 12(1)
	ori 2, 0

	lfd 0, 8(1)
	addi 1, 0x10
	xxpermdi 34, 0, 0, 0
	blr





_mm_set1_epi32:
	stwu 1, -0x20(1)
	li 9, 0x10
	stw 3, 0x10(1)
	lvewx 2, 1, 9

	addi 1, 0x20
	xxspltw 34, 0
	blr





_mm_set1_epi16:
	stwu 1, -0x20(1)
	li 9, 0x10
	sth 3, 16(1)
	lvehx 2, 1, 9

	addi 1, 0x20
	vsplth 2, 0
	blr





_mm_set1_epi8:
	stwu 1, -0x20(1)
	li 9, 0x10
	stb 3, 16(1)
	lvebx 2, 1, 9

	addi 1, 0x20
	vspltb 2, 0
	blr





_mm_loadl_epi64:
_mm_loadu_si64:
	stwu 1, -0x10(1)
	li 9, 0
	li 10, 0
	lfd 12, 0(3)
	stw 9, 8(1)
	stw 10, 12(1)
	ori 2, 0
	lfd 0, 8(1)

	addi 1, 0x10
	xxpermdi 34, 12, 0, 0
	blr





_mm_storel_epi64:
	xxpermdi 0, 34, 34, 0
	stfd 0, 0(3)
	blr





_mm_storeu_epi64:
	xxpermdi 0, 34, 34, 0
	stfd 0, 0(3)
	blr





_mm_movepi64_pi64:
	stwu 1, -0x10(1)
	xxpermdi 0, 34, 34, 0
	stfd 0, 8(1)
	ori 2, 0

	lwz 3, 8(1)
	lwz 4, 12(1)

	addi 1, 0x10
	blr





_mm_movpi64_epi64:
	stwu 1, -0x10(1)
	li 9, 0
	li 10, 0
	stw 9, 8(1)
	stw 10, 12(1)
	ori 2, 0
	lfd 0, 8(1)

	stw 3, 8(1)
	stw 4, 12(1)
	ori 2, 0
	lfd 12, 8(1)
	addi 1, 0x10
	xxpermdi 34, 12, 0, 0
	blr





_mm_add_epi8:
	vaddubm 2, 3
	blr





_mm_add_epi16:
	vadduhm 2, 3
	blr





_mm_add_epi32:
	vadduwm 2, 3
	blr





_mm_add_epi64:
	vaddudm 2, 3
	blr





_mm_sub_epi8:
	vsububm 2, 3
	blr





_mm_sub_epi16:
	vsubuhm 2, 3
	blr





_mm_sub_epi32:
	vsubuwm 2, 3
	blr





_mm_sub_epi64:
	vsubudm 2, 3
	blr





_mm_and_si128:
	xxland 34, 35
	blr





_mm_or_si128:
	xxlor 34, 35
	blr





_mm_xor_si128:
	xxlxor 34, 35
	blr





_mm_cmpeq_epi8:
	vcmpequb 2, 3
	xxlxor 32
	vspltisw 1, -1
	xxsel 34, 32, 33, 34
	blr





_mm_cmpeq_epi16:
	vcmpequh 2, 3
	xxlxor 32
	vspltisw 1, -1
	xxsel 34, 32, 33, 34
	blr





_mm_cmpeq_epi32:
	vcmpequw 2, 3
	xxlxor 32
	vspltisw 1, -1
	xxsel 34, 32, 33, 34
	blr





_mm_cmplt_epi8:
_mm_cmpgt_epi8:
	vcmpgtsb 2, 3
	xxlxor 32
	vspltisw 1, -1
	xxsel 34, 32, 33, 34
	blr





_mm_cmplt_epi16:
_mm_cmpgt_epi16:
	vcmpgtsh 2, 3
	xxlxor 32
	vspltisw 1, -1
	xxsel 34, 32, 33, 34
	blr





_mm_cmplt_epi32:
_mm_cmpgt_epi32:
	vcmpgtsw 2, 3
	xxlxor 32
	vspltisw 1, -1
	xxsel 34, 32, 33, 34
	blr





_mm_castpd_ps:
_mm_castpd_si128:
_mm_castps_pd:
_mm_castps_si128:
_mm_castsi128_ps:
_mm_castsi128_pd:
	blr
