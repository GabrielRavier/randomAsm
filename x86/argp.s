global __argp_usage
global __option_is_short
global __option_is_end
extern stderr
extern __argp_state_help
extern isprint

section .text align=16

	align 16
__argp_usage:
	sub esp, 16

	push 262
	push dword [stderr]
	push dword [esp + 20]
	call __argp_state_help

	add esp, 28
	ret





	align 16
__option_is_short:
	sub esp, 12
	mov ecx, [esp + 16]
	xor eax, eax

	test byte [ecx + 12], 0
	jne .return

	mov ecx, [ecx + 4]
	lea edx, [ecx - 1]
	ja .return

	mov [esp], ecx
	call isprint

	mov ecx, eax
	xor eax, eax
	test ecx, ecx
	setne al

.return:
	add esp, 12
	ret





	align 16
__option_is_end:
	mov ecx, [esp + 4]
	xor eax, eax

	cmp dword [ecx + 4], 0
	jne .return

	cmp dword [ecx], 0
	jne .return

	cmp dword [ecx + 16], 0
	je .continue

.return:
	ret

	align 16
.continue:
	xor eax, eax
	cmp dword [ecx + 20], 0
	sete al
	ret
