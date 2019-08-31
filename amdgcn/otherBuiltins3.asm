.include "standard.inc"

	.text

ceilf:
	usualProlog
	usualSmov1
	v_ceil_f32_e32 v0
	usualSmov23
	usualEpilog





ceill:
	usualProlog
	v_ceil_f64_e32 v[0:1]
	usualSmov123
	usualEpilog





fabsf:
	usualProlog
	usualSmov1
	v_and_b32_e32 v0, 0x7FFFFFFF, v0
	usualSmov23
	usualEpilog





fabsl:
	usualProlog
	usualSmov1
	v_and_b32_e32 v1, 0x7FFFFFFF, v1
	usualSmov23
	usualEpilog





floorf:
	usualProlog
	usualSmov1
	v_floor_f32_e32 v0
	usualSmov23
	usualEpilog





floorl:
	usualProlog
	v_floor_f64_e32 v[0:1]
	usualSmov123
	usualEpilog





fmodf:
	usualProlog
	v_rcp_f32_e32 v2, v1
	usualSmov123
	v_mul_f32_e32 v2, v0, v2
	v_trunc_f32_e32 v2
	v_fmac_f32_e64 v0, -v2, v1
	usualEpilog





fmodl:
	usualProlog
	v_rcp_f64_e32 v[6:7], v[2:3]
	usualSmov123
	v_mul_f64 v[4:5], v[0:1], v[6:7]
	v_trunc_f32_e32 v[4:5]
	v_mul_f64 v[2:3], v[4:5], v[2:3]
	v_add_f64 v[0:1], -v[2:3]
	usualEpilog





sqrtf:
	usualProlog
	v_sqrt_f32_e32 v0
	usualSmov123
	usualEpilog





sqrtl:
	usualProlog
	v_sqrt_f64_e32 v[0:1]
	usualSmov123
	usualEpilog
