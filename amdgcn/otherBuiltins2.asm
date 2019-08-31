.include "standard.inc"

	.text

cabsl:
cabs:
	usualProlog
	v_mul_f64 v[0:1]
	usualSmov123
	v_fma_f64 v[0:1], v[2:3], v[2:3], v[0:1]
	v_sqrt_f64_e32 v[0:1]
	usualEpilog





cimagf:
	usualProlog
	usualSmov1
	v_mov_b32_e32 v0, v1
	usualSmov23
	usualEpilog





cimagl:
cimag:
	usualProlog
	usualSmov1
	doubleVMovB32E32 v0, v2
	usualSmov23
	usualEpilog





conjf:
	usualProlog
	usualSmov1
	v_xor_b32_e32 v1, 0x80000000, v1
	usualSmov23
	usualEpilog





conjl:
conj:
	usualProlog
	usualSmov1
	v_xor_b32_e32 v3, 0x80000000, v3
	usualSmov23
	usualEpilog





copysignf:
	usualProlog
	usualSmov1
	v_bfi_b32 v0, 0x7FFFFFFF, v0, v1
	usualSmov23
	usualEpilog





copysignl:
copysign:
	usualProlog
	usualSmov1
	v_bfi_b32 v1, 0x7FFFFFFF, v1, v3
	usualSmov23
	usualEpilog





crealf:
creall:
creal:
	emptyMethod





fmaf:
	usualProlog
	usualSmov1
	v_fma_f32 v0, v1, v2
	usualSmov23
	usualEpilog





fmal:
fma:
	usualProlog
	usualSmov1
	v_fma_f64 v[0:1], v[2:3], v[4:5]
	usualSmov123
	usualEpilog





fmaxf:
	usualProlog
	usualSmov1
	v_max_f32_e32 v0, v1
	usualSmov23
	usualEpilog





fmaxl:
fmax:
	usualProlog
	v_max_f64 v[0:1], v[2:3]
	usualSmov123
	usualEpilog





fminf:
	usualProlog
	usualSmov1
	v_min_f32_e32 v0, v1
	usualSmov23
	usualEpilog





fminl:
fmin:
	usualProlog
	v_min_f64 v[0:1], v[2:3]
	usualSmov123
	usualEpilog





llabs:
	usualProlog
	v_ashrrev_i32_e32 v2, 0x1F, v1
	usualSmov12
	v_add_co_u32_e64 v0, vcc_lo, v0, v2
	usualSmov3
	v_add_co_ci_u32_e32 v1, vcc_lo, v1, v2, vcc_lo
	v_xor_b32_e32 v0, v2
	v_xor_b32_e32 v1, v2
	usualEpilog





nearbyintf:
rintf:
	usualProlog
	usualSmov1
	v_rndne_f32_e32 v0
	usualSmov23
	usualEpilog





nearbyintl:
nearbyint:
rintl:
rint:
	usualProlog
	v_rndne_f64_e32 v[0:1]
	usualSmov123
	usualEpilog





roundf:
	usualProlog
	v_trunc_f32_e32 v1, v0
	usualSmov12
	v_sub_f32_e32 v2, v0, v1
	v_bfi_b32 v0, 0x7FFFFFFF, 1.0, v0
	usualSmov3
	v_cmp_ge_f32_e64 vcc_lo, |v2|, 0.5
	v_cndmask_b32_e32 v0, 0, v0, vcc_lo
	v_add_f32_e32 v0, v1, v0
	usualEpilog





roundl:
round:
	usualProlog
	v_bfe_u32 v2, v1, 0x14, 0xB
	s_mov_b32 s5, 0xFFFFF
	s_mov_b32 s4, -1
	usualSmov12 s6
	v_add_nc_u32_e32 v8, 0xFFFFFC01, v2
	usualSmov3 s6
	v_lshrrev_b64 v[2:3], v8, s[4:5]
	s_mov_b32 s5, 0x80000
	s_mov_b32 s4, 0
	v_lshrrev_b64 v[6:7], v8, s[4:5]
	v_and_b32_e32 v5, v1, v3
	v_and_b32_e32 v4, v0, v2
	v_not_b32_e32 v3
	v_not_b32_e32 v2
	v_cmp_ne_u64_e32 vcc_lo, 0, v[4:5]
	v_cndmask_b32_e32 v4, 0, v7, vcc_lo
	v_cndmask_b32_e32 v5, 0, v6, vcc_lo
	v_cmp_eq_u32_e32 vcc_lo, -1, v8
	v_cndmask_b32_e32 v6, 0, 0x3FF00000, vcc_lo
	v_add_co_u32_e64 v5, vcc_lo, v0, v5
	v_bfi_b32 v6, 0x7FFFFFFF, v6, v1
	v_add_co_ci_u32_e32 v4, vcc_lo, v1, v4, vcc_lo
	v_and_b32_e32 v2, v5, v2
	v_cmp_gt_i32_e32 vcc_lo, 0, v8
	v_and_b32_e32 v3, v4, v3
	v_cndmask_b32_e64 v2, 0, vcc_lo
	v_cndmask_b32_e32 v3, v6, vcc_lo
	v_cmp_lt_i32_e32 vcc_lo, 0x33, v8
	v_cndmask_b32_e32 v0, v2, v0, vcc_lo
	v_cndmask_b32_e32 v1, v3, v1, vcc_lo
	usualEpilog





truncf:
	usualProlog
	usualSmov1
	v_trunc_f32_e32 v0
	usualSmov23
	usualEpilog





truncl:
trunc:
	usualProlog
	v_trunc_f64_e32 v[0:1]
	usualSmov123
	usualEpilog
