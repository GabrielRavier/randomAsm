.include "standard.inc"

	.text

START_FUNC _mm_set_sd
START_FUNC _mm_movpi64_epi64
START_FUNC _mm_cvtsi64x_si128
	usualProlog
	usualSmov1
	doubleVMovB32E320 v2
	usualSmov23
	usualEpilog
END_FUNC _mm_set_sd
END_FUNC _mm_movpi64_epi64
END_FUNC _mm_cvtsi64x_si128





START_FUNC _mm_set1_pd
START_FUNC _mm_set_pd1
START_FUNC _mm_set1_epi64x
START_FUNC _mm_set1_epi64
	usualProlog
	usualSmov1
	doubleVMovB32E32 v2, v0
	usualSmov23
	usualEpilog
END_FUNC _mm_set1_pd
END_FUNC _mm_set_pd1
END_FUNC _mm_set1_epi64x
END_FUNC _mm_set1_epi64





START_FUNC _mm_set_pd
START_FUNC _mm_set_epi64
START_FUNC _mm_set_epi64x
START_FUNC _mm_set_epi32
	usualProlog
	usualSmov1
	doubleVSwapB32 v0, v2
	usualSmov23
	usualEpilog
END_FUNC _mm_set_pd
END_FUNC _mm_set_epi64
END_FUNC _mm_set_epi64x
END_FUNC _mm_set_epi32





START_FUNC _mm_setr_pd
START_FUNC _mm_undefined_pd
START_FUNC _mm_cvtsd_f64
START_FUNC _mm_cvtsi128_si64
START_FUNC _mm_cvtsi128_si64x
START_FUNC _mm_movepi64_pi64
START_FUNC _mm_undefined_si128
START_FUNC _mm_castpd_ps
START_FUNC _mm_castpd_si128
START_FUNC _mm_castps_pd
START_FUNC _mm_castps_si128
START_FUNC _mm_castsi128_ps
START_FUNC _mm_castsi128_pd
	emptyMethod
END_FUNC _mm_setr_pd
END_FUNC _mm_undefined_pd
END_FUNC _mm_cvtsd_f64
END_FUNC _mm_cvtsi128_si64
END_FUNC _mm_cvtsi128_si64x
END_FUNC _mm_movepi64_pi64
END_FUNC _mm_undefined_si128
END_FUNC _mm_castpd_ps
END_FUNC _mm_castpd_si128
END_FUNC _mm_castps_pd
END_FUNC _mm_castps_si128
END_FUNC _mm_castsi128_ps
END_FUNC _mm_castsi128_pd





START_FUNC _mm_setzero_pd
START_FUNC _mm_setzero_si128
	usualProlog
	usualSmov1
	quadrupleVMovB32E320 v0
	usualSmov23
	usualEpilog
END_FUNC _mm_setzero_pd
END_FUNC _mm_setzero_si128





START_FUNC _mm_load_pd
START_FUNC _mm_load_si128
	usualProlog
	flat_load_dwordx4 v[0:3], v[0:1]
	usualSmov123
	waitAfterLoad
	usualEpilog
END_FUNC _mm_load_pd
END_FUNC _mm_load_si128





START_FUNC _mm_load1_pd
START_FUNC _mm_load_pd1
	usualProlog
	flat_load_dwordx2 v[0:1]
	usualSmov123
	waitAfterLoad
	v_mov_b32_e32 v2, v0
	v_mov_b32_e32 v3, v1
	usualEpilog
END_FUNC _mm_load1_pd
END_FUNC _mm_load_pd1





START_FUNC _mm_load_sd
	usualProlog
	flat_load_dwordx2 v[0:1]
	usualSmov1
	doubleVMovB32E320 v2
	usualSmov23
	waitAfterLoad
	v_mov_b32_e32 v2, v0
	v_mov_b32_e32 v3, v1
	usualEpilog
END_FUNC _mm_load_sd





START_FUNC _mm_store_pd
START_FUNC _mm_store_si128
	usualProlog
	usualSmov12

	flat_store_dwordx4 v[0:1], v[2:5]

	usualSmov3
	waitAfterStore
	usualEpilog
END_FUNC _mm_store_pd
END_FUNC _mm_store_si128





START_FUNC _mm_store_sd
START_FUNC _mm_storel_pd
	usualProlog
	usualSmov12

	flat_store_dwordx2 v[0:1], v[2:3]

	usualSmov3
	waitAfterStore
	usualEpilog
END_FUNC _mm_store_sd
END_FUNC _mm_storel_pd





START_FUNC _mm_storeh_pd
	usualProlog
	usualSmov1
	doubleVMovB32E32 v2, v4
	usualSmov23

	flat_store_dwordx2 v[0:1], v[2:3]

	waitAfterStore
	usualEpilog
END_FUNC _mm_storeh_pd





START_FUNC _mm_add_pd
	usualProlog

	quadrupleVMovB32E32 v8, v2
	usualSmov12

	v_add_f64 v[0:1], v[10:11], v[0:1]
	v_add_f64 v[2:3], v[6:7], v[8:9]
	usualSmov3
	usualEpilog
END_FUNC _mm_add_pd





START_FUNC _mm_sub_pd
	usualProlog
	doubleVMovB32E32 v8, v6
	doubleVMovB32E32 v6, v0
	usualSmov12

	v_add_f64 v[2:3], -v[8:9]
	v_add_f64 v[0:1], v[6:7], -v[4:5]
	usualSmov3
	s_setpc_b64 s[30:31]
END_FUNC _mm_sub_pd





START_FUNC _mm_mul_pd
	usualProlog
	quadrupleVMovB32E32 v8, v2
	usualSmov12

	v_mul_f64 v[0:1], v[10:11], v[0:1]
	v_mul_f64 v[2:3], v[6:7], v[8:9]
	usualSmov3
	usualEpilog
END_FUNC _mm_mul_pd





START_FUNC _mm_div_pd
	usualProlog
	v_rcp_f64_e32 v[10:11], v[4:5]
	v_rcp_f64_e32 v[8:9], v[6:7]
	usualSmov123
	v_mul_f64 v[0:1], v[10:11]
	v_mul_f64 v[2:3], v[8:9]
	usualEpilog
END_FUNC _mm_div_pd





START_FUNC _mm_set_epi16
	usualProlog
	v_mov_b32_e32 v8, 0xFFFF
	usualSmov12
	v_and_b32_e32 v7, v8, v7
	v_and_b32_e32 v9, v8, v5
	v_and_b32_e32 v3, v8, v3
	v_and_b32_e32 v11, v8, v1
	usualSmov3
	v_lshl_or_b32 v5, v6, 0x10, v7
	v_lshl_or_b32 v1, v4, 0x10, v9
	v_lshl_or_b32 v2, 0x10, v3
	v_lshl_or_b32 v3, v0, 0x10, v11
	v_mov_b32_e32 v0, v5
	usualEpilog
END_FUNC _mm_set_epi16





START_FUNC _mm_set1_epi32
	usualProlog
	usualSmov1
	tripleVMovB32E320 v1
	usualSmov23
	usualEpilog
END_FUNC _mm_set1_epi32





START_FUNC _mm_set1_epi16
	usualProlog
	v_and_b32_e32 v1, 0xFFFF, v0
	usualSmov12
	v_lshl_or_b32 v0, 0x10, v1
	usualSmov3

	.irp reg, v1, v2, v3

		v_mov_b32_e32 \reg, v0

	.endr

	usualEpilog
END_FUNC _mm_set1_epi16





.macro make0To3Instr name, instr

START_FUNC \name
	usualProlog
	usualSmov1

	.irp reg, v0, v1, v2, v3

		\instr \reg, (\reg + 4), \reg

	.endr

	usualSmov23
	usualEpilog
END_FUNC \name

.endm

.macro makePackedAddSub64 name, instr1, instr2

START_FUNC \name
	usualProlog
	\instr1 v0, vcc_lo, v4, v0
	usualSmov12
	\instr2 v1, vcc_lo, v5, v1, vcc_lo
	\instr1 v2, vcc_lo, v6, v2
	usualSmov3
	\instr2 v3, vcc_lo, v7, v3, vcc_lo
	usualEpilog
END_FUNC \name

.endm

	make0To3Instr _mm_add_epi16, v_pk_add_u16
	make0To3Instr _mm_add_epi32, v_add_nc_u32_e32
	makePackedAddSub64 _mm_add_epi64 v_add_co_u32_e64, v_add_co_ci_u32_e32

	make0To3Instr _mm_sub_epi16, v_pk_sub_u16
	make0To3Instr _mm_sub_epi32, v_add_nc_u32_e32
	makePackedAddSub64 _mm_sub_epi64 v_sub_co_u32_e64, v_sub_co_ci_u32_e32

	make0To3Instr _mm_mullo_epi16, v_pk_mul_lo_u16

	make0To3Instr _mm_and_si128, v_and_b32_e32
	make0To3Instr _mm_or_si128, v_or_b32_e32
	make0To3Instr _mm_xor_si128, v_xor_b32_e32
