global sadd_overflow
global saddl_overflow
global saddll_overflow

global uadd_overflow
global uaddl_overflow
global uaddll_overflow

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
uaddl_overflow:
	mov eax, [esp + 8]
	mov edx, [esp + 12]
	add eax, [esp + 4]
	mov [edx], eax

	setc al
	ret





	align 16
uaddll_overflow:
#if SSE42
#if AVX
#if AVX512
	vmovq xmm2, [esp + 4]
	vmovq xmm0, [esp + 12]

	vpaddq xmm1, xmm2, xmm0
	vpcmpuq k0, xmm1, xmm2, 1
	vpmovm2q xmm3, k0
	vmovd edx, xmm3
#else
	vmovq xmm1, [esp + 4]
	vmovq xmm0, [esp + 12]
	vpaddq xmm2, xmm1, xmm0
	vmovdqa xmm3, [.dat]
	vpsubq xmm4, xmm1, xmm3
	vpsubq xmm5, xmm2, xmm3
	vpcmpgtq xmm6, xmm4, xmm5
	vmovd edx, xmm6
#endif

	mov eax, [esp + 20]

#if AVX512
	vmovq [eax], xmm1
#else
	vmovq [eax], xmm2
#endif
#else
	movq xmm2, [esp + 4]
	movq xmm1, [esp + 12]
	mov eax, [esp + 20]

	paddq xmm1, xmm2
	movdqa xmm0, [.dat]
	movq [eax], xmm1

	psubq xmm2, xmm0
	psubq xmm1, xmm0
	pcmpgtq xmm2, xmm1

	movd edx, xmm2
#endif

	test edx, edx
	je .ret0

	mov eax, 1
	ret

	align 16
.ret0:
	xor eax, eax
	ret
#else
	push esi
	mov ecx, [esp + 24]
	mov edx, [esp + 8]

	add edx, [esp + 16]
	mov esi, [esp + 12]
	adc esi, [esp + 20]
	setb al

	mov [ecx], edx
	mov [ecx + 4], esi

	pop esi
	ret
#endif

#if !AVX512 && SSE42
	align 16
.dat:
	dd 0, 0, 0, 0x80000000
#endif
