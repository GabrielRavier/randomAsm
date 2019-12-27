global _mm256_add_epi8
global _mm256_add_epi16
global _mm256_add_epi32
global _mm256_add_epi64
global _mm256_and_si256
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

	align 16
_mm256_add_epi8:
	vpaddb ymm0, ymm1, ymm0
	ret





	align 16
_mm256_add_epi16:
	vpaddw ymm0, ymm1, ymm0
	ret





	align 16
_mm256_add_epi32:
	vpaddd ymm0, ymm1, ymm0
	ret





	align 16
_mm256_add_epi64:
	vpaddq ymm0, ymm1, ymm0
	ret





	align 16
_mm256_and_si256:
	vpand ymm0, ymm1
	ret





	align 16
_mm256_cmpeq_epi8:
	vpcmpeqb ymm0, ymm1
	ret





	align 16
_mm256_cmpeq_epi16:
	vpcmpeqw ymm0, ymm1
	ret





	align 16
_mm256_cmpeq_epi32:
	vpcmpeqd ymm0, ymm1
	ret





	align 16
_mm256_cmpeq_epi64:
	vpcmpeqq ymm0, ymm1
	ret





	align 16
_mm256_cmpgt_epi8:
	vpcmpgtb ymm0, ymm1
	ret





	align 16
_mm256_cmpgt_epi16:
	vpcmpgtw ymm0, ymm1
	ret





	align 16
_mm256_cmpgt_epi32:
	vpcmpgtd ymm0, ymm1
	ret





	align 16
_mm256_cmpgt_epi64:
	vpcmpgtq ymm0, ymm1
	ret





	align 16
_mm256_mullo_epi16:
	vpmullw ymm0, ymm1, ymm0
	ret





	align 16
_mm256_mullo_epi32:
	vpmulld ymm0, ymm1, ymm0
	ret





	align 16
_mm256_or_si256:
	vpor ymm0, ymm1
	ret





	align 16
_mm256_sub_epi8:
	vpsubb ymm0, ymm1
	ret





	align 16
_mm256_sub_epi16:
	vpsubw ymm0, ymm1
	ret





	align 16
_mm256_sub_epi32:
	vpsubd ymm0, ymm1
	ret





	align 16
_mm256_sub_epi64:
	vpsubq ymm0, ymm1
	ret





	align 16
_mm256_xor_si256:
	vpxor ymm0, ymm1
	ret
