global _mulx_u64
global _mulx_u32
extern uint128_t_operator_multiply
extern uint128_t_operator_shiftRight
extern uint128_t_operator_cast_uint64_t

section .text align=16

	align 16
_mulx_u64:
	push edi
	push esi
	push ebx
	sub esp, 64

	mov dword [esp + 32], 0
	mov dword [esp + 36], 0

	mov eax, [esp + 80]
	mov edx, [esp + 84]
	mov [esp + 40], eax
	mov [esp + 44], edx
	mov dword [esp + 48], 0
	mov dword [esp + 52], 0

	mov eax, [esp + 88]
	mov edx, [esp + 92]
	mov [esp + 56], eax
	mov [esp + 60], edx

	lea ebx, [esp + 16]
	lea edi, [esp + 48]
	mov [esp + 8], edi
	lea esi, [esp + 32]
	mov [esp + 4], esi
	mov [esp], ebx
	call uint128_t_operator_multiply
	sub esp, 4

	mov dword [esp + 48], 0
	mov dword [esp + 52], 0
	mov dword [esp + 56], 64
	mov dword [esp + 60], 0

	mov [esp + 8], edi
	mov [esp + 4], ebx
	mov [esp], esi
	call uint128_t_operator_shiftRight
	sub esp, 4

	mov [esp], esi
	call uint128_t_operator_cast_uint64_t

	mov ecx, [esp + 96]
	mov [ecx], eax
	mov [ecx + 4], edx

	mov [esp], ebx
	call uint128_t_operator_cast_uint64_t

	add esp, 64
	pop ebx
	pop esi
	pop edi
	ret





	align 16
_mulx_u32:
	mov eax, [esp + 8]
	mov ecx, [esp + 12]
	mul dword [esp + 4]
	mov [ecx], edx
	ret
