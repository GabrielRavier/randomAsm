.include "standard.inc"

	.text

ffs:
	usualProlog
	v_ffbl_b32_e32 v1, v0
	v_cmp_ne_u32_e32 vcc_lo, 0, v0
	usualSmov12
	v_add_nc_u32_e32 v1, 1, v1
	usualSmov3
	v_cndmask_b32_e32 v0, 0, v1, vcc_lo
	usualEpilog





clz:
	usualProlog
	usualSmov1
	v_ffbh_u32_e32 v0
	usualSmov23
	usualEpilog





ctz:
	usualProlog
	usualSmov1
	v_ffbl_b32_e32 v0
	usualSmov23
	usualEpilog





clrsb:
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





popcount:
	usualProlog
	usualSmov1
	v_bcnt_u32_b32_e64 v0, 0
	usualSmov23
	usualEpilog





parity:
	usualProlog
	v_bcnt_u32_b32_e64 v0, 0
	usualSmov12
	v_and_b32_e32 v0, 1, v0
	usualSmov3
	usualEpilog





ffsl:
ffsll:
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





clzl:
clzll:
	usualProlog
	v_ffbh_u32_e32 v0
	v_ffbh_u32_e32 v2, v1
	v_cmp_eq_u32_e32 vcc_lo, 0, v1
	usualSmov12
	v_add_nc_u32_e32 v0, 0x20, v0
	usualSmov3
	v_cndmask_b32_e32 v0, v2, v0, vcc_lo
	usualEpilog





ctzl:
ctzll:
	usualProlog
	v_ffbl_u32_e32 v1
	v_ffbl_u32_e32 v2, v0
	v_cmp_eq_u32_e32 vcc_lo, 0, v0
	usualSmov12
	v_add_nc_u32_e32 v1, 0x20, v1
	usualSmov3
	v_cndmask_b32_e32 v0, v2, v1, vcc_lo
	usualEpilog





clrsbl:
clrsbll:
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





popcountl:
popcountll:
	usualProlog
	v_bcnt_u32_b32_e64 v0, 0
	usualSmov12
	v_bcnt_u32_b32_e64 v0, v1, v0
	usualSmov3
	usualEpilog





parityl:
parityll:
	usualProlog
	v_bcnt_u32_b32_e64 v0, 0
	usualSmov12
	v_bcnt_u32_b32_e64 v0, v1, v0
	usualSmov3
	v_and_b32_e32 v0, 1, v0
	usualEpilog
