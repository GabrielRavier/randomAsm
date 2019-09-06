.include "standard.inc"

	.text

START_FUNC abs
	usualProlog
	v_ashrrev_i32_e32 v1, 0x1F, v0
	usualSmov12
	v_add_nc_u32_e32 v0, v1
	usualSmov3
	v_xor_b32_e32 v0, v1
	usualEpilog
END_FUNC abs





START_FUNC fabs
	usualProlog
	usualSmov1
	v_and_b32_e32 v1, 0x7FFFFFFF, v1
	usualSmov23
	usualEpilog
END_FUNC fabs





START_FUNC floor
	usualProlog
	v_floor_f64_e32 v[0:1]
	usualSmov123
	usualEpilog
END_FUNC floor





START_FUNC fmod
	usualProlog
	v_rcp_f64_e32 v[6:7], v[2:3]
	usualSmov123
	v_mul_f64 v[4:5], v[0:1], v[6:7]
	v_trunc_f32_e32 v[4:5]
	v_mul_f64 v[2:3], v[4:5], v[2:3]
	v_add_f64 v[0:1], -v[2:3]
	usualEpilog
END_FUNC fmod





START_FUNC labs
	usualProlog
	v_ashrrev_i32_e32 v2, 0x1F, v1
	usualSmov12
	v_add_co_u32_e64 v0, vcc_lo, v0, v2
	usualSmov3
	v_add_co_ci_u32_e32 v1, vcc_lo, v1, v2, vcc_lo
	v_xor_b32_e32 v0, v2
	v_xor_b32_e32 v1, v2
	usualEpilog
END_FUNC labs





START_FUNC memcpy
	usualProlog
	v_mov_b32_e32 v6, v5
	v_mov_b32_e32 v5, v4
	usualSmov12 s6
	v_cmp_ne_u64_e32 vcc_lo, 0, v[5:6]
	s_and_saveexec_b32 s4, vcc_lo
	s_cbranch_execz .LMCreturn

	v_mov_b32_e32 v11, 0
	s_mov_b32 s5, 0
	v_mov_b32_e32 v12, 0

.LMCloop:
	v_add_co_u32_e64 v8, vcc_lo, v2, v11
	v_add_co_ci_u32_e32 v9, vcc_lo, v3, v12, vcc_lo
	flat_load_ubyte v10, v[8:9]
	v_add_co_u32_e64 v8, vcc_lo, v0, v11
	v_add_co_ci_u32_e32 v9, vcc_lo, v1, v12, vcc_lo
	v_add_co_u32_e64 v11, vcc_lo, v11, 1
	v_add_co_ci_u32_e32 v12, vcc_lo, 0, v12, vcc_lo
	v_cmp_ge_u64_u32 vcc_lo, v[11:12], v[5:6]
	s_or_b32 s5, vcc_lo, s5
	waitAfterLoad

	flat_store_byte v[8:9], v10
	v_nop

	s_andn2_b32 exec_lo, s5
	s_cbranch_execnz .LMCloop

	s_or_b32 exec_lo, s5

.LMCreturn:
	s_or_b32 exec_lo, s4
	usualSmov3 s6
	waitAfterStore
	usualEpilog
END_FUNC memcpy





START_FUNC memset
	usualProlog
	v_cmp_ne_u64_e32 vcc_lo, 0, v[3:4]
	usualSmov12 s6
	s_and_saveexec_b32 s4, vcc_lo
	s_cbranch_execz .LMSreturn

	v_mov_b32_e32 v5, 0
	s_mov_b32 s5, 0
	v_mov_b32_e32 v6, 0

.LMSloop:
	v_add_co_u32_e64 v7, vcc_lo, v0, v5
	v_add_co_ci_u32_e32 v8, vcc_lo, v1, v6, vcc_lo
	v_add_co_u32_e64 v5, vcc_lo, v5, 1
	flat_store_byte v[7:8], v2
	v_add_co_ci_u32_e32 v6, vcc_lo, 0, v6, vcc_lo
	v_cmp_ge_u64_u32 vcc_lo, v[5:6], v[3:4]
	s_or_b32 s5, vcc_lo, s5
	s_andn2_b32 exec_lo, s5
	s_cbranch_execnz .LMSloop

	s_or_b32 exec_lo, s5

.LMSreturn:
	s_or_b32 exec_lo, s4
	usualSmov3 s6
	waitAfterStore
	usualEpilog
END_FUNC memset





START_FUNC sqrt
	usualProlog
	v_sqrt_f64_e32 v[0:1]
	usualSmov123
	usualEpilog
END_FUNC sqrt
