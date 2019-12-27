.include "standard.inc"

	.text

.macro smov3AndRet

	usualSmov3
	usualEpilog

.endm

START_FUNC __andn_u32
	usualProlog

	v_not_b32_e32 v0
	usualSmov12
	v_and_b32_e32 v0, v1
	smov3AndRet
END_FUNC __andn_u32





.macro blsEndInstr instr

	usualSmov12
	\instr v0, v1, v0
	smov3AndRet

.endm

START_FUNC __blsi_u32
	usualProlog

	v_sub_nc_u32_e32 v1, 0, v0
	blsEndInstr v_and_b32_e32
END_FUNC __blsi_u32





.macro makeBlsMskBlsR name, endInstr

START_FUNC \name
	usualProlog
	v_add_nc_u32_e32 v1, -1, v0
	blsEndInstr \endInstr
END_FUNC \name

.endm

	makeBlsMskBlsR __blsmsk_u32, v_xor_b32_e32
	makeBlsMskBlsR __blsr_u32, v_and_b32_e32





START_FUNC __andn_u64
	usualProlog
	doubleVNotB32E32 v0
	usualSmov12
	doubleVAndB32E32 v0, v2
	smov3AndRet
END_FUNC __andn_u64





.macro blsEndInstr64 instr

	\instr v0, v2, v0
	usualSmov3
	\instr v1, v3, v1
	usualEpilog

.endm

START_FUNC __blsi_u64
	usualProlog
	v_sub_co_u32_e64 v2, vcc_lo, 0, v0
	usualSmov12
	v_sub_co_ci_u32_e32 v3, vcc_lo, 0, v1, vcc_lo
	blsEndInstr64 v_and_b32_e32
END_FUNC __blsi_u64





.macro makeBlsMskBlsR64 name, instr

START_FUNC \name
	usualProlog
	v_add_co_u32_e64 v2, vcc_lo, v0, -1
	usualSmov12
	v_add_co_ci_u32_e32 v3, vcc_lo, -1, v1, vcc_lo
	blsEndInstr64 \instr
END_FUNC \name

.endm

	makeBlsMskBlsR64 __blsmsk_u64, v_xor_b32_e32
	makeBlsMskBlsR64 __blsr_u64, v_and_b32_e32
