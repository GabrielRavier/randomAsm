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

section .rodata align=16

	align 16
	dat1 times 16 db 0x55

	align 16
	dat2 times 16 db 0x33

	align 16
	dat3 times 16 db 0xF

section .text align=16

	align 16
clz:
clzl:
	bsr eax, [esp + 4]
	xor eax, 0x1F
	ret





	align 16
ctz:
ctzl:
	bsf eax, [esp + 4]
	ret





	align 16
clrsb:
clrsbl:
	mov ecx, -1
	mov eax, [esp + 4]
	mov edx, eax
	test eax, -0x80000000
	not edx
	cmove edx, eax

	bsr eax, edx
	cmove eax, ecx

	neg eax
	add eax, 30
	ret





	align 16
popcount:
popcountl:
	mov eax, [esp + 4]
	mov ecx, eax
	shr ecx, 1
	and ecx, 0x55555555
	sub eax, ecx

	mov ecx, eax
	shr eax, 2
	and ecx, 0x33333333
	and eax, 0x33333333
	add eax, ecx

	mov ecx, eax
	shr ecx, 4
	add ecx, eax
	and ecx, 0xF0F0F0F
	imul eax, ecx, 0x1010101
	shr eax, 24
	ret





	align 16
parity:
parityl:
	mov eax, [esp + 4]
	mov ecx, eax
	shr ecx, 16
	xor ecx, eax
	xor eax
	xor cl, ch
	setnp al
	ret





	align 16
clzll:
	bsr eax, [esp + 4]
	mov ecx, [esp + 8]
	bsr edx, ecx

	xor eax, 0x1F
	xor edx, 0x1F
	add eax, 32

	test ecx
	cmovne eax, edx
	ret





	align 16
ctzll:
	bsf eax, [esp + 8]
	mov ecx, [esp + 4]
	bsf edx, ecx

	add ecx, 32

	test ecx
	cmovne eax, edx
	ret





	align 16
clrsbll:
	mov ecx, [esp + 8]
	mov edx, 0x3F
	mov eax, ecx
	sar eax, 0x1F
	xor ecx, eax

	xor eax, [esp + 4]
	bsr eax
	cmovne edx, eax

	bsr eax, ecx
	xor edx, 0x1F
	xor eax, 0x1F
	add edx, 32

	test ecx
	cmove eax, edx

	dec eax
	ret





	align 16
popcountll:
	movq xmm0, [esp + 4]
	movdqa xmm1, xmm0
	psrlw xmm1, 1

	pand xmm1, [dat1]
	psubb xmm0, xmm1

	movdqa xmm1, [dat2]
	movdqa xmm2, xmm0
	psrlw xmm0, 2
	pand xmm2, xmm1
	pand xmm0, xmm1
	paddb xmm0, xmm2

	movdqa xmm1, xmm0
	psrlw xmm1, 4
	paddb xmm1, xmm0
	pxor xmm0

	pand xmm1, [dat3]
	psadbw xmm0, xmm1
	movd eax, xmm0
	ret





	align 16
parityll:
	push ebx
	mov edx, [esp + 12]
	mov eax, [esp + 8]
	mov ebx, edx
	xor ebx, eax
	xor eax

	mov edx, ebx
	shr ebx, 16
	xor edx, ebx
	pop ebx

	xor dl, dh
	setnp al

	ret
