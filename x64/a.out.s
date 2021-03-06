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
	shl edx, 16
	or edx, esi
	shl ecx, 24
	or ecx, edx
	movsxd rax, ecx
	mov [rdi], rax
	ret





	align 16
N_BADMAG:
	movzx rcx, word [rdi]
	mov eax, 1
	sub rcx, 204
	cmp rcx, 63
	ja .return

	mov rax, 0x9800000000000001
	shr rax, cl
	not rax
	and eax, 1

.return:
	ret
