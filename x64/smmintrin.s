global _mm_cmpeq_epi64
global _mm_mullo_epi32
global _mm_cmpgt_epi64

section .text align=16

	align 16
_mm_cmpeq_epi64:
	vpcmpeqq xmm0, xmm1
	ret
	
	
	
	
	
	align 16
_mm_mullo_epi32:
	vpmulld xmm0, xmm1
	ret
	
	
	
	
	
	align 16
_mm_cmpgt_epi64:
	vpcmpgtq xmm0, xmm1
	ret