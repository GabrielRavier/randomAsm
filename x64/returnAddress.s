global currentAddress
global returnAddress

section .text align=16

	align 16
currentAddress:
	mov rax, [rsp]
	ret





	align 16
returnAddress:
	push rbp
	mov rbp, rsp

	mov rax, [rbp]
	mov rax, [rax + 8]

	pop rbp
	ret
