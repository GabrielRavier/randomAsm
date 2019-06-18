global sadd_overflow

section .text align=16

sadd_overflow:
	mov eax, [esp + 8]
	mov edx, [esp + 12]
	add eax, [esp + 4]
	mov [edx], eax
	seto al

	ret
