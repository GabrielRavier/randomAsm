global N_MAGIC

section .text align=16

	align 16
N_MAGIC:
	movzx eax, word [rdi]
	ret
