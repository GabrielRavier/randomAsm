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
	or edx, eax
	movzx eax, byte [ebp + 20]
	sal eax, 24
	or edx, eax
	mov eax, [ebp + 8]
	mov [eax], edx
	leave
	ret





	align 16
N_BADMAG:
	push ebp
	mov ebp, esp
	push ebx

	mov eax, [ebp + 8]
	movzx ecx, word [eax]
	lea eax, [ecx - 263]
	cmp eax, 1
	seta dl

	cmp ecx, 267
	setne al

	xor ebx, ebx
	test dl, al
	je .l6

	xor ebx, ebx
	cmp ecx, 204
	setne bl

.retEbx:
	mov eax, ebx
	pop ebx
	leave
	ret
