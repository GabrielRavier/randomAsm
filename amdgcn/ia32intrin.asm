.include "standard.inc"

	.text

__rold:
	usualProlog
	v_mov_b32_e32 v2, 0
	usualSmov12
	v_sub_nc_sdwa v1, v2, v1 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:DWORD src1_sel:BYTE_0
	usualSmov3
	v_alignbit_b32 v0, v1
	usualEpilog





__rord:
	usualProlog
	v_and_b32_e32 v1, 0xFF, v1
	usualSmov12
	v_alignbit_b32 v0, v1
	usualSmov3
	usualEpilog





__rolq:
	usualProlog
	v_sub_nc_u16_e64 v4, 0, v2
	v_mov_b32_e32 v3, 0x3F
	v_and_b32_e32 v2, 0x3F, v2
	usualSmov12
	v_and_b32_sdwa v3, v4, v3 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_0 src1_sel:DWORD
	usualSmov3
	v_and_b32_e32 v7, 0xFFFF, v3
	v_lshlrev_b64 v[2:3], v2, v[0:1]
	v_lshrrev_b64 v[0:1], v7, v[0:1]
	v_or_b32_e32 v0, v2, v0
	v_or_b32_e32 v1, v3, v1
	usualEpilog





__rorq:
	usualProlog
	v_sub_nc_u16_e64 v4, 0, v2
	v_mov_b32_e32 v3, 0x3F
	v_and_b32_e32 v2, 0x3F, v2
	usualSmov12
	v_and_b32_sdwa v3, v4, v3 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_0 src1_sel:DWORD
	usualSmov3
	v_and_b32_e32 v7, 0xFFFF, v3
	v_lshrrev_b64 v[2:3], v2, v[0:1]
	v_lshlrev_b64 v[0:1], v7, v[0:1]
	v_or_b32_e32 v0, v2, v0
	v_or_b32_e32 v1, v3, v1
	usualEpilog
