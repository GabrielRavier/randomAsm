global bswap16
global bswap32
global bswap64

section .text align=16

	align 16
bswap16:
	mov eax, edi
	rol ax, 8
	ret





	align 16
bswap32:
	mov eax, edi
	bswap eax
	ret





	align 16
bswap64:
	mov rax, rdi
	bswap rax
	ret
