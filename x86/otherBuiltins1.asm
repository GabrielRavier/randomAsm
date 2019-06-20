global bcmp
global bzero
global dremf
global dreml
global drem
global ffsll
global ffsl
global ffs
global mempcpy
global pow10l
global scalbl
global signbit
global signbitf
global signbitl
global significandl
global sincosl
global toascii
extern memcpy
extern memset
extern memcmp

section .text align=16

	align 16
bcmp:
	jmp memcmp





	align 16
bzero:
	sub esp, 16
	push dword [esp + 24]
	push 0
	push dword [esp + 28]
	call memset

	add esp, 28
	ret

	align 16
ffsll:
	xor eax, eax
	mov edx, [esp + 4]
	test edx, edx
	jne .doFfs

	mov edx, [esp + 8]
	test edx, edx
	je .return

	mov eax, 32

.doFfs:
	bsf edx, edx
	lea eax, [eax + edx + 1]

.return:
	ret





	align 16
dremf:
	fld dword [esp + 8]
	fld dword [esp + 4]

.loop:
	fprem1
	fnstsw ax
	sahf
	jp .loop

	fstp st1
	ret





	align 16
dreml:
	fld tword [esp + 16]
	fld tword [esp + 4]

.loop:
	fprem1
	fnstsw ax
	sahf
	jp .loop

	fstp st1
	ret





	align 16
drem:
	fld qword [esp + 12]
	fld qword [esp + 4]

.loop:
	fprem1
	fnstsw ax
	sahf
	jp .loop

	fstp st1
	ret





	align 16
ffsl:
ffs:
	mov eax, [esp + 4]
	bsf ecx, eax

	mov eax, -1
	cmovne eax, ecx
	inc eax
	ret





	align 16
mempcpy:
	push esi
	sub esp, 8
	mov eax, [esp + 16]
	mov ecx, [esp + 24]

	sub esp, 4
	lea esi, [eax + ecx]
	push ecx
	push dword [esp + 28]
	push eax
	call memcpy

	add esp, 24
	mov eax, esi
	pop esi
	ret





	align 16
pow10l:
	fld tword [esp + 4]
	fldl2t
	fmulp st1, st0
	fld st0
	frndint
	fsub st1, st0
	fxch st1
	f2xm1
	faddp st1, st0
	fscale
	fstp st1
	ret





	align 16
scalbl:
	fld qword [esp + 16]
	fld tword [esp + 4]
	fscale
	fstp st1
	ret





	align 16
signbit:
	movsd xmm0, [esp + 4]
	movmskpd eax, xmm0
	and eax, 1
	ret





	align 16
signbitf:
	movss xmm0, [esp + 4]
	movmskps eax, xmm0
	and eax, 1
	ret





	align 16
signbitl:
	movzx eax, word [esp + 12]
	shr eax, 15
	ret





	align 16
significandl:
	fld tword [esp + 4]
	fxtract
	fstp st1
	ret





	align 16
sincosl:
	fld tword [esp + 4]
	mov eax, [esp + 16]
	fsincos
	fxch st1
	fstp tword [eax]
	mov eax, [esp + 20]
	fstp tword [eax]
	ret





	align 16
toascii:
	mov eax, [esp + 4]
	and eax, 0x7F
	ret
