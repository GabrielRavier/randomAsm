global bcmp
global bzero
global dremf
global dreml
global drem
global ffsll
global ffsl
global ffs
global mempcpy
global isascii
global pow10l
global scalbl
global signbit
global signbitf
global signbitl
global significandl
global sincosl
global toascii
extern memcpy

section .text align=16

	align 16
bcmp:
	jmp memcmp





	align 16
bzero:
	mov rdx, rsi
	xor esi, esi
	jmp memset

	align 16
dremf:
	movss [rsp - 16], xmm0
	movss [rsp - 8], xmm1

	fld dword [rsp - 8]
	fld dword [rsp - 16]

.loop:
	fprem1
	fnstsw ax
	sahf
	jp .loop

	fstp st1
	fstp dword [rsp - 16]
	movss xmm0, [rsp - 16]
	ret





	align
dreml:
	fld tword [rsp + 24]
	fld tword [rsp + 8]

.loop:
	fprem1
	fnstsw ax
	sahf
	jp .loop

	fstp st1
	ret





	align 16
drem:
	movsd [rsp - 16], xmm0
	movsd [rsp - 8], xmm1

	fld qword [rsp - 8]
	fld qword [rsp - 16]

.loop:
	fprem1
	fnstsw ax
	sahf
	jp .loop

	fstp st1
	fstp qword [rsp - 16]
	movsd xmm0, [rsp - 16]
	ret





	align 16
ffsll:
ffsl:
	bsf rax, rdi
	mov rdx, -1
	cmove rax, rdx

	inc rax
	ret





	align 16
ffs:
	bsf eax, edi
	mov edx, -1
	cmove eax, edx

	inc eax
	ret





	align 16
mempcpy:
	push r14
	push rbx
	push rax

	mov r14, rdx
	mov rbx, rdi
	call memcpy

	lea rax, [rbx + r14]
	add rsp, 8
	pop rbx
	pop r14
	ret





	align 16
isascii:
	xor eax, eax
	and edi, -0x80
	sete al

	ret





	align 16
pow10l:
	fld tword [rsp + 8]
	fldl2t
	fmulp st1, st0
	fld st0
	frndint
	fsub st1, st0
	fxch st1
	f2xm1
	fld1
	faddp st1, st0
	fscale
	fstp st0
	ret





	align 16
scalbl:
	fld tword [rsp + 8]
	movsd [rsp - 16], xmm0

	fld qword [rsp - 16]
	fxch st1
	fscale
	fstp st1
	ret





	align 16
signbit:
	movmskpd eax, xmm0
	and eax, 1
	ret





	align 16
signbitf:
	movd eax, xmm0
	test eax, eax
	sets al

	ret





	align 16
signbitl:
	fld tword [rsp + 8]
	fxam
	fnstsw ax

	fstp st0
	test ah, 2
	setne al

	ret





	align 16
significandl:
	fld tword [rsp + 8]
	fxtract
	fstp st1
	ret





	align 16
sincosl:
	fld tword [rsp + 8]
	fsincos
	fxch st1
	fstp tword [rdi]
	fstp tword [rsi]
	ret





	align 16
toascii:
	mov eax, edi
	and eax, 0x7F
	ret
