global N_MAGIC
global N_MACHTYPE
global N_FLAGS
global N_SET_INFO
global N_BADMAG

section .text align=16

	align 16
N_MAGIC:
	movzx eax, word [rdi]
	ret





	align 16
N_MACHTYPE:
	mov al, [rdi + 2]
	ret





	align 16
N_FLAGS:
	mov al, [rdi + 3]
	ret





	align 16
N_SET_INFO:
	movzx edx, dl
	movzx esi, si
	sal ecx, 24
	sal edx, 16
	or esi, edx
	or esi, ecx
	movsx rsi, esi
	mov [rdi], rsi
	ret





	align 16
N_BADMAG:
	movzx rcx, word [rdi]
	lea rdx, [rcx - 263]

	cmp rax, 1
	jbe .ret0

	cmp rax, 267
	je .ret0

	cmp rax, 204
	setne al
	ret

.ret0:
	xor eax, eax
	ret
