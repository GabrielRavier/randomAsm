global square

segment .text align=16

square:
	mov eax, edi
	imul eax, edi
	ret