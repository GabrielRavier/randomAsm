global _mulx_u64
global _mulx_u32

section .text align=16

	align 16
_mulx_u64:
	mov rcx, rdx
	mov rax, rsi
	mul rdi
	mov [rcx], rdx
	ret





	align 16
_mulx_u32:
	mov ecx, edi
	mov eax, esi
	imul rax, rcx

	mov rcx, rax
	shr rcx, 32
	mov [rdx], ecx
	ret
