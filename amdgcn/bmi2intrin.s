.include "standard.inc"

	.text

START_FUNC _mulx_u64
	usualProlog
	v_mov_b32_e32 v6, v2
	v_mov_b32_e32 v7, v1

	v_mov_b32_e32 v2, 0
	usualSmov12 s5
	v_mul_hi_u32 v1, v6, v0
	s_mov_b32 s34, s5
	v_mad_u64_u32 v[8:9], s4, v3, v0, v[1:2]
	v_mul_lo_u32 v0, v6, v0
	v_mov_b32_e32 v10, v9
	v_mov_b32_e32 v9, v2
	v_mad_u64_u32 v[1:2], s4, v6, v7, v[8:9]
	v_mov_b32_e32 v11, v2
	v_add_co_u32_e64 v8, s4, v10, v11
	v_add_co_ci_u32_e64 v9, s4, 0, 0, s4
	v_mad_u64_u32 v[2:3], s4, v3, v7, v[8:9]

	flat_store_dwordx2 v[4:5], v[2:3]
	waitAfterStore
	usualEpilog
END_FUNC _mulx_u64





START_FUNC _mulx_u32
	usualProlog

	v_mul_hi_u32 v4, v1, v0
	v_mul_lo_u32 v0, v1, v0
	usualSmov123

	flat_store_dword v[2:3], v4
	waitAfterStore
	usualEpilog
END_FUNC _mulx_u32
