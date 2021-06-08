.include "standard.inc"

	.text

START_FUNC ceilf
	usualProlog
	usualSmov1
	v_ceil_f32_e32 v0
	usualSmov23
	usualEpilog
END_FUNC ceilf





START_FUNC ceill
	usualProlog
	v_ceil_f64_e32 v[0:1]
	usualSmov123
	usualEpilog
END_FUNC ceill





START_FUNC fabsf
	usualProlog
	usualSmov1
	v_and_b32_e32 v0, 0x7FFFFFFF, v0
	usualSmov23
	usualEpilog
END_FUNC fabsf





START_FUNC fabsl
	usualProlog
	usualSmov1
	v_and_b32_e32 v1, 0x7FFFFFFF, v1
	usualSmov23
	usualEpilog
END_FUNC fabsl





START_FUNC floorf
	usualProlog
	usualSmov1
	v_floor_f32_e32 v0
	usualSmov23
	usualEpilog
END_FUNC floorf





START_FUNC floorl
	usualProlog
	v_floor_f64_e32 v[0:1]
	usualSmov123
	usualEpilog
END_FUNC floorl





START_FUNC fmodf
	usualProlog
	v_rcp_f32_e32 v2, v1
	usualSmov123
	v_mul_f32_e32 v2, v0, v2
	v_trunc_f32_e32 v2
	v_fmac_f32_e64 v0, -v2, v1
	usualEpilog
END_FUNC fmodf





START_FUNC fmodl
	usualProlog
	v_rcp_f64_e32 v[6:7], v[2:3]
	usualSmov123
	v_mul_f64 v[4:5], v[0:1], v[6:7]
	v_trunc_f32_e32 v[4:5]
	v_mul_f64 v[2:3], v[4:5], v[2:3]
	v_add_f64 v[0:1], -v[2:3]
	usualEpilog
END_FUNC fmodl





START_FUNC sqrtf
	usualProlog
	v_sqrt_f32_e32 v0
	usualSmov123
	usualEpilog
END_FUNC sqrtf





START_FUNC sqrtl
	usualProlog
	v_sqrt_f64_e32 v[0:1]
	usualSmov123
	usualEpilog
END_FUNC sqrtl
