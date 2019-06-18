global sadd_overflow

section .text align=16

sadd_overflow:
	add edi, esi
	mov [rdx], edi
	seto al

	ret
