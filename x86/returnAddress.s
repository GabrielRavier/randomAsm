global currentAddress
global returnAddress

section .text align=16

	align 16
currentAddress:
	mov eax, [esp]
	ret





	align 16
returnAddress:
	push ebp
	mov ebp, esp

	mov eax, [ebp]
	mov eax, [eax + 4]

	pop ebp
	ret
