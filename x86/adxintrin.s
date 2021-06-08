global _subborrow_u32
global _addcarry_u32

section .text align=16

	align 16
_subborrow_u32:
	mov ecx, [esp + 16]
	mov edx, [esp + 8]
	mov al, [esp + 4]

	add al, -1
	sbb edx, [esp + 12]
	setc al

	mov [ecx], edx
	ret





	align 16
_addcarry_u32:
_addcarryx_u32:
	mov ecx, [esp + 16]
	mov edx, [esp + 8]
	mov al, [esp + 4]

	add al, -1
	adc edx, [esp + 12]
	setc al

	mov [ecx], edx
	ret
