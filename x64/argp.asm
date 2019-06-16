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

	xor edx, edx
	test byte [rdi + 24], 0
	jne .retEdx

	mov edi, [rdi + 8]
	lea eax, [rdi - 1]
	cmp eax, 254
	jbe .continue

.retEdx:
	mov eax, edx
	add rsp, 8
	ret

	align 16
.continue:
	call isprint
	xor edx, edx
	test eax, eax
	setne dl

	add rsp, 8
	mov eax, edx
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
