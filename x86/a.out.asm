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
	movzx eax, byte [esp + 12]
	movzx edx, word [esp + 8]
	sal eax, 16
	or eax, edx

	movzx edx, byte [esp + 16]
	sal edx, 24
	or eax, edx
	mov edx, [esp + 4]
	mov [edx], eax
	ret





	align 16
N_BADMAG:
	mov eax, [esp + 4]
	movzx edx, word [eax]

	cmp edx, 267
	setne al

	cmp edx, 204
	setne cl

	sub edx, 263
	and eax, ecx
	cmp edx, 1
	seta dl

	and eax, edx
	ret
