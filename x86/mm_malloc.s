global _mm_malloc
global _mm_free
extern malloc
extern free
extern posix_memalign

section .text align=16

	align 16
_mm_malloc:
	sub esp, 28
	mov eax, [esp + 36]
	mov edx, [esp + 32]

	cmp eax, 1
	je .jmpMalloc

	cmp eax, 2
	mov eax, 4
	cmove eax, ecx

	sub esp, 4
	push edx
	push eax
	lea eax, [esp + 24]
	push eax
	call posix_memalign

	test eax
	mov eax, 0
	cmove eax, [esp + 28]

	add esp, 44
	ret

.jmpMalloc:
	add esp, 28
	jmp malloc





	align 16
_mm_free:
	jmp free
