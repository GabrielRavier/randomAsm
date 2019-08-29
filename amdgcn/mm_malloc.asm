.include "standard.inc"

	.text

_mm_malloc:
	usualProlog
	s_or_saveexec_b32 s4, -1

	buffer_store_dword v34, off, s[0:3], s32 offset:24
	v_nop

	s_mov_b32 exec_lo, s4
	v_writelane_b32 v34, s34, 4
	usualSmov2
	s_add_u32 s32, 0x400
	s_mov_b32 s6, 0
	buffer_store_dword v32, off, s[0:3], s34 offset:4
	buffer_store_dword v33, off, s[0:3], s34
	v_writelane_b32 v34, s35, 0
	s_sub_u32 s5, s34, s33
	doubleVMovB32E32 v32, v0
	v_writelane_b32 v34, s36, 1
	v_lshrrev_b32_e64 v0, 5, s5
	v_writelane_b32 v34, s30, 2
	v_add_nc_u32_e32 v0, 0x10, v0
	v_writelane_b32 v34, s31, 3
	s_getreg_b32 s4, hwreg(HW_REG_SH_MEM_BASES, 0, 0x10)
	v_cmp_ne_u32_e32 vcc_lo, 0, v0
	s_lshl_b32 s4, 0x10
	v_cndmask_b32_e32 v0, 0, v0, vcc_lo
	v_cndmask_b32_e64 v1, 0, s4, vcc_lo
	v_cmp_lt_i64_e32 vcc_lo, 1, v[2:3]
	s_mov_b32 s4, 0
	s_and_saveexec_b32 s5, vcc_lo
	s_xor_b32 s5, exec_lo, s5
	s_cbranch_execz .z

	v_cmp_lt_i64_e32 vcc_lo, 3, v[2:3]
	doubleSMovB32 s6
	s_and_saveexec_b32 s4, vcc_lo
	s_xor_b32 s4, exec_lo, s4
	v_cmp_eq_u64_e32 vcc_lo, 4, v[2:3]
	s_mov_b32 s6, exec_lo
	s_and_b32 s7, vcc_lo, exec_lo
	s_or_saveexec_b32 s8, s4
	s_xor_b32 exec_lo, s8
	v_cmp_eq_u64_e64 s4, 2, v[2:3]
	v_cmp_ne_u64_e32 vcc_lo, 2, v[2:3]
	s_andn2_b32 s6, exec_lo
	s_andn2_b32 s7, exec_lo
	s_and_b32 s4, exec_lo
	s_and_b32 s9, vcc_lo, exec_lo
	s_or_b32 s7, s4
	s_or_b32 s6, s9
	s_or_b32 exec_lo, s8
	s_mov_b32 s4, 0
	s_and_saveexec_b32 s8, s7
	s_xor_b32 s7, exec_lo, s8
	s_mov_b32 s4, exec_lo
	s_andn2_b32 s6, exec_lo
	s_or_b32 exec_lo, s7
	s_and_b32 s4, exec_lo
	s_and_b32 s6, exec_lo

.z:
	s_or_saveexec_b32 s5
	s_mov_b32 s35, 0
	s_xor_b32 exec_lo, s5
	v_cmp_ne_u64_e32 vcc_lo, 1, v[2:3]
	s_andn2_b32 s6, exec_lo
	s_mov_b32 s35, exec_lo
	s_and_b32 s7, vcc_lo, exec_lo
	s_or_b32 s6, s7
	s_or_b32 exec_lo, s5
	v_mov_b32_e32 v4, 8
	v_mov_b32_e32 v5, 0
	s_and_saveexec_b32 s5, s6
	v_mov_b32_e32 v5, v3
	s_andn2_b32 s35, exec_lo
	s_or_b32 s4, exec_lo
	v_mov_b32_e32 v4, v2
	s_or_b32 exec_lo, s5
	s_and_saveexec_b32 s5, s4
	s_xor_b32 s36, exec_lo, s5
	s_cbranch_execz .z2

	loadSymbolAddress s4, posix_memalign
	doubleVMovB32E32 v2, v4
	v_mov_b32_e32 v4, v33
	v_mov_b32_e32 v5, v32
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[4:5]

	buffer_load_dword v1, off, s[0:3], s34 offset:20
	buffer_load_dword v2, off, s[0:3], s34 offset:16

	v_cmp_eq_u32_e32 vcc_lo, 0, v0
	s_waitcnt vmcnt(1)
	v_cndmask_b32_e32 v3, 0, v1, vcc_lo
	s_waitcnt vmcnt(0)
	v_cndmask_b32_e32 v2, 0, v2, vcc_lo

.z2:
	s_or_b32 exec_lo, s36
	s_and_saveexec_b32 s36, s35
	s_cbranch_execz .z3

	loadSymbolAddress s4, malloc
	v_mov_b32_e32 v0, v33
	v_mov_b32_e32 v1, v32
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[4:5]
	doubleVMovB32E32 v2, v0

.z3:
	s_or_b32 exec_lo, s36

	v_readlane_b32 s4, v34, 2
	v_readlane_b32 s5, v34, 3
	v_readlane_b32 s36, v34, 1
	v_readlane_b32 s35, v34, 0
	buffer_load_dword v33, off, s[0:3], s34
	buffer_load_dword v32, off, s[0:3], s34 offset:4
	doubleVMovB32E32 v0, v2
	s_sub_u32 s32, 0x400
	v_readlane_b32 s34, 4
	s_or_saveexec_b32 s6, -1

	buffer_load_dword v34, off, s[0:3], s32 offset:24
	v_nop

	s_mov_b32 exec_lo, s6
	s_waitcnt vmcnt(0)
	s_waitcnt_vscnt null, 0
	s_setpc_b64 s[4:5]





_mm_free:
	usualProlog
	s_or_saveexec_b32 s4, -1

	buffer_store_dword v32, off, s[0:3], s32 offset:4
	v_nop

	s_mov_b32 exec_lo, s4
	v_writelane_b32 v32, s34, 0
	usualSmov2
	s_add_u32 s32, 0x100

	loadSymbolAddress s4, free
	v_readlane_b32 s34, v32, 0
	s_sub_u32 s32, 0x100
	s_or_saveexec_b32 s6, -1

	buffer_load_dword v32, off, s[0:3], s32 offset:4
	v_nop

	s_mov_b32 exec_lo, s6
	s_waitcnt lgkmcnt(0)
	s_setpc_b64 s[4:5]
