global _mm_malloc
global _mm_free
extern posix_memalign
extern malloc
extern free

section .text align=16

	align 16
_mm_malloc:
	mov rdx, rdi
	cmp rsi, 1
	je .jmpMalloc

	lea rax, [rsi - 2]
	sub rsp, 24

	test rax, -3
	mov eax, 8
	cmove rsi, rax

	lea rdi, [rsp + 8]
	call posix_memalign
	test eax
	mov eax, 0
	cmove rax, [rsp + 8]

	add rsp, 8
	ret

.jmpMalloc:
	jmp malloc





	align 16
_mm_free:
	jmp free
