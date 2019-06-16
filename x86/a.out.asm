global N_MAGIC
global N_MACHTYPE
global N_FLAGS
global N_SET_INFO
global N_BADMAG

section .text align=16

	align 16
N_MAGIC:
	mov eax, [esp + 4]
	movzx eax, word [eax]
	ret





	align 16
N_MACHTYPE:
	mov eax, [esp + 4]
	movzx eax, byte [eax + 2]
	ret





	align 16
N_FLAGS:
	mov eax, [esp + 4]
	movzx eax, byte [eax + 3]
	ret





	align 16
N_SET_INFO:
	push ebp
	mov ebp, esp

	movzx eax, byte [ebp + 16]
	movzx edx, byte [ebp + 12]
	sal eax, 16
	or eax, edx
	movzx edx, byte [ebp + 20]
	sal edx, 24
	or eax, edx
	mov edx, [ebp + 8]
	mov [edx], eax
	pop ebp
	ret





	align 16
N_BADMAG:
	push ebp
	mov ebp, esp

	mov eax, [ebp + 8]
	movzx eax, word [eax]
	lea edx, [eax - 263]
	cmp edx, 1
	jbe .ret0

	cmp eax, 267
	je .ret0

	cmp eax, 204
	setne al
	pop ebp
	ret

.ret0:
	xor eax, eax
	pop ebp
	ret
