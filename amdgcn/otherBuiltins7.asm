.include "standard.inc"

	.text

isgreater:
	usualProlog
	v_cmp_gt_f64_e32 vcc_lo, v[0:1], v[2:3]
	usualSmov123
	v_cndmask_b32_e64 v0, 0, 1, vcc_lo
	usualEpilog





isgreaterequal:
	usualProlog
	v_cmp_ge_f64_e32 vcc_lo, v[0:1], v[2:3]
	usualSmov123
	v_cndmask_b32_e64 v0, 0, 1, vcc_lo
	usualEpilog





isless:
	usualProlog
	v_cmp_lt_f64_e32 vcc_lo, v[0:1], v[2:3]
	usualSmov123
	v_cndmask_b32_e64 v0, 0, 1, vcc_lo
	usualEpilog





islessequal:
	usualProlog
	v_cmp_le_f64_e32 vcc_lo, v[0:1], v[2:3]
	usualSmov123
	v_cndmask_b32_e64 v0, 0, 1, vcc_lo
	usualEpilog





islessgreater:
	usualProlog
	v_cmp_lg_f64_e32 vcc_lo, v[0:1], v[2:3]
	usualSmov123
	v_cndmask_b32_e64 v0, 0, 1, vcc_lo
	usualEpilog





isunordered:
	usualProlog
	v_cmp_u_f64_e32 vcc_lo, v[0:1], v[2:3]
	usualSmov123
	v_cndmask_b32_e64 v0, 0, 1, vcc_lo
	usualEpilog
