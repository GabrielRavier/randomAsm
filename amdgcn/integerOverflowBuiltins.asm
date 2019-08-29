.include "standard.inc"

	.text

sadd_overflow:
	usualProlog
	v_cmp_lt_i32_e32 vcc_lo, -1, v1
	v_add_nc_u32_e32 v4, v0, v1
	usualSmov12 s5
	v_cndmask_b32_e64 v1, 0, 1, vcc_lo
	v_cmp_lt_i32_e32 vcc_lo, -1, v0
	flat_store_dword v[2:3], v4
	usualSmov3 s5
	v_cndmask_b32_e64 v0, 0, 1, vcc_lo
	v_cmp_lt_i32_e32 vcc_lo, -1, v4
	v_cndmask_b32_e64 v5, 0, 1, vcc_lo
	v_cmp_eq_u32_e32 vcc_lo, v0, v1
	v_cmp_ne_u32_e64 s4, v0, v5
	s_and_b32 s4, vcc_lo, s4
	v_cndmask_b32_e64 v0, 0, 1, s4
	waitAfterStore
	usualEpilog





saddl_overflow:
saddll_overflow:
	usualProlog
	v_add_co_u32_e64 v6, vcc_lo, v0, v2
	usualSmov12 s5
	v_add_co_ci_u32_e32 v7, vcc_lo, v1, v3, vcc_lo
	v_cmp_lt_i64_e32 vcc_lo, -1, v[2:3]
	usualSmov3 s5
	flat_store_dwordx2 v[4:5], v[6:7]
	v_cndmask_b32_e64 v2, 0, 1, vcc_lo
	v_cmp_lt_i64_e32 vcc_lo, -1, v[0:1]
	v_cndmask_b32_e64 v0, 0, 1, vcc_lo
	v_cmp_lt_i64_e32 vcc_lo, -1, v[6:7]
	v_cndmask_b32_e64 v1, 0, 1, vcc_lo
	v_cmp_eq_u32_e32 vcc_lo, v0, v2
	v_cmp_ne_u32_e64 s4, v0, v1
	s_and_b32 s4, vcc_lo, s4
	v_cndmask_b32_e64 v0, 0, 1, s4
	waitAfterStore
	usualEpilog





uadd_overflow:
	usualProlog
	v_add_co_u32_e64 v1, s4, v0, v1
	usualSmov12 s5
	v_cndmask_b32_e64 v0, 0, 1, s4
	flat_store_dword v[2:3], v1
	usualSmov3 s5
	waitAfterStore
	usualEpilog





uaddl_overflow:
uaddll_overflow:
	usualProlog
	v_add_co_u32_e64 v2, vcc_lo, v0, v2
	usualSmov12
	v_add_co_ci_u32_e32 v3, vcc_lo, v1, v3, vcc_lo
	usualSmov3
	v_cmp_lt_u64_e32 vcc_lo, v[2:3], v[0:1]
	flat_store_dwordx2 v[4:5], v[2:3]
	v_cndmask_b32_e64 v0, 0, 1, vcc_lo
	waitAfterStore
	usualEpilog
