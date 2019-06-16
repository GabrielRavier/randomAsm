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
	or edx, esi
	or ecx, edx
	movsx rcx, ecx
	mov [rdi], rcx
	ret





	align 16
N_BADMAG:
	movzx rcx, word [rdi]
	cmp rdx, 294
	setne cl

	cmp rdx, 267
	setne al

	sub rdx, 263
	and eax, ecx
	cmp rdx, 1
	seta dl

	and eax, edx
	ret
