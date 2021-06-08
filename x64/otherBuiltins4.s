global abs
global ceil
global fabs
global floor
global fmod
global isdigit
global labs
global sqrt

section .rodata align=16

	align 16
	dat1 dd 0, 0x43300000

	align 16
	dat2 dd 0xFFFFFFFF, 0x7FFFFFFF, 0, 0

	align 16
	dat3 dd 0, 0x3FF00000

section .text align=16

	align 16
abs:
	mov eax, edi
	neg eax
	cmovl eax, edi
	ret





	align 16
ceil:
	movsd xmm1, [dat2]
	movsd xmm2, [dat1]
	andpd xmm1, xmm0

	comisd xmm2, xmm1
	jbe .return

	cvttsd2si rax, xmm0
	pxor xmm1
	movsd xmm2, [dat3]
	cvtsi2sd xmm1, rax
	cmpnlesd xmm0, xmm1

	andpd xmm0, xmm2
	addsd xmm0, xmm1

.return:
	ret





	align 16
fabs:
	andpd xmm0, [dat2]
	ret





	align 16
floor:
	movsd xmm1, [dat2]
	movsd xmm2, [dat1]
	andpd xmm1, xmm0

	comisd xmm2, xmm1
	jbe .return

	cvttsd2si rax, xmm0
	pxor xmm1
	movsd xmm2, [dat3]
	cvtsi2sd xmm1, rax
	movapd xmm3, xmm1
	cmpnlesd xmm3, xmm0

	movapd xmm0, xmm3
	andpd xmm0, xmm2
	subsd xmm1, xmm0
	movapd xmm0, xmm1

.return:
	ret





	align 16
fmod:
	movsd [rsp - 16], xmm0
	movsd [rsp - 8], xmm1
	fld qword [rsp - 8]
	fld qword [rsp - 16]

.loop:
	fprem
	fnstsw ax

	test ah, 4
	jne .loop

	fstp st1
	fstp qword [rsp - 16]
	movsd xmm0, [rsp - 16]
	ret





	align 16
isdigit:
	sub edi, 0x30
	xor eax, eax
	cmp edi, 9
	setbe al

	ret





	align 16
labs:
	mov rax, rdi
	cqo
	xor rax, rdx
	sub rax, rdx
	ret





	align 16
sqrt:
	sqrtsd xmm0
	ret
