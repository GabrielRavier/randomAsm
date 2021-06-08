.include "standard.inc"

	.text

START_FUNC isfinite
	usualProlog
	v_cmp_class_f64_e64 s4, v[0:1], 0x1F8
	usualSmov123 s5
	v_cndmask_b32_e64 v0, 0, 1, s4
	usualEpilog
END_FUNC isfinite





START_FUNC isnormal
	usualProlog
	s_mov_b32 s5, 0x7FF00000
	s_mov_b32 s4, 0
	v_cmp_o_f64_e32 vcc_lo, v[0:1], v[0:1]
	usualSmov12 s7
	v_cmp_nge_f64_e64 s6, |v[0:1]|, s[4:5]
	s_mov_b32 s5, 0x100000
	usualSmov3 s7
	v_cmp_nlt_f64_e64 s4, |v[0:1]|, s[4:5]
	s_and_b32 s5, vcc_lo, s6
	s_and_b32 s4, s5
	v_cndmask_b32_e64 v0, 0, 1, s4
	usualEpilog
END_FUNC isnormal





START_FUNC isinf_sign
	usualProlog
	v_cmp_gt_i64_e32 vcc_lo, 0, v[0:1]
	usualSmov123
	v_cndmask_b32_e64 v2, 1, -1, vcc_lo
	v_cmp_class_f64_e64 vcc_lo, v[0:1], 0x204
	v_cndmask_b32_e64 v0, 0, v2, vcc_lo
	usualEpilog
END_FUNC isinf_sign






START_FUNC fpclassify
	usualProlog
	v_cmp_neq_f64_e32 vcc_lo, 0, v[0:1]
	v_mov_b32_e32 v2, 2
	usualSmov12 s8
	s_and_saveexec_b32 s4, vcc_lo
	s_cbranch_execz .Lreturn

	v_cmp_o_f64_e32 vcc_lo, v[0:1], v[0:1]
	v_mov_b32_e32 v2, 0
	s_and_saveexec_b32 s5, vcc_lo
	s_xor_b32 s5, exec_lo, s5
	s_cbranch_execz .Lreturn

	s_mov_b32 s7, 0x7FF00000
	s_mov_b32 s6, 0
	v_mov_b32_e32 v2, 1

	v_cmp_neq_f64_e64 s5, |v[0:1]|, s[6:7]
	v_and_b32_e32 v1, 0x7FFFFFFF, v1
	s_and_saveexec_b32 s7, s5
	s_xor_b32 s5, exec_lo, s7

	s_mov_b32 s7, 0x100000
	v_cmp_ngt_f64_e32 vcc_lo, s[6:7], v[0:1]
	v_cndmask_b32_e64 v2, 3, 4, vcc_lo

	s_or_b32 exec_lo, s5

.Lreturn:
	s_or_b32 exec_lo, s4
	v_mov_b32_e32 v0, v2
	usualSmov3 s8
	usualEpilog
END_FUNC fpclassify
