.include "standard.inc"

	.text

.macro makeCmp name, instr

START_FUNC \name
	usualProlog
	doubleVMovB32E32 v10, v0
	doubleVMovB32E32 v8, v2
	usualSmov12

	\instr vcc_lo, v[10:11], v[4:5]
	usualSmov3

	v_cndmask_b32_e64 v0, 0, -1, vcc_lo
	\instr vcc_lo, v[8:9], v[6:7]
	v_mov_b32_e32 v1, v0

	v_cndmask_b32_e64 v2, 0, -1, vcc_lo
	v_mov_b32_e32 v3, v2
	usualEpilog
END_FUNC \name

.endm

.macro make0To3Instr name, instr

START_FUNC \name
	usualProlog

	.irp reg, v0, v1, v2, v3

		\instr \reg, (\reg + 4), \reg

	.endr

	usualSmov123
	usualEpilog
END_FUNC \name

.endm

	makeCmp _mm_cmpeq_epi64, v_cmp_eq_u64_e32
	make0To3Instr _mm_mullo_epi32, v_mul_lo_u32
	makeCmp _mm_cmpgt_epi64, v_cmp_gt_i64_e32
