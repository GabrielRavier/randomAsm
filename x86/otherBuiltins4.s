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
labs:
	mov eax, [esp + 4]
	cdq
	xor eax, edx
	sub eax, edx
	ret





	align 16
ceil:
	sub esp, 12
	movsd xmm2, [dat2]
	movsd xmm3, [dat1]
	movsd xmm0, [esp + 16]
	movapd xmm1, xmm0
	andpd xmm1, xmm2

	comisd xmm3, xmm1
	jbe .return

	addsd xmm1, xmm3
	andnpd xmm2, xmm0
	movsd xmm4, [dat3]
	subsd xmm1, xmm3
	orpd xmm1, xmm2
	cmpnlesd xmm0, xmm1
	andpd xmm0, xmm4
	addsd xmm0, xmm1

.return:
	movsd [esp], xmm0
	fld qword [esp]
	add esp, 12
	ret





	align 16
fabs:
	sub esp, 12
	movsd xmm0, [esp + 16]
	andpd xmm0, [dat2]
	movsd [esp], xmm0
	fld qword [esp]
	ret





	align 16
floor:
	sub esp, 12
	movsd xmm2, [dat2]
	movsd xmm3, [dat1]
	movsd xmm1, [esp + 16]
	movapd xmm0, xmm1
	andpd xmm0, xmm2

	comisd xmm3, xmm0
	jbe .return

	addsd xmm0, xmm3
	andnpd xmm2, xmm1

	movsd xmm5, [dat3]
	subsd xmm0, xmm3
	orpd xmm0, xmm2

	movapd xmm4, xmm0
	cmpnlesd xmm4, xmm1

	movapd xmm1, xmm4
	andpd xmm1, xmm5
	subsd xmm0, xmm1
	movapd xmm1, xmm0

.return:
	movsd [esp], xmm1
	fld qword [esp]
	add esp, 12
	ret





	align 16
fmod:
	fld qword [esp + 12]
	fld qword [esp + 4]

.loop:
	fprem
	fnstsw ax

	sahf
	jp .loop

	fstp st1
	ret





	align 16
isdigit:
	mov eax, [esp + 4]
	sub eax, 0x30
	cmp eax, 9
	setbe al

	movzx eax, al
	ret





	align 16
sqrt:
	sub esp, 12
	movsd xmm0, [esp + 16]
	sqrtsd xmm0
	movsd [esp], xmm0
	fld qword [esp]
	add esp, 12
	ret
