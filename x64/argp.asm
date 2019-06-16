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
	mov eax, [rdi + 24]
	and eax, 8
	jne .l5

	mov edi, [rdi + 8]
	lea edx, [rdi - 1]
	cmp edx, 0xFE
	jbe .l10

	rep ret

	align 16
.l10:
	sub rsp, 8
	call isprint

	test eax, eax
	setne al

	add rsp, 8
	movzx eax, al
	ret

	align 16
.ret0:
	xor eax, eax
	ret





	align 16
__option_is_end:
	mov eax, [rdi + 8]
	test eax, eax
	jne .return

	cmp qword [rdi], 0
	je .continue

.return:
	rep ret

	align 16
.ret0:
	xor eax, eax
	ret

	align 16
.ret0:
	xor eax, eax
	ret

	align 16
.continue:
	cmp qword [rdi + 32], 0
	jne .return

	mov edx, [rdi + 40]
	xor eax, eax
	test edx, edx
	sete al

	ret
