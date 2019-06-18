global sadd_overflow
global saddl_overflow
global saddll_overflow

global uadd_overflow

section .text align=16

	align 16
sadd_overflow:
saddl_overflow:
	mov eax, [esp + 8]
	mov edx, [esp + 12]
	add eax, [esp + 4]
	mov [edx], eax
	seto al

	ret





	align 16
saddll_overflow:
#if SSE3
#if AVX2
	vmovq xmm1, [esp + 12]
	vmovq xmm0, [esp + 4]

	mov edx, [esp + 20]
	vpaddq xmm2, xmm0, xmm1
	vpxor xmm0, xmm1
	vpxor xmm1, xmm2, xmm1
	vpandn xmm0, xmm1
	vpextrd eax, xmm0, 1
	vmovq [edx], xmm2
#else
	movq xmm0, [esp + 4]
	movq xmm1, [esp + 12]
	mov edx, [esp + 20]

	movdqa xmm3, xmm0
	paddq xmm3, xmm1

	pxor xmm0, xmm1
	pxor xmm1, xmm2

	movq [edx], xmm3

	pandn xmm0, xmm1
#if SSE42
	pextrd eax, xmm0, 1
#else
	psrlq xmm0, 32
	movd eax, xmm0
#endif
#endif

	shr eax, 31
#else
	push ebx
	mov ecx, [esp + 8]
	mov ebx, [esp + 12]

	add ecx, [esp + 16]
	adc ebx, [esp + 20]

	mov eax, [esp + 12]
	xor eax, [esp + 20]
	mov edx, [esp + 20]
	xor edx, ebx
	not eax
	and eax, edx

	mov edx, [esp + 24]

	mov [edx], ecx
	mov [edx + 4], ebx

	shr eax, 31
	pop ebx
#endif
	ret





	align 16
uadd_overflow:
	mov eax, [esp + 8]
	mov edx, [esp + 12]
	add eax, [esp + 4]
	mov [edx], eax

	setc al
	ret
