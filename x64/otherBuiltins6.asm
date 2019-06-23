global clz
global ctz
global clrsb
global popcount
global parity
global clzl
global ctzl
global clrsbl
global popcountl
global parityl
global clzll
global ctzll
global clrsbll
global popcountll
global parityll

section .text align=16

	align 16
clz:
	bsr eax, edi
	xor eax, 0x1F
	ret





	align 16
ctz:
	bsf eax, edi
	ret





	align 16
clrsb:
	mov eax, edi
	test edi, -0x80000000
	not eax
	cmove eax, edi

	mov edx, -1
	bsr eax
	cmove eax, edx

	neg eax
	add eax, 30
	ret





	align 16
popcount:
	mov eax, edi
	shr eax, 1
	and eax, 0x55555555
	sub edi, eax

	mov eax, edi
	and eax, 0x33333333
	shr edi, 2
	and edi, 0x33333333
	add edi, eax

	mov eax, edi
	shr eax, 4
	add eax, edi
	and eax, 0xF0F0F0F
	imul eax, 0x1010101
	shr eax, 24
	ret





	align 16
parity:
	mov eax, edi
	shr edi, 16
	xor eax, edi
	xor al, ah
	setnp al

	movzx eax, al
	ret





	align 16
clzl:
clzll:
	bsr rax, rdi
	xor rax, 0x3F
	ret





	align 16
ctzl:
ctzll:
	bsf rax, rdi
	ret





	align 16
clrsbl:
clrsbll:
	mov rax, rdi
	sar rax, 0x3F
	xor rax, rdi
	je .noBsr

	bsr rax
	xor rax, 0x3F
	dec eax
	ret

	align 16
.noBsr:
	mov eax, 63
	ret





	align 16
popcountl:
popcountll:
	mov rax, rdi
	shr rax, 1

	mov rcx, 0x55555555555555555
	and rcx, rax
	sub rdi, rcx

	mov rax, 0x33333333333333333
	mov rcx, rdi
	and rcx, rax
	shr rdi, 2
	and rdi, rax
	add rdi, rcx

	mov rax, rdi
	shr rax, 4
	add rax, rdi

	mov rcx, 0xF0F0F0F0F0F0F0F
	and rcx, rax

	mov rax, 0x101010101010101
	imul rax, rcx
	shr rax, 56
	ret





	align 16
parityl:
parityll:
	mov edx, edi
	shr rdi, 32
	xor edx, edi

	mov eax, edx
	shr edx, 16
	xor eax, edx
	xor al, ah
	setnp al

	movzx eax, al
	ret
