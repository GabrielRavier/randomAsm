global _mm_undefined_ps
global _mm_setzero_ps

section .text align=16

	align 16
_mm_undefined_ps:
	ret





	align 16
_mm_setzero_ps:
	vxorps xmm0
	ret





	align 16
_mm_add_ps:
	vaddps xmm0, xmm1
	ret





	align 16
_mm_sub_ps:
	vsubps xmm0, xmm1
	ret





	align 16
_mm_mul_ps:
	vmulps xmm0, xmm1
	ret





	align 16
_mm_div_ps:
	vdivps xmm0, xmm1
	ret





	align 16
_mm_set_ss:
	vinsertps xmm0, 0xE
	ret





	align 16
_mm_set1_ps:
_mm_set_ps1:
	vbroadcastss xmm0
	ret





	align 16
_mm_load_ss:
	vmovss xmm0, [rdi]
	ret





	align 16
_mm_load1_ps:
_mm_load_ps1:
	vbroadcastss xmm0, [rdi]
	ret





	align 16
_mm_load_ps:
	vmovaps xmm0, [rdi]
	ret





	align 16
_mm_loadu_ps:
	vmovups xmm0, [rdi]
	ret





	align 16
_mm_loadr_ps:
	vpermilps xmm0, [rdi], 0x1B
	ret





	align 16
_mm_set_ps:
	vunpcklps xmm0, xmm1, xmm0
	vunpcklps xmm2, xmm3, xmm2
	vmovlhps xmm0, xmm2, xmm0
	ret





	align 16
_mm_setr_ps:
	vunpcklps xmm2, xmm3
	vunpcklps xmm0, xmm1
	vmovlhps xmm0, xmm2
	ret





	align 16
_mm_store_ss:
	vmovss [rdi], xmm0
	ret





	align 16
_mm_cvtss_f32:
	ret





	align 16
_mm_store_ps:
	vmovaps [rdi], xmm0
	ret





	align 16
_mm_storeu_ps:
	vmovups [rdi], xmm0
	ret





	align 16
_mm_move_ss:
	vmovss xmm0, xmm1
	ret
