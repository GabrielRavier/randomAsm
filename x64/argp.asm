global __argp_usage
global __option_is_short
global __option_is_end
extern __argp_state_help
extern stderr
extern isprint

section .text align=16

	align 16
__argp_usage:
	mov rsi, [rel stderr]
	mov edx, 0x106
	jmp __argp_state_help





	align 16
__option_is_short:
	push rax
	xor eax, eax

	test byte [rdi + 24], 8
	jne .return

	mov edi, [rdi + 8]
	lea ecx, [rdi - 1]
	cmp ecx, 0xFE
	ja .return

	call isprint
	mov ecx, eax
	xor eax, eax
	test ecx, ecx
	setne al

.return:
	pop rcx
	ret





	align 16
__option_is_end:
	xor eax, eax
	cmp dword [rdi + 8], 0
	jne .return

	cmp qword [rdi], 0
	jne .return

	cmp qword [rdi + 32], 0
	je .continue

.return:
	ret

	align 16
.continue:
	xor eax, eax
	cmp dword [rdi + 40], 0
	sete al
	ret
