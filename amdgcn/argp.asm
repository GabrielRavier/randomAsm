	.text

__argp_usage:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	s_waitcnt_vscnt null, 0
	s_or_saveexec_b32 s4, -1

	buffer_store_dword v32, off, s[0:3], s32 offset:4
	v_nop

	s_mov_b32 exec_lo, s4
	v_writelane_b32 v32, s34, 0
	s_mov_b32 s34, s32
	s_add_u32 s32, 0x100

	s_getpc_b64 s[4:5]
	s_add_u32 s4, stderr@gotpcrel32@lo+4
	s_addc_u32 s5, stderr@gotpcrel32@hi+4

	s_getpc_b64 s[6:7]
	s_add_u32 s6, __argp_state_help@gotpcrel32@lo+4
	s_addc_u32 s7, __argp_state_help@gotpcrel32@hi+4
	s_load_dwordx2 s[4:5], 0
	s_load_dwordx2 s[6:7], 0

	v_mov_b32_e32 v4, 0x106
	s_sub_u32 s32, 0x100
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v2, s4
	v_mov_b32_e32 v3, s5
	global_load_dwordx2 v[2:3], off
	v_readline_b32 s34, v32, 0
	s_or_saveexec_b32 s4, -1

	buffer_load_dword v32, off, s[0:3], s32 offset:4
	v_nop

	s_mov_b32 exec_lo, s4
	s_setpc_b64 s[6:7]





__option_is_short:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	s_waitcnt_vscnt null, 0
	s_or_saveexec_b32 s4, -1

	buffer_store_dword v32, off, s[0:3], s32 offset:4
	v_nop

	s_mov_b32 exec_lo, s4
	v_mov_b32_e32 v2, v0
	v_writelane_b32 v32, s34, 3

	v_mov_b32_e32 v0, 0
	s_mov_b32 s34, s32
	s_add_u32 s32, 0x200

	v_add_co_u32_e64 v3, vcc_lo, v2, 0x18
	v_writelane_b32 v32, s35, 0
	v_add_co_ci_u32_e32	v4, vcc_lo, 0, v1, vcc_lo
	flat_load_dword v3, v[3:4]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_and_b32_e32 v3, 8, v3
	v_cmp_eq_u32_e32 vcc_lo, 0, v3
	s_and_saveexec_b32 s35, vcc_lo
	s_cbranch_execz .z

	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_nc_u32_e32 v0, -1, v1
	v_cmp_gt_u32_e32 vcc_lo, 0xFF, v0
	v_mov_b32_e32 v0, 0
	s_and_b32 exec_lo, vcc_lo
	s_cbranch_execz .z
	s_getpc_b64 s[4:5]

	s_add_u32 s4, isprint@gotpcrel32@lo+4
	s_addc_u32 s5, isprint@gotpcrel32@hi+4
	s_load_dwordx2 s[4:5], 0
	v_writelane_b32 v32, s30, 1
	v_mov_b32_e32 v0, v1
	v_writelane_b32 v32, s31, 2
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[4:5]
	v_cmp_ne_u32_e32 vcc_lo, 0, v9
	v_readline_b32 s30, v32, 1
	v_readline_b32 s31, v32, 2
	v_cndmask_b32_e64 v0, 0, 1, vcc_lo

.z:
	s_or_b32 exec_lo, s35
	v_readline_b32 s35, v32, 0
	s_sub_u32 s32, 0x200
	v_readline_b32 s34, v32, 3
	s_or_saveexec_b32 s4, -1

	buffer_load_dword v32, off, s[0:3], s32 off:4
	v_nop

	s_mov_b32 exec_lo, s4
	s_waitcnt vmcnt(0)
	s_waitcnt_vscnt null, 0
	s_setpc_b64 s[30:31]





__option_is_end:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	s_waitcnt_vscnt null, 0

	v_add_co_u32_e64 v3, vcc_lo, v0, 8
	v_mov_b32_e32 v2, 0
	s_mov_b32 s5, s34
	s_mov_b32 s34, s32
	v_add_co_ci_u32_e32 v4, vcc_lo, 0, v1, vcc_lo
	flat_load_dword v3, v[3:4]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_eq_u32_e32 vcc_lo, 0, v3
	s_and_saveexec_b32 s4, vcc_lo
	s_cbranch_execz .z

	flat_load_dwordx2 v[2:3], v[0:1]
	s_waitcnt vmcnt(0), lgkmcnt(0)
	v_cmp_eq_u64_e32 vcc_lo, 0, v[2:3]
	v_mov_b32_e32 v2, 0
	s_and_b32 exec_lo, vcc_lo
	s_cbranch_execz .z

	v_add_co_u32_e64 v2, vcc_lo, v0, 0x20
	v_add_co_ci_u32_e32 v3, vcc_lo, 0, v1, vcc_lo
	flat_load_dwordx2 v[2:3]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_eq_u64_e32 vcc_lo, 0, v[2:3]
	v_mov_b32_e32 v2, 0
	s_and_b32 exec_lo, vcc_lo
	s_cbranch_execz .z

	v_add_co_u32_e64 v0, vcc_lo, v0, 0x28
	v_add_co_ci_u32_e32 v1, vcc_lo, 0, v1, vcc_lo
	flat_load_dword v0, v[0:1]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_eq_u32_e32 vcc_lo, 0, v0
	v_cndmask_b32_e64 v2, 0, 1, vcc_lo

.z:
	s_or_b32 exec_lo, s4
	v_mov_b32_e32 v0, v2
	s_mov_b32 s34, s5
	s_setpc_b64 s[30:31]
