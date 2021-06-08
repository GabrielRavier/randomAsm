global bzero1
global bzero2
global bzero4
global bzero8
global bzero16
global bzero28
global bzero32
global bzero64
global bzero128
global bzero192
global bzero200

section .text align=16

	align 16
bzero1:
	mov eax, [esp + 4]
	mov byte [eax], 0
	ret
	
	
	
	
	
	align 16
bzero2:
	mov eax, [esp + 4]
	mov word [eax], 0
	ret
	
	
	
	
	
	align 16
bzero4:
	mov eax, [esp + 4]
	mov dword [eax], 0
	ret
	
	
	
	
	
	align 16
bzero8:
	mov eax, [esp + 4]
	mov dword [eax], 0
	mov dword [eax + 4], 0
	ret
	
	
	
	
	
	align 16
bzero16:
	mov eax, [esp + 4]
	vpxor xmm0
	vmovups [eax], xmm0
	ret
	
	
	
	
	
	align 16
bzero28:
	mov eax, [esp + 4]
	vpxor xmm0
	vmovups [eax + 12], xmm0
	vmovups [eax], xmm0
	ret
	
	
	
	
	
	align 16
bzero32:
	mov eax, [esp + 4]
	vpxor ymm0
	vmovdqu [eax], ymm0
	vzeroupper
	ret
	
	
	
	
	
	align 16
bzero64:
	mov eax, [esp + 4]
	vpxord zmm0
	vmovups [eax], zmm0
	vzeroupper
	ret
	
	
	
	
	
	align 16
bzero128:
	mov eax, [esp + 4]
	vpxord xmm0
	vmovups [eax], zmm0
	vmovups [eax + 64], zmm0
	vzeroupper
	ret
	
	
	
	
	
	align 16
bzero192:
	mov eax, [esp + 4]
	vpxord xmm0
	vmovups [eax], zmm0
	vmovups [eax + 64], zmm0
	vmovups [eax + 128], zmm0
	vzeroupper
	ret
	
	
	
	
	
	align 16
bzero200:
	push edi

	mov ecx, 50
	xor eax
	mov edi, [esp + 8]
	rep stosd

	pop edi
	ret