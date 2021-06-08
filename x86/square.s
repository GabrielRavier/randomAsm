global square

segment .text align=16

square:
	mov eax, [esp + 4]
	imul eax
	ret