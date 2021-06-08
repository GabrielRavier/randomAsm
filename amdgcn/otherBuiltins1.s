.include "standard.inc"

	.text

START_FUNC bzero
	usualProlog
	doubleVMovB32E32 v9, v2
	usualSmov12 s6
	v_cmp_ne_u64_e32 vcc_lo, 0, v[9:10]
	s_and_saveexec_b32 s4, exec_lo
	s_cbranch_execz .LBZreturn

	doubleVMovB32E320 v11
	s_mov_b32 s5, 0

.LBZloop:
	v_add_co_u32_e64 v6, vcc_lo, v0, v11
	v_mov_b32_e32 v8, 0
	v_add_co_ci_u32_e32 v7, vcc_lo, v1, v12, vcc_lo
	v_add_co_u32_e64 v11, vcc_lo, v11, 1
	flat_store_byte v[6:7], v8
	v_add_co_ci_u32_e32 v12, vcc_lo, 0, v12, vcc_lo
	v_cmp_ge_u64_e32 vcc_lo, v[11:12], v[9:10]
	s_or_b32 s5, vcc_lo, s5
	s_andn2_b32 exec_lo, s5
	s_cbranch_execz .LBZloop

	s_or_b32 exec_lo, s5

.LBZreturn:
	s_or_b32 exec_lo, s4
	usualSmov3 s6

	waitAfterStore
	usualEpilog
END_FUNC bzero





START_FUNC ffs
	usualProlog
	v_ffbl_b32_e32 v1, v0
	v_cmp_ne_u32_e32 vcc_lo, 0, v0
	usualSmov12
	v_add_nc_u32_e32 v1, 1, v1
	usualSmov3
	v_cndmask_b32_e32 v0, 0, v1, vcc_lo
	usualEpilog
END_FUNC ffs





START_FUNC ffsl
START_FUNC ffsll
	usualProlog
	v_ffbl_b32_e32 v2, v1
	v_ffbl_b32_e32 v3, v0
	v_cmp_eq_u32_e32 vcc_lo, 0, v0
	usualSmov12 s5
	v_add_nc_u32_e32 v2, 0x20, v2
	usualSmov3 s5
	v_cndmask_b32_e32 v2, v3, v2, vcc_lo
	v_cmp_ne_u64_e32 vcc_lo, 0, v[0:1]
	v_add_co_u32_e64 v2, s4, v2, 1
	v_add_co_ci_u32_e32 v3, s4, 0, 0, s4
	v_cndmask_b32_e32 v0, 0, v2, vcc_lo
	v_cndmask_b32_e32 v1, 0, v3, vcc_lo
	usualEpilog
END_FUNC ffsl
END_FUNC ffsll





START_FUNC signbitf
START_FUNC signbitl
START_FUNC signbit
	usualProlog
	usualSmov1
	v_lshrrev_b32_e32 v0, 0x1F, v0
	usualSmov23
	usualEpilog
END_FUNC signbitf
END_FUNC signbitl
END_FUNC signbit
