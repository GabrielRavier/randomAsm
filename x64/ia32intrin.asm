global __rold
global __rord
global __rolq
global __rorq

section .text align=16

	align 16
__rold:
	mov eax, edi
	mov ecx, esi
	rol eax, cl
	ret





	align 16
__rord:
	mov eax, edi
	mov ecx, esi
	ror eax, cl
	ret





	align 16
__rolq:
	mov rax, rdi
	mov ecx, esi
	rol rax, cl
	ret





	align 16
__rorq:
	mov rax, rdi
	mov ecx, edi
	ror rax, cl
	ret
