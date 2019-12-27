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
	vmovsd xmm0, [esp + 4]
	ret





	align 16
_mm_set1_pd:
_mm_set_pd1:
	vmovddup xmm0, [esp + 4]
	ret





	align 16
_mm_set_pd:
	vmovsd xmm1, [esp + 12]
	vmovhpd xmm0, xmm1,	[esp + 4]
	ret





	align 16
_mm_setr_pd:
	vmovaps xmm0, [esp + 4]
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
	mov eax, [esp + 4]
	vmovapd xmm0, [eax]
	ret





	align 16
_mm_loadu_pd:
	mov eax, [esp + 4]
	vmovupd xmm0, [eax]
	ret





	align 16
_mm_load1_pd:
_mm_load_pd1:
	mov eax, [esp + 4]
	vmovddup xmm0, [eax]
	ret





	align 16
_mm_load_sd:
	mov eax, [esp + 4]
	vmovq xmm0, [eax]
	ret





	align 16
_mm_store_pd:
_mm_store_si128:
	mov eax, [esp + 4]
	vmovaps [eax], xmm0
	ret





	align 16
_mm_storeu_pd:
_mm_storeu_si128:
	mov eax, [esp + 4]
	vmovups [eax] xmm0
	ret





	align 16
_mm_store_sd:
_mm_storel_pd:
	mov eax, [esp + 4]
	vmovlpd [eax], xmm0
	ret





	align 16
_mm_cvtsd_f64:
	sub esp, 12
	vmovlps [esp], xmm0
	fld qword [esp]
	add esp, 12
	ret





	align 16
_mm_undefined_pd:
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
	mov eax, [esp + 4]
	vmovhpd [eax], xmm0
	ret





	align 16
_mm_cvtsi128_si64:
_mm_cvtsi128_si64x:
	vmovd eax, xmm0
	vpextd edx, xmm0, 1
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
	vmovq xmm1, [esp + 12]
	vmovhps xmm0, xmm1, [esp + 4]
	ret





	align 16
_mm_set_epi64:
	sub esp, 28
	movq [esp + 8], mm1
	vmovq xmm1, [esp + 8]
	movq [esp], mm0
	vmovhps xmm0, xmm1, [esp]
	add esp, 28
	ret





	align 16
_mm_set_epi32:
	vmovd xmm0, [esp + 12]
	vpinsrd xmm0, [esp + 16], 1
	vpinsrd xmm0, [esp + 4], 2
	vpinsrd xmm0, [esp + 8], 3
	ret





	align 16
_mm_set_epi16:
	vmovd xmm0, [esp + 32]
	vpinsrw xmm0, [esp + 28], 1
	vpinsrw xmm0, [esp + 24], 2
	vpinsrw xmm0, [esp + 20], 3
	vpinsrw xmm0, [esp + 16], 4
	vpinsrw	xmm0, [esp + 12], 5
	vpinsrw xmm0, [esp + 8], 6
	vpinsrw xmm0, [esp + 4], 7
	ret





	align 16
_mm_set_epi8:
	vmovd xmm0, [esp + 64]
	vpinsrb xmm0, [esp + 60], 1
	vpinsrb xmm0, [esp + 56], 2
	vpinsrb xmm0, [esp + 32], 3
	vpinsrb xmm0, [esp + 48], 4
	vpinsrb xmm0, [esp + 44], 5
	vpinsrb xmm0, [esp + 40], 6
	vpinsrb xmm0, [esp + 36], 7
	vpinsrb xmm0, [esp + 32], 8
	vpinsrb xmm0, [esp + 28], 9
	vpinsrb xmm0, [esp + 24], 10
	vpinsrb xmm0, [esp + 20], 11
	vpinsrb xmm0, [esp + 16], 12
	vpinsrb xmm0, [esp + 12], 13
	vpinsrb xmm0, [esp + 8], 14
	vpinsrb xmm0, [esp + 4], 15
	ret





	align 16
_mm_set1_epi64x:
	vpbroadcastq xmm0, [esp + 4]
	ret





	align 16
_mm_set1_epi64:
	sub esp, 28
	movq [esp + 8], mm0
	vpbroadcastq xmm0, [esp + 8]
	add esp, 28
	ret





	align 16
_mm_set1_epi32:
	vpbroadcastd xmm0, [esp + 4]
	ret





	align 16
_mm_set1_epi16:
	vpbroadcastw xmm0, [esp + 4]
	ret





	align 16
_mm_set1_epi8:
	vpbroadcastb xmm0, [esp + 4]
	ret





	align 16
_mm_setr_epi64:
	sub esp, 28
	movq [esp], mm0
	vmovq xmm1, [esp]
	movq [esp + 8], mm1
	vmovhps xmm0, xmm1, [esp + 8]
	add esp, 28
	ret





	align 16
_mm_setr_epi32:
	vmovaps xmm0, [esp + 4]
	ret





	align 16
_mm_setr_epi16:
	vmovd xmm0, [esp + 4]
	vpinsrw xmm0, [esp + 8], 1
	vpinsrw xmm0, [esp + 12], 2
	vpinsrw xmm0, [esp + 16], 3
	vpinsrw xmm0, [esp + 20], 4
	vpinsrw xmm0, [esp + 24], 5
	vpinsrw xmm0, [esp + 28], 6
	vpinsrw xmm0, [esp + 32], 7
	ret





	align 16
_mm_setr_epi8:
	vmovd xmm0, [esp + 4]
	vpinsrb xmm0, [esp + 8], 1
	vpinsrb xmm0, [esp + 12], 2
	vpinsrb xmm0, [esp + 16], 3
	vpinsrb xmm0, [esp + 20], 4
	vpinsrb xmm0, [esp + 24], 5
	vpinsrb xmm0, [esp + 28], 6
	vpinsrb xmm0, [esp + 32], 7
	vpinsrb xmm0, [esp + 36], 8
	vpinsrb xmm0, [esp + 40], 9
	vpinsrb xmm0, [esp + 44], 10
	vpinsrb xmm0, [esp + 48], 11
	vpinsrb xmm0, [esp + 52], 12
	vpinsrb xmm0, [esp + 56], 13
	vpinsrb xmm0, [esp + 60], 14
	vpinsrb xmm0, [esp + 64], 15
	ret





	align 16
_mm_load_si128:
	mov eax, [esp + 4]
	vmovaps xmm0, [eax]
	ret





	align 16
_mm_loadu_si128:
	mov eax, [esp + 4]
	vmovups xmm0, [eax]
	ret





	align 16
_mm_loadl_epi64:
_mm_loadu_si64:
	mov eax, [esp + 4]
	vmovsd xmm0, [eax]
	ret





	align 16
_mm_storel_epi64:
_mm_storeu_si64:
	mov eax, [esp + 4]
	vmovq [eax], xmm0
	ret





	align 16
_mm_movepi64_pi64:
	sub esp, 28
	vmovq [esp + 8], xmm0
	movq mm0, [esp + 8]
	add esp, 28
	ret





	align 16
_mm_movpi64_epi64:
	sub esp, 28
	movq [esp + 8], mm0
	vmovq xmm0, [esp + 8]
	add esp, 28
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
	vmovd xmm0, [esp + 4]
	ret





	align 16
_mm_cvtsi64_si128:
_mm_cvtsi64x_si128:
	vmovq xmm0, [esp + 4]
	ret
