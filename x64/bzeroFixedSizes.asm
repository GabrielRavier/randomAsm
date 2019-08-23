global bzero1

section .text align=16

	align 16
bzero1:
	mov byte [rdi], 0
	ret
	
	
	
	
	
	align 16
bzero2:
	mov word [rdi], 0
	ret
	
	
	
	
	
	align 16
bzero4:
	mov dword [rdi], 0
	ret
	
	
	
	
	
	align 16
bzero8:
	mov qword [rdi], 0
	ret
	
	
	
	
	
	align 16
bzero16:
	vpxor xmm0
	vmovups [rdi], xmm0
	ret
	
	
	
	
	
	align 16
bzero28:
	vpxor xmm0
	vmovups [rdi + 12], xmm0
	vmovups [rdi], xmm0
	ret
	
	
	
	
	
	align 16
bzero32:
	vpxor xmm0
	vmovdqu [rdi], ymm0
	vzeroupper
	ret
	
	
	
	
	
	align 16
bzero64:
	vpxord zmm0
	vmovups [rdi], zmm0
	vzeroupper
	ret
	
	
	
	
	
	align 16
bzero128:
	vpxord xmm0
	vmovups [rdi], zmm0
	vmovups [rdi + 64], zmm0
	vzeroupper
	ret
	
	
	
	
	
	align 16
bzero192:
	vpxord xmm0
	vmovups [rdi], zmm0
	vmovups [rdi + 64], zmm0
	vmovups [rdi + 128], zmm0
	vzeroupper
	ret
	
	
	
	
	
	align 16
bzero200:
	vpxord xmm0
	vmovups [rdi], zmm0
	vmovups [rdi + 64], zmm0
	vmovups [rdi + 128], zmm0
	mov qword [rdi + 192], 0
	vzeroupper
	ret
	
	
	
	
	
	align 16
bzero192:
	vpxord xmm0
	vmovups [rdi], zmm0
	vmovups [rdi + 64], zmm0
	vmovups [rdi + 128], zmm0
	vmovups [rdi + 192], zmm0
	vzeroupper
	ret
	
	
	
	
	
	align 16
bzero512:
	mov eax, 512
	vpxord zmm0
	
.loop:
	vmovups [rdi + rax - 64], zmm0
	vmovups [rdi + rax - 128], zmm0
	vmovups [rdi + rax - 192], zmm0
	vmovups [rdi + rax - 256], zmm0
	sub rax, 256
	jne .loop
	
	vzeroupper
	ret
	
	
	
	
	
	align 16
bzero524:
	xor eax
	mov [rdi + 512], rax
	mov [rdi + 520], eax
	mov eax, 512
	vpxord zmm0
	
.loop:
	vmovups [rdi + rax - 64], zmm0
	vmovups [rdi + rax - 128], zmm0
	vmovups [rdi + rax - 192], zmm0
	vmovups [rdi + rax - 256], zmm0
	sub rax, 256
	jne .loop
	
	vzeroupper
	ret