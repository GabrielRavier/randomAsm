global _mm256_add_epi8

section .text align=16

	align 16
_mm256_add_epi8:
#if AVX2
	vpaddb ymm0, ymm1
#elif AVX
	vextractf128 xmm2, ymm0, 1
	vextractf128 xmm3, ymm1, 1
	vpaddb xmm2, xmm3, xmm2
	vpaddb xmm0, xmm1, xmm0
	vinsertf128 ymm0, xmm2, 1
#else
	movdqa xmm1, [rsp + 8]
	paddb xmm1, [rsp + 40]
	mov rax, rdi
	movdqa xmm2, [rsp + 24]
	paddb xmm2, [rsp + 56]
	movaps [rdi], xmm1
	movaps [rdi + 16], xmm2
	ret
#endif
