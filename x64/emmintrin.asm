global _mm_set_sd
global _mm_set1_pd
global _mm_set_pd1
global _mm_set_pd
global _mm_setr_pd
global _mm_undefined_pd
global _mm_setzero_pd
global _mm_move_sd
global _mm_load_pd
global _mm_loadu_pd
global _mm_load1_pd
global _mm_load_sd
global _mm_load_pd1
global _mm_store_pd
global _mm_storeu_pd
global _mm_store_sd
global _mm_cvtsd_f64
global _mm_storel_pd
global _mm_storeh_pd
global _mm_cvtsi128_si64
global _mm_cvtsi128_si64x
global _mm_add_pd
global _mm_sub_pd
global _mm_mul_pd
global _mm_div_pd
global _mm_set_epi64x
global _mm_set_epi64
global _mm_set_epi32
global _mm_set_epi16
global _mm_set_epi8
global _mm_set1_epi64x
global _mm_set1_epi64
global _mm_set1_epi32
global _mm_set1_epi16
global _mm_set1_epi8
global _mm_setr_epi64
global _mm_setr_epi32
global _mm_setr_epi16
global _mm_setr_epi8
global _mm_load_si128
global _mm_loadu_si128
global _mm_loadl_epi64
global _mm_loadu_si64
global _mm_store_si128
global _mm_storeu_si128
global _mm_storel_epi64
global _mm_storeu_si64
global _mm_movepi64_pi64
global _mm_movpi64_epi64
global _mm_undefined_si128
global _mm_setzero_si128
global _mm_add_epi8
global _mm_add_epi16
global _mm_add_epi32
global _mm_add_epi64
global _mm_sub_epi8
global _mm_sub_epi16
global _mm_sub_epi32
global _mm_sub_epi64
global _mm_and_si128
global _mm_or_si128
global _mm_xor_si128
global _mm_cmpeq_epi8
global _mm_cmpeq_epi16
global _mm_cmpeq_epi32
global _mm_cmplt_epi8
global _mm_cmplt_epi16
global _mm_cmplt_epi32
global _mm_cmpgt_epi8
global _mm_cmpgt_epi16
global _mm_cmpgt_epi32
global _mm_cvtsi32_si128
global _mm_cvtsi64_si128
global _mm_cvtsi64x_si128
global _mm_castpd_ps
global _mm_castpd_si128
global _mm_castps_pd
global _mm_castps_si128
global _mm_castsi128_ps
global _mm_castsi128_pd

section .text align=16

	align 16
_mm_set_sd:
	vmovq xmm0
	ret





	align 16
_mm_set1_pd:
_mm_set_pd1:
	vmovddup xmm0
	ret





	align 16
_mm_set_pd:
	vunpcklpd xmm0, xmm1, xmm0
	ret





	align 16
_mm_setr_pd:
	vunpcklpd xmm0, xmm1
	ret





	align 16
_mm_setzero_pd:
	vxorpd xmm0
	ret





	align 16
_mm_move_sd:
	vmovsd xmm0, xmm1
	ret





	align 16
_mm_load_pd:
	vmovapd xmm0, [rdi]
	ret





	align 16
_mm_loadu_pd:
	vmovupd xmm0, [rdi]
	ret





	align 16
_mm_load1_pd:
_mm_load_pd1:
	vmovddup xmm0, [rdi]
	ret





	align 16
_mm_load_sd:
	vmovq xmm0, [rdi]
	ret





	align 16
_mm_store_pd:
_mm_store_si128:
	vmovaps [rdi], xmm0
	ret





	align 16
_mm_storeu_pd:
_mm_storeu_si128:
	vmovups [rdi], xmm0
	ret





	align 16
_mm_store_sd:
_mm_storel_pd:
	vmovlpd [rdi], xmm0
	ret





	align 16
_mm_undefined_pd:
_mm_cvtsd_f64:
_mm_movepi64_pi64:
_mm_undefined_si128:
_mm_castpd_ps:
_mm_castpd_si128:
_mm_castps_pd:
_mm_castps_si128:
_mm_castsi128_ps:
_mm_castsi128_pd:
	ret





	align 16
_mm_storeh_pd:
	vmovhpd [rdi], xmm0
	ret





	align 16
_mm_cvtsi128_si64:
_mm_cvtsi128_si64x:
	vmovq rax, xmm0
	ret





	align 16
_mm_add_pd:
	vaddpd xmm0, xmm1
	ret





	align 16
_mm_sub_pd:
	vsubpd xmm0, xmm1
	ret





	align 16
_mm_mul_pd:
	vmulpd xmm0, xmm1
	ret





	align 16
_mm_div_pd:
	vdivpd xmm0, xmm1
	ret





	align 16
_mm_set_epi64x:
	vmovq xmm1, rsi
	vpinsrq xmm0, xmm1, rdi, 1
	ret





	align 16
_mm_set_epi64:
	vpunpcklqdq xmm0, xmm1, xmm0
	ret





	align 16
_mm_set_epi32:
	vmovd xmm0, ecx
	vpinsrd xmm0, edx, 1
	vpinsrd xmm0, esi, 2
	vpinsrd xmm0, edi, 3
	ret





	align 16
_mm_set_epi16:
	vmovd xmm0, [rsp + 16]
	vpinsrw xmm0, [rsp + 8], 1
	vpinsrw xmm0, r9d, 2
	vpinsrw xmm0, r8d, 3
	vpinsrw xmm0, ecx, 4
	vpinsrw	xmm0, edx, 5
	vpinsrw xmm0, esi, 6
	vpinsrw xmm0, edi, 7
	ret





	align 16
_mm_set_epi8:
	vmovd xmm0, [rsp + 80]
	vpinsrb xmm0, [rsp + 72], 1
	vpinsrb xmm0, [rsp + 64], 2
	vpinsrb xmm0, [rsp + 56], 3
	vpinsrb xmm0, [rsp + 48], 4
	vpinsrb xmm0, [rsp + 40], 5
	vpinsrb xmm0, [rsp + 32], 6
	vpinsrb xmm0, [rsp + 24], 7
	vpinsrb xmm0, [rsp + 16], 8
	vpinsrb xmm0, [rsp + 8], 9
	vpinsrb xmm0, r9d, 10
	vpinsrb xmm0, r8d, 11
	vpinsrb xmm0, ecx, 12
	vpinsrb xmm0, edx, 13
	vpinsrb xmm0, esi, 14
	vpinsrb xmm0, edi, 15
	ret





	align 16
_mm_set1_epi64x:
	vpbroadcastq xmm0, rdi
	ret





	align 16
_mm_set1_epi64:
	vpbroadcastq xmm0
	ret





	align 16
_mm_set1_epi32:
	vpbroadcastd xmm0, edi
	ret





	align 16
_mm_set1_epi16:
	vpbroadcastw xmm0, edi
	ret





	align 16
_mm_set1_epi8:
	vpbroadcastb xmm0, edi
	ret





	align 16
_mm_setr_epi64:
	vpunpcklqdq xmm0, xmm1
	ret





	align 16
_mm_setr_epi32:
	vmovd xmm0, edi
	vpinsrd xmm0, esi, 1
	vpinsrd xmm0, edx, 2
	vpinsrd xmm0, ecx, 3
	ret





	align 16
_mm_setr_epi16:
	vmovd xmm0, edi
	vpinsrw xmm0, esi, 1
	vpinsrw xmm0, edx, 2
	vpinsrw xmm0, ecx, 3
	vpinsrw xmm0, r8d, 4
	vpinsrw xmm0, r9d, 5
	vpinsrw xmm0, [rsp + 8], 6
	vpinsrw xmm0, [rsp + 16], 7
	ret





	align 16
_mm_setr_epi8:
	vmovd xmm0, edi
	vpinsrb xmm0, esi, 1
	vpinsrb xmm0, edx, 2
	vpinsrb xmm0, ecx, 3
	vpinsrb xmm0, r8d, 4
	vpinsrb xmm0, r9d, 5
	vpinsrb xmm0, [rsp + 8], 6
	vpinsrb xmm0, [rsp + 16], 7
	vpinsrb xmm0, [rsp + 24], 8
	vpinsrb xmm0, [rsp + 32], 9
	vpinsrb xmm0, [rsp + 40], 10
	vpinsrb xmm0, [rsp + 48], 11
	vpinsrb xmm0, [rsp + 56], 12
	vpinsrb xmm0, [rsp + 64], 13
	vpinsrb xmm0, [rsp + 72], 14
	vpinsrb xmm0, [rsp + 80], 15
	ret





	align 16
_mm_load_si128:
	vmovaps xmm0, [rdi]
	ret





	align 16
_mm_loadu_si128:
	vmovups xmm0, [rdi]
	ret





	align 16
_mm_loadl_epi64:
_mm_loadu_si64:
	vmovsd xmm0, [rdi]
	ret





	align 16
_mm_storel_epi64:
_mm_storeu_si64:
	vmovlps [rdi], xmm0
	ret





	align 16
_mm_movpi64_epi64:
	vmovq xmm0
	ret





	align 16
_mm_setzero_si128:
	vpxor xmm0
	ret





	align 16
_mm_add_epi8:
	vpaddb xmm0, xmm1, xmm0
	ret





	align 16
_mm_add_epi16:
	vpaddw xmm0, xmm1, xmm0
	ret





	align 16
_mm_add_epi32:
	vpaddd xmm0, xmm1, xmm0
	ret





	align 16
_mm_add_epi64:
	vpaddq xmm0, xmm1, xmm0
	ret





	align 16
_mm_add_epi8:
	vpaddb xmm0, xmm1, xmm0
	ret





	align 16
_mm_add_epi16:
	vpaddw xmm0, xmm1, xmm0
	ret





	align 16
_mm_add_epi32:
	vpaddd xmm0, xmm1, xmm0
	ret





	align 16
_mm_add_epi64:
	vpaddq xmm0, xmm1, xmm0
	ret





	align 16
_mm_and_si128:
	vpand xmm0, xmm1
	ret





	align 16
_mm_or_si128:
	vpor xmm0, xmm1
	ret





	align 16
_mm_xor_si128:
	vpxor xmm0, xmm1
	ret





	align 16
_mm_cmpeq_epi8:
	vpcmpeqb xmm0, xmm1
	ret





	align 16
_mm_cmpeq_epi16:
	vpcmpeqw xmm0, xmm1
	ret





	align 16
_mm_cmpeq_epi32:
	vpcmpeqd xmm0, xmm1
	ret





	align 16
_mm_cmplt_epi8:
	vpcmpgtb xmm0, xmm1
	ret





	align 16
_mm_cmplt_epi16:
	vpcmpgtw xmm0, xmm1
	ret





	align 16
_mm_cmplt_epi32:
	vpcmpgtd xmm0, xmm1
	ret





	align 16
_mm_cvtsi32_si128:
	vmovd xmm0, edi
	ret





	align 16
_mm_cvtsi64_si128:
_mm_cvtsi64x_si128:
	vmovq xmm0, rdi
	ret
