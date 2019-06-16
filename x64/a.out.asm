global N_MAGIC
global N_MACHTYPE

section .text align=16

	align 16
N_MAGIC:
	movzx eax, word [rdi]
	ret





	align 16
N_MACHTYPE:
	mov al, [rdi + 2]
	ret
