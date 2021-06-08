global acoshl
global asinhl
global atanhl
global cabsf
global cabsl
global cabs
global cargl
global cimagf
global cimagl
global cimag
global conjf
global conjl
global conj
global copysignf
global copysignl
global copysign
global cprojf
global cprojl
global cproj
global crealf
global creall
global creal
global exp2l
global expm1l
global fmaxf
global fmaxl
global fmax
global fminf
global fminl
global fmin
global ilogbl
global imaxabs
global llabs
global llrintf
global llrintl
global llrint
global llroundf
global llroundl
global llround
global log1pl
global log2l
global logbl
global lrintf
global lrintl
global lrint
global lroundf
global lroundl
global lround
global nearbyintl
global remainderf
global remainderl
global remainder
global rintf
global roundf
global roundfl
global round
global scalblnl
global scalbnl
global truncf
global truncl
global trunc

section .rodata align=16

	align 16
	dat1 dd 0xC4336F8, 0x95F61998, 0x3FFD

	align 16
	dat2 dd 0x3F000000

	align 16
	dat3 dd 0x80000000, 0, 0, 0

	align 16
	dat4 dd 0, 0x80000000, 0, 0

	align 16
	dat5 dd 0x7FFFFFFF, 0, 0, 0

	align 16
	dat6 dd 0xFFFFFFFF, 0x7FFFFFFF, 0, 0

	align 16
	dat7 dd 0x4B000000

	align 16
	dat8 dd 0, 0x433000000

	align 16
	dat9 dd 0x3EFFFFFF

	align 16
	dat10 dd 0, 0x3FE00000

	align 16
	dat11 dd 0, 0x3FF00000

section .text align=16

	align 16
acoshl:
	fld tword [esp + 4]
	fld1
	fld st1

	fadd st0, st1
	fsqrt

	fxch st1
	fsubr st0, st2
	fsqrt

	fmulp st1, st0
	faddp st1, st0

	fldln2
	fxch st1

	fyl2x
	ret





	align 16
asinhl:
	fld tword [esp + 4]
	fld st0
	fmul st0, st1

	fld1
	fld st1
	fadd st0, st1
	fsqrt
	fadd st0, st1
	fdivp st2, st0
	fxch st2

	fxam
	fnstsw ax

	fabs
	faddp st1, st0

	fld st0
	fabs
	fld tword [dat0]
	fxch st1
	fcomip st0, st1
	fstp st0
	jnb .continue

	fstp st1
	fldln2
	fxch st1
	fyl2xp1

.finish:
	test ah, 2
	je .noChs

	fchs

.noChs:
	ret

	align 16
.continue:
	faddp st1, st0
	fldln2
	fxch st1
	fyl2x
	jmp .finish





	align 16
atanhl:
	fld tword [esp + 4]
	fxam
	fnstsw ax

	fabs
	fld1

	fadd st0, st1
	fxch st1
	fadd st0
	fchs
	fdivrp st1, st0

	fld st0
	fabs

	fld tword [dat1]
	fxch st1

	fcomip st0, st1
	fstp st0
	jnb .continue

	fldln2
	fxch st1
	fyl2xp1

.finish:
	test ah, 2
	jne .noChs

	fchs

.noChs:
	fmul dword [dat2]
	ret

.continue:
	fld1
	faddp st1, st0

	fldln2
	fxch st1
	fyl2x
	jmp .finish





	align 16
cabsf:
	sub esp, 4
	movss xmm0, [esp + 8]
	movss xmm1, [esp + 12

	mulss xmm0
	mulss xmm1
	addss xmm0, xmm1
	sqrtss xmm0

	movss [esp], xmm0
	fld dword [esp]
	add esp, 4
	ret





	align 16
cabsl:
	fld tword [esp + 16]
	fld tword [esp + 4]

	fmul st0
	fxch st1
	fmul st0

	faddp st1, st0
	fsqrt
	ret





	align 16
cabs:
	sub esp, 12

	movsd xmm0, [esp + 16]
	movsd xmm1, [esp + 24]
	mulsd xmm0
	mulsd xmm1
	addsd xmm0, xmm1
	sqrtsd xmm0

	movsd [esp], xmm0
	fld qword [esp]

	add esp, 12
	ret





	align 16
cargl:
	fld tword [esp + 4]
	fld tword [esp + 16]
	fpatan
	ret





	align 16
cimagf:
	fld dword [esp + 8]
	ret





	align 16
cimagl:
	fld tword [esp + 16]
	ret





	align 16
cimag:
	fld qword [esp + 12]
	ret





	align 16
conjf:
	movss xmm0, [esp + 8]
	xorps xmm0, [dat3]

	mov eax, [esp + 4]
	movd edx, xmm0
	ret





	align 16
conjl:
	fld tword [esp + 8]
	mov eax, [esp + 4]
	fstp tword [eax]

	fld tword [esp + 20]
	fchs
	fstp tword [eax + 12]
	ret 4





	align 16
conj:
	movsd xmm0, [esp + 16]
	movsd xmm1, [esp + 8]
	xorpd xmm0, [dat4]

	mov eax, [esp + 4]
	unpcklpd xmm1, xmm0

	movups [eax], xmm1
	ret 4





	align 16
copysignf:
	sub esp, 4

	movss xmm1, [esp + 12]
	movss xmm0, [esp + 8]
	andps xmm0, [dat5]

	movaps xmm2, xmm1
	andps xmm2, [dat3]
	orps xmm0, xmm2

	movss [esp], xmm0
	fld dword [esp]

	add esp, 4
	ret





	align 16
copysignl:
	fld tword [esp + 16]
	fxam
	fnstsw ax
	fstp st0

	fld tword [esp + 4]
	fabs

	test ah, 2
	je .noChs

	fchs

.noChs:
	ret





	align 16
copysign:
	sub esp, 12
	movsd xmm1, [esp + 16]
	movsd xmm0, [esp + 24]
	andpd xmm1, [dat6]
	andpd xmm0, [dat4]
	orpd xmm1, xmm0

	movsd [esp], xmm1
	fld qword [esp]

	add esp, 12
	ret





	align 16
cprojf:
	mov eax, [esp + 4]
	mov edx, [esp + 8]
	ret





	align 16
cprojl:
	fld tword [esp + 8]
	mov eax, [esp + 4]
	fstp tword [eax]

	fld tword [esp + 20]
	fstp tword [eax + 12]
	ret 4





	align 16
cproj:
	mov eax, [esp + 4]
	movsd xmm0, [esp + 8]
	movsd xmm1, [esp + 16]
	movsd [eax], xmm0
	movsd [eax + 8] xmm1
	ret 4





	align 16
crealf:
	fld dword [esp + 4]
	ret





	align 16
creall:
	fld tword [esp + 4]
	ret





	align 16
creal:
	fld qword [esp + 4]
	ret





	align 16
exp2l:
	fld tword [esp + 4]
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
expm1l:
	fld1
	fld tword [esp + 4]
	fldl2e

	fmulp st1, st0
	fld st0
	frndint

	fsub st1, st0
	fxch st1
	f2xm1
	fscale

	fld st2
	fxch st1
	fxch st2
	fxch st1
	fscale

	fstp st1
	fsubrp st2, st0
	faddp st1, st0
	ret





	align 16
fmaxf:
	sub esp, 4
	movss xmm0, [esp + 8]
	maxss xmm0, [esp + 12]

	movss [esp], xmm0
	fld dword [esp]
	add esp, 4
	ret





	align 16
fmaxl:
	fld tword [esp + 16]
	fld tword [esp + 4]

	fcomi st0, st1
	fcmovb st0, st1
	fstp st1
	ret





	align 16
fmax:
	sub esp, 12
	movsd xmm0, [esp + 16]
	maxsd xmm0, [esp + 24]

	movsd [esp], xmm0
	fld qword [esp]

	add esp, 12
	ret





	align 16
fminf:
	sub esp, 4
	movss xmm0, [esp + 8]
	minss xmm0, [esp + 12]

	movss [esp], xmm0
	fld dword [esp]
	add esp, 4
	ret





	align 16
fminl:
	fld tword [esp + 16]
	fld tword [esp + 4]

	fcomi st0, st1
	fcmovnbe st0, st1
	fstp st1
	ret





	align 16
fmin:
	sub esp, 12
	movsd xmm0, [esp + 16]
	maxsd xmm0, [esp + 24]

	movsd [esp], xmm0
	fld qword [esp]

	add esp, 12
	ret





	align 16
ilogbl:
	sub esp, 8
	fnstcw word [esp + 6]
	fld tword [esp + 12]
	movzx eax, word [eax + 6]

	fxtract
	fstp st0

	or ah, 0xB
	mov [esp + 4], ax
	fldcw [esp + 4]
	fistp dword [esp]
	fldcw [esp + 6]

	mov eax, [esp]
	add esp, 8
	ret





	align 16
imaxabs:
llabs:
	mov edx, [esp + 8]
	mov eax, [esp + 4]

	mov ecx, edx
	sar ecx, 31

	add eax, ecx
	adc edx, ecx

	xor eax, ecx
	xor edx, ecx
	ret





	align 16
llrintf:
	sub esp, 12

	fld dword [esp + 16]
	fistp qword [esp]

	mov eax, [esp]
	mov edx, [esp + 4]

	add esp, 12
	ret





	align 16
llrintl:
	sub esp, 12

	fld tword [esp + 16]
	fistp qword [esp]

	mov eax, [esp]
	mov edx, [esp + 4]

	add esp, 12
	ret





	align 16
llrint:
	sub esp, 12

	fld qword [esp + 16]
	fistp qword [esp]

	mov eax, [esp]
	mov edx, [esp + 4]

	add esp, 12
	ret





	align 16
llroundf:
	sub esp, 20
	fnstcw word [esp + 14]
	fld dword [esp + 24]

	movzx edx, word [esp + 14]
	fxam
	fnstsw ax
	and dh, -0xC
	or dh, 4
	mov [esp + 12], dx

	fabs
	fadd dword [dat2]

	mov ecx, eax
	fldcw word [esp + 12]
	fistp qword [esp]
	fldcw word [esp + 14]

	mov eax, [esp]
	mov edx, [esp + 4]

	and ch, 2
	je .return

	neg eax
	adc edx, 0
	neg edx

.return:
	add esp, 20
	ret





	align 16
llroundl:
	sub esp, 20
	fnstcw word [esp + 14]
	fld tword [esp + 24]

	movzx edx, word [esp + 14]
	fxam
	fnstsw ax
	and dh, -0xC
	or dh, 4
	mov [esp + 12], dx

	fabs
	fadd dword [dat2]

	mov ecx, eax
	fldcw word [esp + 12]
	fistp qword [esp]
	fldcw word [esp + 14]

	mov eax, [esp]
	mov edx, [esp + 4]

	and ch, 2
	je .return

	neg eax
	adc edx, 0
	neg edx

.return:
	add esp, 20
	ret





	align 16
llround:
	sub esp, 20
	fnstcw word [esp + 14]
	fld qword [esp + 24]

	movzx edx, word [esp + 14]
	fxam
	fnstsw ax
	and dh, -0xC
	or dh, 4
	mov [esp + 12], dx

	fabs
	fadd dword [dat2]

	mov ecx, eax
	fldcw word [esp + 12]
	fistp qword [esp]
	fldcw word [esp + 14]

	mov eax, [esp]
	mov edx, [esp + 4]

	and ch, 2
	je .return

	neg eax
	adc edx, 0
	neg edx

.return:
	add esp, 20
	ret





	align 16
log1pl:
	fld tword [esp + 4]
	fld st0
	fabs
	fld tword [dat1]

	fxch st1
	fcomip st0, st1

	fstp st0
	jnb .yl2x

	fldln2
	fxch st1
	fyl2xp1
	ret

	align 16
.yl2x:
	fld1
	faddp st1, st0
	fldln2
	fxch st1
	fyl2x
	ret





	align 16
log2l:
	fld1
	fld tword [esp + 4]
	fyl2x
	ret





	align 16
logbl:
	fld tword [esp + 4]
	fxtract
	fstp st0
	ret





	align 16
lrintf:
	cvtss2si eax, [esp + 4]
	ret





	align 16
lrintl:
	sub esp, 4

	fld tword [esp + 8]
	fistp dword [eax]
	mov eax, [esp]

	add esp, 4
	ret





	align 16
lrint:
	pxor xmm0
	cvtsd2ss xmm0, [esp + 4]
	cvtss2si eax, xmm0
	ret





	align 16
lroundf:
	movss xmm1, [dat3]
	movss xmm2, [esp + 4]
	movss xmm0, [dat7]

	andps xmm1, xmm2
	orps xmm0, xmm1
	addss xmm0, xmm2
	cvttss2si eax, xmm0
	ret





	align 16
lroundl:
	sub esp, 8
	fnstcw word [esp + 6]
	fld tword [esp + 12]

	movzx edx, word [esp + 6]
	fxam
	fnstsw ax

	and dh, -0xC
	or dh, 4
	mov [esp + 4], dx

	mov ecx, eax
	fldcw word [esp + 4]
	fistp dword [esp]
	fldcw word [esp + 6]

	mov eax, [esp]
	and ch, 2
	je .noNeg

	neg eax

.noNeg:
	add esp, 8
	ret





	align 16
lround:
	movsd xmm1, [dat4]
	movsd xmm2, [esp + 4]
	movsd xmm0, [dat8]

	andpd xmm1, xmm2
	orpd xmm0, xmm1
	addsd xmm0, xmm2

	cvttsd2si eax, xmm0
	ret





	align 16
nearbyintl:
	fld tword [esp + 4]
	frndint
	ret





	align 16
remainderl:
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
remainderf:
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
remainder:
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
rintf:
	sub esp, 4

	movss xmm2, [dat5]
	movss xmm3, [dat7]
	movss xmm1, [esp + 8]
	movaps xmm0, xmm1
	andps xmm0, xmm2

	comiss xmm3, xmm0
	jbe .return

	addss xmm0, xmm3
	andnps xmm2, xmm1
	movaps xmm1, xmm2
	subss xmm0, xmm3
	orps xmm1, xmm0

.return:
	movss [esp], xmm1
	fld dword [esp]
	add esp, 4
	ret





	align 16
rintl:
	fld tword [esp + 4]
	frndint
	ret





	align 16
rint:
	sub esp, 12
	movsd xmm2, [dat6]
	movsd xmm3, [dat8]
	movsd xmm1, [esp + 16]
	movapd xmm0, xmm1
	andpd xmm0, xmm2

	comisd xmm3, xmm0
	jbe .return

	addsd xmm0, xmm3
	andnpd xmm2, xmm1
	movapd xmm1, xmm2
	subsd xmm0, xmm3
	orpd xmm1, xmm0

.return:
	movsd [esp], xmm1
	fld qword [esp]
	add esp, 12
	ret





	align 16
roundf:
	sub esp, 4
	movss xmm2, [dat5]
	movss xmm3, [dat9]
	movss xmm1, [esp + 8]
	movaps xmm0, xmm1
	andps xmm0, xmm2

	comiss xmm3, xmm0
	jbe .return

	addss xmm0, [dat7]
	andnps xmm2, xmm1
	movaps xmm1, xmm2
	cvttss2si eax, xmm0
	pxor xmm0
	cvtsi2ss xmm0, eax

	orps xmm1, xmm0

.return:
	movss [esp], xmm1
	fld dword [esp]
	add esp, 4
	ret





	align 16
roundl:
	sub esp, 4
	fnstcw word [esp + 2]
	fld tword [esp + 8]

	movzx edx, word [esp + 2]
	fxam
	fnstsw ax
	and dh, -0xC
	or dh, 4
	mov [esp], dx

	fabs
	fadd [dat2]
	fldcw word [esp]
	frndint
	fldcw word [esp + 2]
	test ah, 2
	je .noChs

	fchs

.noChs:
	add esp, 4
	ret





	align 16
round:
	sub esp, 12
	movsd xmm2, [dat6]
	movsd xmm7, [dat10]
	movsd xmm1, [esp + 16]
	movapd xmm3, xmm1
	andpd xmm3, xmm2

	comisd xmm7, xmm3
	jbe .return

	movapd xmm0, xmm7
	andnpd xmm2, xmm1

	movsd xmm4, [dat11]
	addsd xmm0, xmm3

	movapd xmm1, xmm2
	movapd xmm5, xmm4
	addsd xmm5, xmm4
	subsd xmm0, xmm7

	movapd xmm6, xmm0
	subsd xmm6, xmm3

	movapd xmm3, xmm4
	subsd xmm3, xmm5

	movapd xmm7, xmm6
	cmpnlesd xmm7, xmm4
	cmpnltsd xmm3, xmm6

	movapd xmm4, xmm7
	andpd xmm3, xmm5
	andpd xmm4, xmm5
	subsd xmm0, xmm4
	addsd xmm0, xmm3
	orpd xmm1, xmm0

.return:
	movsd [esp], xmm1
	fld qword [esp]
	add esp, 12
	ret





	align 16
scalblnl:
scalbnl:
	fild dword [esp + 16]
	fld tword [esp + 4]
	fscale
	fstp st1
	ret





	align 16
truncf:
	sub esp, 4
	movss xmm1, [dat5]
	movss xmm2, [dat9]
	movss xmm0, [esp + 8]
	andps xmm1, xmm0

	comiss xmm2, xmm1
	jbe .return

	cvttss2si eax, xmm0
	pxor xmm0
	cvtsi2ss xmm0, eax

.return:
	movss [esp], xmm0
	fld dword [esp]
	add esp, 4
	ret





	align 16
truncl:
	sub esp, 4
	fnstcw word [esp + 2]
	fld tword [esp + 8]

	movzx eax, word [esp + 2]
	or ah, 0xB
	mov [esp], ax

	fldcw word [esp]
	frndint

	fldcw word [esp + 2]
	add esp, 2
	ret





	align 16
trunc:
	sub esp, 12
	movsd xmm1, [dat6]
	movsd xmm4, [dat10]
	movsd xmm3, [esp + 16]
	movapd xmm2, xmm3
	movapd xmm0, xmm3
	andpd xmm2, xmm1

	comisd xmm4, xmm2
	jbe .return

	movapd xmm0, xmm4
	andnpd xmm1, xmm3
	movsd xmm6, [dat12]
	addsd xmm0, xmm2
	subsd xmm0, xmm4

	movapd xmm5, xmm0
	cmpnlesd xmm5, xmm2

	movapd xmm2, xmm5
	andpd xmm2, xmm6
	subsd xmm0, xmm2
	orpd xmm0, xmm1

.return:
	movsd [esp], xmm0
	fld qword [esp]
	add esp, 12
	ret
