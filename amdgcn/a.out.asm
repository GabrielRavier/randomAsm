	.text

N_MAGIC:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	s_waitcnt_vscnt null, 0

	flat_load_dword v0, v[0:1]
	s_mov_b32 s4, s34
	s_mov_b32 s34, s32
	s_mov_b32 s34, s4
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_and_b32_e32 v0, 0xFFFF, v0
	s_setpc_b64 s[30:31]





N_MACHTYPE:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	s_waitcnt_vscnt null, 0

	flat_load_dword v0, v[0:1]
	s_mov_b32 s4, s34
	s_mov_b32 s34, s32
	s_mov_b32 s34, s4
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_bfe_u32 v0, v0, 0x10, 8
	s_setpc_b64 s[30:31]





N_FLAGS:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	s_waitcnt_vscnt null, 0

	flat_load_dword v0, v[0:1]
	s_mov_b32 s4, s34
	s_mov_b32 s34, s32
	s_mov_b32 s34, s4
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_lshrrev_b32_e32 v0, 0x18, v0
	s_setpc_b64 s[30:31]





N_SET_INFO:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	s_waitcnt_vscnt null, 0

	v_lshlrev_b32_e32 v3, 0x10, v3
	v_lshlrev_b32_e32 v4, 0x18, v4
	s_mov_b32 s4, s34
	s_mov_b32 s34, s32
	v_or3_b32 v2, v3, v2, v4
	s_mov_b32 s34, s4
	v_ashrrev_i32_e32 v3, 0x1F, v2
	flat_store_dwordx2 v[0:1], v[2:3]

	s_waitcnt lgkmcnt(0)
	s_waitcnt_vscnt null, 0
	s_setpc_b64 s[30:31]





N_BADMAG:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	s_waitcnt_vscnt null, 0

	flat_load_dwordx2 v[0:1], v[0:1]
	s_mov_b32 s5, 0
	s_mov_b32 s8, s34
	s_mov_b32 s34, s32
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_lt_i16_e32 vcc_lo, 0x106, v0
	s_and_saveexec_b32 s4, vcc_lo
	s_xor_b32 s4, exec_lo, s4
	s_cbranch_execz .z

	v_cmp_lt_i16_e32 vcc_lo, 0x10A, v0
	s_mov_b32 s5, 0
	s_and_saveexec_b32 s6, vcc_lo
	s_xor_b32 s6, exec_lo, s6
	v_cmp_ne_u16_e32 vcc_lo, 0x10B, v0
	s_and_b32 s5, vcc_lo, exec_lo
	s_or_saveexec_b32 s6
	s_xor_b32 exec_lo, s6
	v_cmp_lt_i16_e32 vcc_lo, 0x108, v0
	s_andn2_b32 s5, s5, exec_lo
	s_and_b32 s7, vcc_lo, exec_lo
	s_or_b32 s5, s7
	s_or_b32 exec_lo, s6
	s_and_b32 s5, exec_lo

.z:
	s_or_saveexec_b32 s4
	s_xor_b32 exec_lo, s4
	v_cmp_ne_u16_e32 vcc_lo, 0xCC, v0
	s_andn2_b32 s5, exec_lo
	s_and_b32 s6, vcc_lo, exec_lo
	s_or_b32 s5, s6
	s_or_b32 exec_lo, s4
	s_mov_b32 s4, 0
	s_and_saveexec_b32 s6, s5
	s_mov_b32 s4, exec_lo
	s_or_b32 exec_lo, s6

	v_cndmask_b32_e64 v0, 0, 1, s4
	s_mov_b32 s34, s8
	s_setpc_b64 s[30:31]
