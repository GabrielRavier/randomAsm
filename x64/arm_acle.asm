global __ror
global __rorll
global __rev16
global __rev16ll

section .text align=16

	align 16
__ror:
	mov ecx, esi
	mov eax, edi
	ror eax, cl
	ret





	align 16
__rorll:
	mov rax, rdi
	mov ecx, esi
	ror rax, cl
	ret





	align 16
__rev16:
	bswap edi
	rorx eax, edi, 0x10
	ret





	align 16
__rev16ll:
	mov rax, rdi
	shr rax, 0x20
	bswap eax

	rorx ecx, eax, 0x10
	shl rcx, 0x20
	bswap edi

	rorx eax, edi, 0x10
	or rax, rcx
	ret
