.include "standard.inc"

	.text

__blcfill_u32:
	usualProlog
	v_add_nc_u32_e32 v1, 1, v0
	usualSmov12
	v_and_b32_e32 v0, v1, v0
	usualSmov3
	usualEpilog





__blci_u32:
	usualProlog
	v_sub_nc_u32_e32 v1, -2, v0
	usualSmov12
	v_or_b32_e32 v0, v1, v0
	usualSmov3
	usualEpilog





__blcic_u32:
	usualProlog
	v_not_b32_e32 v1, v0
	v_add_nc_u32_e32 v0, 1, v0
	usualSmov12
	v_and_b32_e32 v0, v1
	usualSmov3
	usualEpilog





__blcmsk_u32:
	usualProlog
	v_add_nc_u32_e32 v1, 1, v0
	usualSmov12
	v_xor_b32_e32 v0, v1, v0
	usualSmov3
	usualEpilog





__blcs_u32:
	usualProlog
	v_add_nc_u32_e32 v1, 1, v0
	usualSmov12
	v_or_b32_e32 v0, v1, v0
	usualSmov3
	usualEpilog





__blsfill_u32:
	usualProlog
	v_add_nc_u32_e32 v1, -1, v0
	usualSmov12
	v_or_b32_e32 v0, v1, v0
	usualSmov3
	usualEpilog





__blsic_u32:
	usualProlog
	v_not_b32_e32 v1, v0
	v_add_nc_u32_e32 v0, -1, v0
	usualSmov12
	v_or_b32_e32 v0, v1
	usualSmov3
	usualEpilog





__t1mskc_u32:
	usualProlog
	v_not_b32_e32 v1, v0
	v_add_nc_u32_e32 v0, 1, v0
	usualSmov12
	v_or_b32_e32 v0, v1
	usualSmov3
	usualEpilog





__tzmsk_u32:
	usualProlog
	v_not_b32_e32 v1, v0
	v_add_nc_u32_e32 v0, -1, v0
	usualSmov12
	v_and_b32_e32 v0, v1
	usualSmov3
	usualEpilog





__blcfill_u64:
	usualProlog
	v_add_co_u32_e64 v2, vcc_lo, v0, 1
	usualSmov12
	v_add_co_ci_u32_e32 v3, vcc_lo, 0, v1, vcc_lo
	v_and_b32_e32 v0, v2, v0
	s_mov_b32 s34, s4
	v_and_b32_e32 v1, v3, v1
	usualEpilog





__blci_u64:
	usualProlog
	v_sub_co_u32_e64 v2, vcc_lo, -2, v0
	usualSmov12
	v_sub_co_ci_u32_e32 v3, vcc_lo, -1, v1, vcc_lo
	v_or_b32_e32 v0, v2, v0
	usualSmov3
	v_or_b32_e32 v1, v3, v1
	usualEpilog





__blcic_u64:
	usualProlog
	v_not_b32_e32 v3, v0
	v_add_co_u32_e64 v0, vcc_lo, v0, 1
	v_not_b32_e32 v2, v1
	usualSmov12
	v_add_co_ci_u32_e32 v1, vcc_lo, 0, v1, vcc_lo
	v_and_b32_e32 v0, v3
	usualSmov3
	v_and_b32_e32 v1, v2
	usualEpilog





__blcmsk_u64:
	usualProlog
	v_add_co_u32_e64 v2, vcc_lo, v0, 1
	usualSmov12
	v_add_co_ci_u32_e32 v3, vcc_lo, 0, v1, vcc_lo
	v_xor_b32_e32 v0, v2, v0
	usualSmov3
	v_xor_b32_e32 v1, v3, v1
	usualEpilog





__blcs_u64:
	usualProlog
	v_add_co_u32_e64 v2, vcc_lo, v0, 1
	usualSmov12
	v_add_co_ci_u32_e32 v3, vcc_lo, 0, v1, vcc_lo
	v_or_b32_e32 v0, v2, v0
	usualSmov3
	v_or_b32_e32 v1, v3, v1
	usualEpilog





__blsfill_u64:
	usualProlog
	v_add_co_u32_e64 v2, vcc_lo, v0, -1
	usualSmov12
	v_add_co_ci_u32_e32 v3, vcc_lo, -1, v1, vcc_lo
	v_or_b32_e32 v0, v2, v0
	usualSmov3
	v_or_b32_e32 v1, v3, v1
	usualEpilog





__blsic_u64:
	usualProlog
	v_not_b32_e32 v3, v0
	v_add_co_u32_e64 v0, vcc_lo, v0, -1
	v_not_b32_e32 v2, v1
	usualSmov12
	v_add_co_ci_u32_e32 v1, vcc_lo, -1, v1, vcc_lo
	v_or_b32_e32 v0, v3
	usualSmov3
	v_or_b32_e32 v1, v2
	usualEpilog





__t1mskc_u64:
	usualProlog
	v_not_b32_e32 v3, v0
	v_add_co_u32_e64 v0, vcc_lo, v0, 1
	v_not_b32_e32 v2, v1
	usualSmov12
	v_add_co_ci_u32_e32 v1, vcc_lo, 0, v1, vcc_lo
	v_or_b32_e32 v0, v3
	usualSmov3
	v_or_b32_e32 v1, v2
	usualEpilog





__tzmsk_u64:
	usualProlog
	v_not_b32_e32 v3, v0
	v_add_co_u32_e64 v0, vcc_lo, v0, -1
	v_not_b32_e32 v2, v1
	usualSmov12
	v_add_co_ci_u32_e32 v1, vcc_lo, -1, v1, vcc_lo
	v_and_b32_e32 v0, v3
	usualSmov3
	v_and_b32_e32 v1, v2
	usualEpilog
