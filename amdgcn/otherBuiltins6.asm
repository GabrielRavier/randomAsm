.include "standard.inc"

	.text

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





START_FUNC clz
	usualProlog
	usualSmov1
	v_ffbh_u32_e32 v0
	usualSmov23
	usualEpilog
END_FUNC clz





START_FUNC ctz
	usualProlog
	usualSmov1
	v_ffbl_b32_e32 v0
	usualSmov23
	usualEpilog
END_FUNC ctz





START_FUNC clrsb
	usualProlog
	v_ashrrev_i32_e32 v1, 0x1F, v0
	usualSmov12
	v_xor_b32_e32 v0, v1, v0
	usualSmov3
	v_ffbh_u32_e32 v1, v0
	v_cmp_ne_u32_e32 vcc_lo, 0, v0
	v_cndmask_b32_e32 v0, 0x20, v1, vcc_lo
	v_add_nc_u32_e32 v0, -1, v0
	usualEpilog
END_FUNC clrsb





START_FUNC popcount
	usualProlog
	usualSmov1
	v_bcnt_u32_b32_e64 v0, 0
	usualSmov23
	usualEpilog
END_FUNC popcount





START_FUNC parity
	usualProlog
	v_bcnt_u32_b32_e64 v0, 0
	usualSmov12
	v_and_b32_e32 v0, 1, v0
	usualSmov3
	usualEpilog
END_FUNC parity





START_FUNC ffsl
START_FUNC ffsll
	usualProlog
	v_ffbl_b32_e32 v2, v1
	v_ffbl_b32_e32 v3, v0
	v_cmp_eq_u32_e32 vcc_lo, 0, v0
	usualSmov12
	v_add_nc_u32_e32 v2, 0x20, v2
	usualSmov3
	v_cndmask_b32_e32 v2, v3, v2, vcc_lo
	v_cmp_ne_u64_e32 vcc_lo, 0, v[0:1]
	v_add_nc_u32_e32 v2, 1, v2
	v_cndmask_b32_e32 v0, 0, v2, vcc_lo
	usualEpilog
END_FUNC ffsl
END_FUNC ffsll





START_FUNC clzl
START_FUNC clzll
	usualProlog
	v_ffbh_u32_e32 v0
	v_ffbh_u32_e32 v2, v1
	v_cmp_eq_u32_e32 vcc_lo, 0, v1
	usualSmov12
	v_add_nc_u32_e32 v0, 0x20, v0
	usualSmov3
	v_cndmask_b32_e32 v0, v2, v0, vcc_lo
	usualEpilog
END_FUNC clzl
END_FUNC clzll





START_FUNC ctzl
START_FUNC ctzll
	usualProlog
	v_ffbl_u32_e32 v1
	v_ffbl_u32_e32 v2, v0
	v_cmp_eq_u32_e32 vcc_lo, 0, v0
	usualSmov12
	v_add_nc_u32_e32 v1, 0x20, v1
	usualSmov3
	v_cndmask_b32_e32 v0, v2, v1, vcc_lo
	usualEpilog
END_FUNC ctzl
END_FUNC ctzll





START_FUNC clrsbl
START_FUNC clrsbll
	usualProlog
	v_ashrrev_i32_e32 v2, 0x1F, v1
	usualSmov12
	v_xor_b32_e32 v0, v2, v0
	v_xor_b32_e32 v1, v2, v1
	usualSmov3
	v_ffbh_u32_e32 v2, v0
	v_ffbh_u32_e32 v3, v1
	v_or_b32_e32 v0, v1
	v_cmp_eq_u32_e32 vcc_lo, 0, v1
	v_add_nc_u32_e32 v2, 0x20, v2
	v_cndmask_b32_e32 v1, v3, v2, vcc_lo
	v_cmp_ne_u32_e32 vcc_lo, 0, v0
	v_cndmask_b32_e32 v0, 0x40, v1, vcc_lo
	v_add_nc_u32_e32 v0, -1, v0
	usualEpilog
END_FUNC clrsbl
END_FUNC clrsbll





START_FUNC popcountl
START_FUNC popcountll
	usualProlog
	v_bcnt_u32_b32_e64 v0, 0
	usualSmov12
	v_bcnt_u32_b32_e64 v0, v1, v0
	usualSmov3
	usualEpilog
END_FUNC popcountl
END_FUNC popcountll





START_FUNC parityl
START_FUNC parityll
	usualProlog
	v_bcnt_u32_b32_e64 v0, 0
	usualSmov12
	v_bcnt_u32_b32_e64 v0, v1, v0
	usualSmov3
	v_and_b32_e32 v0, 1, v0
	usualEpilog
END_FUNC parityl
END_FUNC parityll
