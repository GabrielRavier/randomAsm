.include "standard.inc"

	.text

bswap16:
	usualProlog
	v_alignbit_b32 v1, v0, v0, 8
	v_alignbit_b32 v0, 0x18
	s_mov_b32 s4, s34
	s_mov_b32 s34, s32
	v_bfi_b32 v0, 0xFF00FF, v0, v1
	s_mov_b32 s34, s4
	v_lshrrev_b32_e32 v0, 0x10, v0
	s_setpc_b64 s[30:31]





bswap32:
	usualProlog
	v_alignbit_b32 v1, v0, v0, 8
	v_alignbit_b32 v0, 0x18
	s_mov_b32 s4, s34
	s_mov_b32 s34, s32
	v_bfi_b32 v0, 0xFF00FF, v0, v1
	s_mov_b32 s34, s4
	s_setpc_b64 s[30:31]





bswap64:
	usualProlog
	v_lshrrev_b64 v[2:3], 0x18, v[0:1]
	v_lshrrev_b64 v[4:5], 8, v[0:1]
	v_mov_b32_e32 v6, 8
	v_alignbit_b32 v4, v1, v0, 8
	s_mov_b32 s4, 0xFF0000
	v_alignbit_b32 v2, v1, v0, 0x18
	v_lshrrev_b32_e32 v7, 0x18, v0
	v_lshrrev_b32_e32 v0, 0, v0
	v_lshrrev_b32_sdwa v6, v1 dst_sel:DWORD dst_unused:UNUSED_PAD
	v_and_b32_e32 v3, 0xFF00, v3
	v_and_b32_e32 v2, s4, v2
	v_and_b32_e32 v4, 0xFF000000, v4
	v_and_b32_e32 v0, s4, v0
	v_or_b32_sdwa v1, v6, v1 dst_sel:DWORD dst_unused: UNUSED_PAD src0_sel:DWORD src1_sel:BYTE_3
	v_or_b32_sdwa v3, v5 dst_sel:DWORD dst_unused: UNUSED_PAD src0_sel:DWORD src1_sel:BYTE_0
	s_mov_b32 s5, s34
	v_or_b32_e32 v2, v4, v2
	v_or_b32_e32 v4, v7, v0
	s_mov_b32 s34, s32
	s_mov_b32 s34, s5
	v_or_b32_e32 v0, v2, v1
	v_or_b32_e32 v1, v4, v3
	s_setpc_b64 s[30:31]
