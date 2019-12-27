.include "standard.inc"

	.text

.macro make256Op name, instr

START_FUNC \name
	usualProlog
	usualSmov1

	.irp reg, v0, v1, v2, v3, v4, v5, v6, v7

		\instr \reg, (\reg + 8), \reg

	.endr

	usualSmov23
	usualEpilog
END_FUNC \name

.endm

.macro make256Op64 name, instr1, instr2

START_FUNC \name
	usualProlog
	\instr1 v0, vcc_lo, v8, v0
	usualSmov12
	\instr2 v1, vcc_lo, v9, v1, vcc_lo
	\instr1 v2, vcc_lo, v10, v2
	usualSmov3
	\instr2 v3, vcc_lo, v11, v3, vcc_lo

	.irp reg, v4, v6

		\instr1 \reg, vcc_lo, (\reg + 8), \reg
		\instr2 (\reg + 1), vcc_lo, (\reg + 9), (\reg + 1)

	.endr

	usualEpilog
END_FUNC \name

.endm

	make256Op _mm256_add_epi16, v_pk_add_u16
	make256Op _mm256_add_epi32, v_add_nc_u32_e32
	make256Op64 _mm256_add_epi64, v_add_co_u32_e64, v_add_co_ci_u32_e32

	make256Op _mm256_and_si256, v_and_b32_e32

	make256Op _mm256_mullo_epi16, v_pk_mul_lo_u16
	make256Op _mm256_mullo_epi16, v_mul_lo_u32

	make256Op _mm256_or_si256, v_or_b32_e32

	make256Op _mm256_sub_epi16, v_pk_sub_u16
	make256Op _mm256_sub_epi32, v_sub_nc_u32_e32
	make256Op64 _mm256_sub_epi64, v_sub_co_u32_e64, v_sub_co_ci_u32_e32

	make256Op _mm256_xor_si256, v_xor_b32_e32
