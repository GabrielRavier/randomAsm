.include "standard.inc"

	.text

__andn_u32:
	usualProlog

	v_not_b32_e32 v0
	s_mov_b32 s4, s34
	s_mov_b32 s34, s32
	v_and_b32_e32 v0, v1
	s_mov_b32 s34, s4
	s_setpc_b64 s[30:31]





__blsi_u32:
	usualProlog

	v_sub_nc_u32_e32 v1, 0, v0
	s_mov_b32 s4, s34
	s_mov_b32 s34, s32
	v_and_b32_e32 v0, v1, v0
	s_mov_b32 s34, s4
	s_setpc_b64 s[30:31]





__blsmsk_u32:
	usualProlog
	v_add_nc_u32_e32 v1, -1, v0
	s_mov_b32 s4, s34
	s_mov_b32 s34, s32
	v_xor_b32_e32 v0, v1, v0
	s_mov_b32 s34, s4
	s_setpc_b64 s[30:31]





__blsr_u32:
	usualProlog
	v_add_nc_u32_e32 v1, -1, v0
	s_mov_b32 s4, s34
	s_mov_b32 s34, s32
	v_and_b32_e32 v0, v1, v0
	s_mov_b32 s34, s4
	s_setpc_b64 s[30:31]





__andn_u64:
	usualProlog

	.irp reg, v0, v1

		v_not_b32_e32 \reg

	.endr

	s_mov_b32 s4, s34
	s_mov_b32 s34, s32
	v_and_b32_e32 v0, v2
	v_and_b32_e32 v1, v3
	s_mov_b32 s34, s4
	s_setpc_b64 s[30:31]





__blsi_u64:
	usualProlog
	v_sub_co_u32_e64 v2, vcc_lo, 0, v0
	s_mov_b32 s4, s34
	s_mov_b32 s34, s32
	v_sub_co_ci_u32_e32 v3, vcc_lo, 0, v1, vcc_lo
	v_and_b32_e32 v0, v2, v0
	s_mov_b32 s34, s4
	v_and_b32_e32 v1, v3, v1
	s_setpc_b64 s[30:31]





__blsmsk_u64:
	usualProlog
	v_add_co_u32_e64 v2, vcc_lo, v0, -1
	s_mov_b32 s4, s34
	s_mov_b32 s34, s32
	v_add_co_ci_u32_e32 v3, vcc_lo, -1, v1, vcc_lo
	v_xor_b32_e32 v0, v2, v0
	s_mov_b32 s34, s4
	v_xor_b32_e32 v1, v3, v1
	s_setpc_b64 s[30:31]





__blsr_u64:
	usualProlog
	v_add_co_u32_e64 v2, vcc_lo, v0, -1
	s_mov_b32 s4, s34
	s_mov_b32 s34, s32
	v_add_co_ci_u32_e32 v3, vcc_lo, -1, v1, vcc_lo
	v_and_b32_e32 v0, v2, v0
	s_mov_b32 s34, s4
	v_and_b32_e32 v1, v3, v1
	s_setpc_b64 s[30:31]
