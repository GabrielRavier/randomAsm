global sadd_overflow
global saddl_overflow
global saddll_overflow

global uadd_overflow
global uaddl_overflow
global uaddll_overflow

section .text align=16

	align 16
sadd_overflow:
	add edi, esi
	mov [rdx], edi
	seto al

	ret





	align 16
saddl_overflow:
saddll_overflow:
	add rdi, rsi
	mov [rdx], rdi
	seto al

	ret





	align 16
uadd_overflow:
	add edi, esi
	mov [rdx], edi
	setc al

	ret





	align 16
uaddl_overflow:
uaddll_overflow:
	add rdi, rsi
	mov [rdx], rdi
	setc al

	ret
