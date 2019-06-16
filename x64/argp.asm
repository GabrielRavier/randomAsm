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
	sub rsp, 8
	xor eax, eax
	test byte [rdi + 24], 0
	jne .retEdx

	mov edi, [rdi + 8]
	lea edx, [rdi - 1]
	cmp edx, 254
	jbe .continue

.return:
	add rsp, 8
	ret

	align 16
.continue:
	call isprint
	test eax, eax
	setne al

	add rsp, 8
	movzx eax, al
	ret




	align 16
__option_is_end:
	mov eax, [rdi + 8]
	test eax, eax
	jne .ret0

	cmp qword [rdi], 0
	je .continue

.ret0:
	xor eax, eax
	ret

	align 16
.continue:
	cmp qword [rdi + 32], 0
	jne .ret0

	xor eax, eax
	cmp dword [rdi + 40], 0
	sete al

	ret
