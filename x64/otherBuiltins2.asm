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
global rintl
global rint
global roundf
global roundl
global round
global scalblnl
global scalbnl
global truncf
global truncl
global trunc

section .rodata align=16

	align 16
	dat1 dd 0xC4336F8, 0x95F61998, 0x3FFD, 0

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
	dat7 dd 0x3EFFFFFF

	align 16
	dat8 dd 0xFFFFFFFF, 0x3FDFFFFF

	align 16
	dat9 dd 0x4B000000

	align 16
	dat10 dd 0, 0x43300000

section .text align=16

	align 16
acoshl:
	fld tword [rsp + 8]
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
	fld tword [rsp + 8]
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

	fldln2
	fld st1
	fabs

	fld tword [dat1]
	fxch st1
	fcomip st0, st1
	fstp st1
	jnb .continue

	fstp st2
	fyl2xp1

.finish:
	test ah, 2
	je .return

	fchs

.return:
	ret

	align 16
.continue:
	fxch st1

	faddp st2, st0
	fxch st1
	fyl2x
	jmp .finish





	align 16
atanhl:
	fld tword [rsp + 8]

	fxam
	fnstsw ax

	fabs

	fld1
	fld st1

	fadd st0, st1
	fxch st2
	fadd st0, st2
	fldln2

	fld st2
	fabs

	fld word [dat1]
	fxch st1
	fcomip st0, st1

	fstp st0
	jnb .continue

	fstp st1
	fxch st1
	fyl2xp1

.finish:
	test ah, 2
	jne .return

	fchs

.return:
	fmul dword [dat2]
	ret

.continue:
	fxch st2
	faddp st1, st0
	fyl2x
	jmp .finish





	align 16
cabsf:
	movq [rsp - 8], xmm0
	movss xmm0, [rsp - 8]
	movss xmm1, [rsp - 4]

	mulss xmm0
	mulss xmm1
	addss xmm0, xmm1
	sqrtss xmm0
	ret





	align 16
cabsl:
	fld tword [rsp + 24]
	fld tword [rsp + 8]

	fmul st0
	fxch st1
	fmul st0
	faddp st1, st0
	fsqrt
	ret





	align 16
cabs:
	mulsd xmm1
	mulsd xmm0
	addsd xmm0, xmm1
	sqrtsd xmm0
	ret





	align 16
cargl:
	fld tword [rsp + 8]
	fld tword [rsp + 24]

	fpatan
	ret





	align 16
cimagf:
	movq [rsp - 8], xmm0
	movss xmm0, [rsp - 4]
	ret





	align 16
cimagl:
	fld tword [rsp + 24]
	ret





	align 16
cimag:
	movapd xmm0, xmm1
	ret





	align 16
conjf:
	movq [rsp - 8], xmm0
	movss xmm0, [rsp - 4]
	movss xmm1, [rsp - 8]
	xorps xmm0, [dat3]

	movss [rsp - 16], xmm1
	movss [rsp - 12], xmm0
	movq xmm0, [rsp - 16]
	ret





	align 16
conjl:
	fld tword [rsp + 24]
	fchs
	fld tword [rsp + 8]
	ret





	align 16
conj:
	xorpd xmm1, [dat4]
	ret





	align 16
copysignf:
	andps xmm0, [dat5]
	movapd xmm2, xmm1

	andps xmm2, [dat3]
	orps xmm0, xmm2
	ret





	align 16
copysignl:
	fld tword [rsp + 24]
	fxam
	fnstsw ax
	fstp st0

	fld tword [rsp + 8]
	fabs
	test ah, 2
	je .noChs

	fchs

.noChs:
	ret





	align 16
copysign:
	andpd xmm0, [dat6]
	movapd xmm2, xmm1

	andpd xmm2, [dat4]
	orpd xmm0, xmm2
	ret





	align 16
cprojf:
	movq [rsp - 8], xmm0
	movss xmm0, [rsp - 8]
	movss [rsp - 16], xmm0
	movss xmm0, [rsp - 4]
	movss [rsp - 12], xmm0
	movq xmm0, [rsp - 16]
	ret





	align 16
cprojl:
	fld tword [rsp + 8]
	fld tword [rsp + 24]
	fxch st1
	ret





	align 16
cproj:
	ret





	align 16
crealf:
	movq [rsp - 8], xmm0
	movss xmm0, [rsp - 8]
	ret





	align 16
creall:
	fld tword [rsp + 8]
	ret





	align 16
creal:
	ret





	align 16
exp2l:
	fld tword [rsp + 8]
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
	fld tword [rsp + 8]
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
	maxss xmm0, xmm1
	ret





	align 16
fmaxl:
	fld tword [rsp + 24]
	fld tword [rsp + 8]

	fcomi st0, st1
	fcmovb st0, st1

	fstp st1
	ret





	align 16
fmax:
	maxsd xmm0, xmm1
	ret





	align 16
fminf:
	minss xmm0, xmm1
	ret





	align 16
fminl:
	fld tword [rsp + 24]
	fld tword [rsp + 8]

	fcomi st0, st1
	fcmovnbe st0, st1

	fstp st1
	ret





	align 16
fmin:
	minsd xmm0, xmm1
	ret





	align 16
ilogbl:
	fnstcw word [rsp - 10]
	fld tword [rsp + 8]
	movzx eax, word [rsp - 10]
	fxtract
	fstp st0

	or ah 0xB
	mov [rsp - 12], ax
	fldcw word [rsp - 12]
	fistp dword [rsp - 16]

	fldcw word [rsp - 10]
	mov eax, [rsp - 16]
	ret





	align 16
imaxabs:
llabs:
	mov rax, rdi

	neg rax
	cmovl rax, rdi
	ret





	align 16
llrintf:
lrintf:
	cvtss2si rax, xmm0
	ret





	align 16
llrintl:
lrintl:
	fld tword [rsp + 8]
	fistp qword [rsp - 16]
	mov rax, [rsp - 16]
	ret





	align 16
llrint:
lrint:
	cvtsd2si rax, xmm0
	ret





	align 16
llroundf:
lroundf:
	movss xmm2, [dat3]
	movss xmm1, [dat7]
	andps xmm2, xmm0
	orps xmm1, xmm2
	addss xmm1, xmm0
	cvttss2si rax, xmm1
	ret





	align 16
llroundl:
lroundl:
	fnstcw word [rsp - 10]
	fld tword [rsp + 8]

	movzx edx, word [rsp - 10]
	fxam
	fnstsw ax

	and dh, -0xC
	or dh, 4
	mov [rsp - 12], dx

	fabs
	fadd dword [dat2]

	fldcw word [rsp - 12]
	fistp qword [rsp - 24]

	fldcw word [rsp - 10]
	mov r8, [rsp - 24]

	test ah, 2
	je .noNeg

	neg r8

.noNeg:
	mov rax, r8
	ret





	align 16
llround:
lround:
	movsd xmm2, [dat4]
	movsd xmm1, [dat8]
	andpd xmm2, xmm0
	orpd xmm1, xmm2
	addsd xmm1, xmm0
	cvttsd2si rax, xmm1
	ret





	align 16
log1pl:
	fld tword [rsp + 8]
	fldln2
	fld st1
	fabs

	fld tword [dat1]
	fxch st1
	fcomip st0, st1
	fstp st0
	jnb .yl2x

	fxch st1
	fyl2xp1
	ret

.yl2x:
	fld1
	faddp st2, st0
	fxch st1
	fyl2x
	ret





	align 16
log2l:
	fld1
	fld tword [rsp + 8]
	fyl2x
	ret





	align 16
logbl:
	fld tword [rsp + 8]
	fxtract
	fstp st0
	ret





	align 16
nearbyintl:
	fld tword [rsp + 8]
	frndint
	ret





	align 16
remainderf:
	movss [rsp - 8], xmm0
	movss [rsp - 4], xmm1

	fld dword [rsp - 4]
	fld dword [rsp - 8]

.loop:
	fprem1
	fnstsw ax
	test ah, 4
	jne .loop

	fstp st1
	fstp dword [rsp - 8]
	movss xmm0, [rsp - 8]
	ret





	align 16
remainderl:
	fld tword [rsp + 24]
	fld tword [rsp + 8]

.loop:
	fprem1
	fnstsw ax
	test ah, 4
	jne .loop

	fstp st1
	ret





	align 16
remainder:
	movsd [rsp - 16], xmm0
	movsd [rsp - 8], xmm1

	fld qword [rsp - 8]
	fld qword [rsp - 16]

.loop:
	fprem1
	fnstsw ax
	test ah, 4
	jne .loop

	fstp st1
	fstp dword [rsp - 16]
	movss xmm0, [rsp - 16]
	ret





	align 16
rintf:
	movss xmm2, [dat5]
	movss xmm3, [dat9]
	movaps xmm1, xmm0
	andps xmm1, xmm2

	comiss xmm3, xmm1
	jbe .return

	addss xmm1, xmm3
	andnps xmm2, xmm0
	movaps xmm0, xmm2
	subss xmm1, xmm3
	orps xmm0, xmm1

.return:
	ret





	align 16
rintl:
	fld tword [rsp + 8]
	frndint
	ret





	align 16
rint:
	movsd xmm2, [dat6]
	movsd xmm3, [dat10]
	movapd xmm1, xmm0
	andpd xmm1, xmm2

	comisd xmm3, xmm1
	jbe .return

	addsd xmm1, xmm3
	andnpd xmm2, xmm0
	movapd xmm0, xmm2
	subsd xmm1, xmm3
	orpd xmm0, xmm1

.return:
	ret





	align 16
roundf:
	movss xmm2, [dat5]
	movss xmm3, [dat9]
	movaps xmm1, xmm0
	andps xmm1, xmm2

	comiss xmm3, xmm1
	jbe .return

	addss xmm1, [dat7]
	andnps xmm2, xmm0
	movaps xmm0, xmm2
	cvttss2si eax, xmm1
	pxor xmm1
	cvtsi2ss xmm1, eax
	orps xmm0, xmm1

.return:
	ret





	align 16
roundl:
	fnstcw word [rsp - 10]
	fld tword [rsp + 8]

	movzx edx, word [rsp - 10]
	fxam

	fnstsw ax
	and dh, -0xC
	or dh, 4
	mov [rsp - 12], dx

	fabs
	fadd dword [dat2]

	fldcw word [rsp - 12]
	frndint
	fldcw word [rsp - 10]

	test ah, 2
	je .noChs

	fchs

.noChs:
	ret





	align 16
round:
	movsd xmm2, [dat6]
	movsd xmm3, [dat10]
	movapd xmm1, xmm0
	andpd xmm1, xmm2

	comisd xmm3, xmm1
	jbe .return

	addsd xmm1, [dat8]
	andnpd xmm2, xmm0
	movapd xmm0, xmm2
	cvttsd2si rax, xmm1
	pxor xmm1
	cvtsi2sd xmm1, rax
	orpd xmm0, xmm1

.return:
	ret





	align 16
scalblnl:
scalbnl:
	fld tword [rsp + 8]

	mov [rsp - 12], edi
	fild dword [rsp - 12]
	fxch st1
	fscale
	fstp st1
	ret





	align 16
truncf:
	movss xmm1, [dat5]
	movss xmm2, [dat9]
	andps xmm1, xmm0

	comiss xmm2, xmm1
	jbe .return

	cvttss2si eax, xmm0
	pxor xmm0
	cvtsi2ss xmm0, eax

.return:
	ret





	align 16
truncl:
	fnstcw word [rsp - 10]
	fld tword [rsp + 8]

	movzx eax, word [rsp - 10]
	or ah, 0xB
	mov [rsp - 12], ax

	fldcw word [rsp - 12]
	frndint

	fldcw word [rsp - 10]

	ret





	align 16
trunc:
	movsd xmm1, [dat6]
	movsd xmm2, [dat10]
	andpd xmm1, xmm0

	comisd xmm2, xmm1
	jbe .return

	cvttsd2si rax, xmm0
	pxor xmm0
	cvtsi2sd xmm0, rax

.return:
	ret
