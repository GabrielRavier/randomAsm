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
#elif SSE
	sub esp, 12
	paddb xmm0, xmm2
	paddb xmm1, [esp + 16]
	add esp, 12
#else
	push ebp
	push edi
	push esi
	push ebx
	sub esp, 108

	mov edi, [esp + 192]
	mov ecx, [esp + 160]
	mov esi, [esp + 196]
	mov edx, [esp + 164]
	mov ebx, edi
	mov eax, [esp + 168]
	mov ebp, ecx

	and ebx, 0x7F7F7F7F
	and ebp, 0x7F7F7F7F
	xor ecx, edi

	mov edi, [esp + 212]
	and ebx, ebp
	and ecx, 0x80808080
	xor ebx, ecx

	mov ecx, esi
	mov [esp], ebx
	mov ebx, edx
	and ecx, 0x7F7F7F7F
	xor edx, esi
	and ebx, 0x7F7F7F7F

	mov esi, [esp + 208]
	add ecx, ebx
	mov ebx, edx

	mov edx, [esp + 200]
	and ebx, 0x80808080
	xor ecx, ebx
	mov ebx, [esp + 204]

	mov [esp + 4], ecx
	mov ecx, eax
	and ecx, 0x7F7F7F7F
	and edx, 0x7F7F7F7F
	add edx, ecx

	; Unfinished
#endif
