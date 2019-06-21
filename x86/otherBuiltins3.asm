global acosl
global asinl
global atan2l
global atanl
global ceilf
global ceill
global cshl
global cosl
global expl
global fabsf
global fabsl
global floorf
global floorl
global fmodf
global fmodl
global ldexpl
global log10l
global logl
global sinhl
global sinl
global sqrtf
global sqrtl
global tanhl
global tanl

section .rodata align=16

	align 16
	dat1 dd 0x4B000000

	align 16
	dat2 dd 0x7FFFFFFF, 0, 0, 0

	align 16
	dat3 dd 0x3F800000

	align 16
	dat4 dd 0x3F000000

	align 16
	dat5 dd 0x40000000

section .text align=

	align 16
acosl:
	fld tword [esp + 4]
	fld st0
	fmul st0, st1

	fld1
	fsubrp st1, st0
	fsqrt
	fxch st1
	fpatan
	ret





	align 16
asinl:
	fld tword [esp + 4]
	fld st0
	fmul st0, st1

	fld1
	fsubrp st1, st0
	fsqrt
	fpatan
	ret





	align 16
atan2l:
	fld tword [esp + 16]
	fld tword [esp + 4]
	fpatan
	ret





	align 16
atanl:
	fld tword [esp + 4]
	fld1
	fpatan
	ret





	align 16
ceilf:
	sub esp, 4
	movss xmm1, [dat2]
	movss xmm2, [dat1]
	movss xmm0, [esp + 8]
	andps xmm1, xmm0

	comiss xmm2, xmm1
	jbe .return

	cvttss2si eax, xmm0
	pxor xmm1
	movss xmm2, [dat3]
	cvtsi2ss xmm1, eax

	cmpnless xmm0, xmm1
	andps xmm0, xmm2
	addss xmm0, xmm1

.return:
	movss [esp], xmm0
	fld dword [esp]
	add esp, 4
	ret





	align 16
ceill:
	sub esp, 4
	fnstcw word [esp + 2]
	fld tword [esp + 8]

	movzx eax, word [esp + 2]
	and ah, -0xC
	or ah, 8
	mov [esp], ax
	fldcw word [esp]
	frndint
	fldcw word [esp + 2]
	ret





	align 16
coshl:
	fld1
	fld tword [esp + 4]
	fldl2e
	fmulp st1, st0

	fld st0
	frndint

	fsub st1, st0
	fxch st1

	f2xm1
	fadd st0, st2
	fscale
	fstp st1

	fdiv st1, st0
	faddp st1, st0

	fmul dword [dat4]
	ret





	align 16
cosl:
	fld tword [esp + 4]
	fcos
	ret





	align 16
expl:
	fld tword [esp + 4]
	fldl2e
	fmulp st1, st0

	fld st0
	frndint
	fsub st1, st0
	fxch st1
	f2xm1

	fld1
	faddp st1, st0
	fscale

	fstp st1
	ret





	align 16
fabsf:
	sub esp, 4
	movss xmm0, [esp + 8]
	andps xmm0, [dat2]
	movss [esp], xmm0
	fld dword [esp]
	add esp, 4
	ret





	align 16
fabsl:
	fld tword [rsp + 8]
	fabs
	ret





	align 16
floorf:
	sub esp, 4
	movss xmm1, [dat2]
	movss xmm2, [dat1]
	movss xmm0, [esp + 8]
	andps xmm1, xmm0

	comiss xmm2, xmm1
	jbe .return

	cvttss2si eax, xmm0
	pxor xmm1
	movss xmm2, [dat3]
	cvtsi2ss xmm1, eax

	movaps xmm3, xmm1
	cmpnless xmm3, xmm0

	movaps xmm0, xmm3
	andps xmm0, xmm2
	subss xmm1, xmm0
	movaps xmm0, xmm1

.return:
	movss [esp], xmm1
	fld dword [esp]
	add esp, 4
	ret





	align 16
floorl:
	sub esp, 4
	fnstcw word [esp + 2]
	fld tword [esp + 8]

	movzx eax, word [esp + 2]
	and ah, -0xC
	or ah, 4
	mov [esp], ax

	fldcw word [esp]
	frndint
	fldcw word [esp + 2]
	ret





	align 16
fmodf:
	fld dword [esp + 8]
	fld dword [esp + 4]

.loop:
	fprem
	fnstsw ax
	test ah, 4
	jne .loop

	fstp st1
	ret





	align 16
fmodl:
	fld tword [esp + 16]
	fld tword [esp + 4]

.loop:
	fprem
	fnstsw ax
	test ah, 4
	jne .loop

	fstp st1
	ret





	align 16
ldexpl:
	fild dword [esp + 16]
	fld tword [esp + 4]
	fscale
	fstp st1
	ret





	align 16
log10l:
	fldlg2
	fld tword [esp + 4]
	fyl2x
	ret





	align 16
logl:
	fldln2
	fld tword [esp + 4]
	fyl2x
	ret





	align 16
sinhl:
	fld tword [esp + 4]
	fxam
	fnstsw ax
	fabs

	fld1
	fldl2e
	fmulp st2, st0

	fld st1
	frndint

	fsub st2, st0
	fxch st2
	f2xm1

	fxch st1
	fxch st2
	fxch st1

	fscale

	fld st2
	fxch st1
	fxch st2
	fxch st1

	fscale

	fstp st1

	fsub st0, st2
	faddp st1, st0
	fadd st1, st0
	fdivr st1, st0
	faddp st1, st0

	test ah, 2
	je .noChs

	fchs

.noChs:
	fmul dword [dat4]
	ret





	align 16
sinl:
	fld tword [esp + 4]
	fsin
	ret





	align 16
sqrtf:
	sub esp, 4
	movss xmm0, [esp+8]
	sqrtss xmm0, xmm0
	movss [esp], xmm0
	fld dword [esp]
	add esp, 4
	ret





	align 16
sqrtl:
	fld tword [esp + 4]
	fsqrt
	ret





	align 16
tanhl:
	fld tword [esp + 4]
	fxam
	fnstsw ax

	fadd st0
	fabs
	fchs

	fld1
	fldl2e
	fmulp st2, st0

	fld st1
	frndint

	fsub st2, st0
	fxch st2
	f2xm1

	fxch st1
	fxch st2
	fxch st1
	fscale

	fld st2
	fxch st1
	fxch st2
	fxch st1
	fscale

	fstp st1
	fsubrp st2, st0
	faddp st1, st0

	fld st0
	fadd [dat5]
	fdivp st1, st0

	test ah, 2
	jne .noChs

	fchs

.noChs:
	ret





	align 16
tanl:
	fld tword [esp + 4]
	fptan
	fstp st0
	ret
