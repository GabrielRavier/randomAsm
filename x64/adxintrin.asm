global _subborrow_u32
global _addcarry_u32
global _addcarryx_u32
global _subborrow_u64
global _addcarry_u64
global _addcarryx_u64

section .text align=16

	align 16
_subborrow_u32:
	add dil, -1
	sbb esi, edx
	setc al

	mov [rcx], esi
	ret





	align 16
_addcarry_u32:
_addcarryx_u32:
	add dil, -1
	adc esi, edx
	setc al

	mov [rcx], esi
	ret





	align 16
_subborrow_u64:
	add dil, -1
	sbb rsi, rdx
	setc al

	mov [rcx], rsi
	ret





	align 16
_addcarry_u64:
_addcarryx_u64:
	add dil, -1
	adc rsi, rdx
	setc al

	mov [rcx], rsi
	ret
