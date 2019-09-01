.include "standard.inc"

	.text

powi:
powil:
__powidf2:
__powitf2:
	usualProlog
	v_and_b32_e32 v3, 1, v2
	v_add_nc_u32_e32 v5, 1, v2
	doubleVMovB32E32 v13, v0
	s_mov_b32 s5, 0

	v_cmp_eq_u32_e32 vcc_lo, 1, v3
	v_cmp_lt_u32_e64 s4, 2, v5
	usualSmov12 s7

	v_cndmask_b32_e32 v4, 0x3FF00000, v14, vcc_lo
	v_cndmask_b32_e32 v3, 0, v13, vcc_lo
	s_and_saveexec_b32 s6, s4
	s_cbranch_execz .return
	v_mov_b32_e32 v5, v2

.loop:
	v_mul_f64 v[13:14]
	v_lshrrev_b32_e32 v6, 0x1F, v5
	v_add_nc_u32_e32 v5, v6
	v_ashrrev_i32_e32 v5, 1, v5

	v_add_nc_u32_e32 v8, 1, v5
	v_mul_f64 v[6:7], v[3:4], v[13:14]

	v_and_b32_e32 v9, 1, v5
	v_cmp_gt_u32_e32 vcc_lo, 3, v8
	v_cmp_eq_u32_e64 s4, 0, v9
	s_or_b32 s4, 0, v9
	v_cndmask_b32_e32 v4, v7, v4, s4
	v_cndmask_b32_e32 v3, v6, v3, s4
	s_andn2_b32 exec_lo, s5
	s_cbranch_execz .loop

	s_or_b32 exec_lo, s5

.return:
	s_or_b32 exec_lo, s6
	v_rcp_f64_e32 v[0:1], v[3:4]
	v_cmp_gt_i32_e32 vcc_lo, 0, v2
	usualSmov3 s7

	v_cndmask_b32_e32 v0, v3, v0, vcc_lo
	v_cndmask_b32_e32 v1, v4, v1, vcc_lo
	usualEpilog





powif:
__powisf2:
	usualProlog
	v_and_b32_e32 v2, 1, v1

	v_add_nc_u32_e32 v3, 1, v1
	usualSmov12 s7

	v_cmp_eq_u32_e32 vcc_lo, 1, v2
	v_cndmask_b32_e32 v2, 1.0, v0, vcc_lo

	v_cmp_lt_u32_e32 vcc_lo, 2, v3
	s_and_saveexec_b32 s5, vcc_lo
	s_cbranch_execz .return

	s_mov_b32 s6, 0
	v_mov_b32_e32 v3, v1

.loop:
	v_lshrrev_b32_e32 v4, 0x1F, v3
	v_mul_f32_e32 v0
	v_add_nc_u32_e32 v3, v4
	v_mul_f32_e32 v4, v2, v0
	v_ashrrev_i32_e32 v3, 1, v3

	v_add_nc_u32_e32 v5, 1, v3
	v_cmp_gt_u32_e32 vcc_lo, 3, v5

	v_and_b32_e32 v5, 1, v3
	s_or_b32 s6, vcc_lo, s6
	v_cmp_eq_u32_e64 s4, 0, v5
	v_cndmask_b32_e32 v2, v4, v2, s4
	s_andn2_b32 exec_lo, s6
	s_cbranch_execz .loop

	s_or_b32 exec_lo, s6

.return:
	s_or_b32 exec_lo, s5
	v_rcp_f32_e32 v0, v2
	v_cmp_gt_i32_e32 vcc_lo, 0, v1

	usualSmov3 s7
	v_cndmask_b32_e32 v0, v2, v0, vcc_lo
	usualEpilog
