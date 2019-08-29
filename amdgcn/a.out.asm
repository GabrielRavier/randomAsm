.include "standard.inc"

	.text

.macro makeNLoadInstr name, instr

\name:
	usualProlog
	flat_load_dword v0, v[0:1]
	usualSmov123
	waitAfterLoad
	\instr
	usualEpilog

.endm

	makeNLoadInstr N_MAGIC, "v_and_b32_e32 v0, 0xFFFF, v0"
	makeNLoadInstr N_MACHTYPE, "v_bfe_u32 v0, 0x10, 8"
	makeNLoadInstr N_FLAGS, "v_lshlrev_b32_e32 v0, 0x18, v0"





N_SET_INFO:
	usualProlog
	v_lshlrev_b32_e32 v3, 0x10, v3
	v_lshlrev_b32_e32 v4, 0x18, v4
	usualSmov12
	v_or3_b32 v2, v3, v2, v4
	usualSmov3
	v_ashrrev_i32_e32 v3, 0x1F, v2
	flat_store_dwordx2 v[0:1], v[2:3]

	waitAfterStore
	usualEpilog





N_BADMAG:
	usualProlog

	flat_load_dwordx2 v[0:1], v[0:1]
	s_mov_b32 s5, 0
	usualSmov12 s8
	waitAfterLoad
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
	usualSmov3 s8
	usualEpilog
