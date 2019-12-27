.include "standard.inc"

	.text

.macro mkCmp name, instr

START_FUNC \name
	usualProlog
	\instr vcc_lo, v[0:1], v[2:3]
	usualSmov123
	v_cndmask_b32_e64 v0, 0, 1, vcc_lo
	usualEpilog
END_FUNC \name

.endm

	mkCmp isgreater, v_cmp_gt_f64_e32
	mkCmp isgreaterequal, v_cmp_ge_f64_e32
	mkCmp isless, v_cmp_lt_f64_e32
	mkCmp islessequal, v_cmp_le_f64_e32
	mkCmp islessgreater, v_cmp_lg_f64_e32
	mkCmp isunordered, v_cmp_u_f64_e32

