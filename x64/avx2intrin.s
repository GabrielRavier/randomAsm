global _mm256_add_epi8
global _mm256_add_epi16
global _mm256_add_epi32
global _mm256_add_epi64
global _mm256_and_si256
global _mm256_andnot_si256
global _mm256_cmpeq_epi8
global _mm256_cmpeq_epi16
global _mm256_cmpeq_epi32
global _mm256_cmpeq_epi64
global _mm256_cmpgt_epi8
global _mm256_cmpgt_epi16
global _mm256_cmpgt_epi32
global _mm256_cmpgt_epi64
global _mm256_mullo_epi16
global _mm256_mullo_epi32
global _mm256_or_si256
global _mm256_sub_epi8
global _mm256_sub_epi16
global _mm256_sub_epi32
global _mm256_sub_epi64
global _mm256_xor_si256

section .text align=16

%macro mkOpOneReg 2

	align 16
%1:
	%2 ymm0
	ret

%endmacro

%macro mkOpTwoRegs 2

	align 16
%1:
	%2 ymm0, ymm1
	ret

%endmacro

	mkOpTwoRegs _mm256_add_epi8, vpaddb
	mkOpTwoRegs _mm256_add_epi16, vpaddw
	mkOpTwoRegs _mm256_add_epi32, vpaddd
	mkOpTwoRegs _mm256_add_epi64, vpaddq
	mkOpTwoRegs _mm256_and_si256, vpand
	mkOpTwoRegs _mm256_andnot_si256, vpandn
	mkOpTwoRegs _mm256_cmpeq_epi8, vpcmpeqb
	mkOpTwoRegs _mm256_cmpeq_epi16, vpcmpeqw
	mkOpTwoRegs _mm256_cmpeq_epi32, vpcmpeqd
	mkOpTwoRegs _mm256_cmpeq_epi64, vpcmpeqq
	mkOpTwoRegs _mm256_cmpgt_epi8, vpcmpgtb
	mkOpTwoRegs _mm256_cmpgt_epi16, vpcmpgtw
	mkOpTwoRegs _mm256_cmpgt_epi32, vpcmpgtd
	mkOpTwoRegs _mm256_cmpgt_epi64, vpcmpgtq
	mkOpTwoRegs _mm256_mullo_epi16, vpmullw
	mkOpTwoRegs _mm256_mullo_epi32, vpmulld
	mkOpTwoRegs _mm256_sub_epi8, vpsubb
	mkOpTwoRegs _mm256_sub_epi16, vpsubw
	mkOpTwoRegs _mm256_sub_epi32, vpsubd
	mkOpTwoRegs _mm256_sub_epi64, vpsubq
	mkOpTwoRegs _mm256_xor_si256, vpxor
