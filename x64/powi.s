global powi
global powif
global powil
global __powidf2
global __powisf2
global __powixf2

section .rodata align=16

	align 16
	dat1 dd 0, 0x3FF00000

	align 16
	dat2 dd 0x3F800000

section .text align=16

	align 16
powi:
__powidf2:
	mov rcx, [dat1]
	mov eax, edi
	movq xmm1, rcx
	jmp .startLoop

	align 16
.loop:
	mulsd xmm0

.startLoop:
	test al, 1
	je .skipMul

	mulsd xmm1, xmm0

.skipMul:
	mov edx, eax
	shr edx, 31
	add eax, edx

	sar eax, 1
	jne .loop

	test edi
	jns .return

	movsd xmm2, [dat1]
	divsd xmm2, xmm1
	movapd xmm1, xmm2

.return:
	movapd xmm0, xmm1
	ret





	align 16
powif:
__powisf2:
	movss xmm1, [dat2]
	mov eax, edi
	jmp .startLoop

	align 16
.loop:
	mulss xmm0

.startLoop:
	test al, 1
	je .skipMul

	mulss xmm1, xmm0

.skipMul:
	mov edx, eax
	shr edx, 31
	add eax, edx

	sar eax, 1
	jne .loop

	test edi
	jns .return

	movss xmm2, [dat2]
	divss xmm2, xmm1
	movaps xmm1, xmm2

.return:
	movaps xmm0, xmm1
	ret





	align 16
powil:
__powixf2:
	fld tword [rsp + 8]
	mov eax, edi

	fld1
	jmp .startLoop

.loop:
	fxch st1
	fmul st0
	fxch st1

.startLoop:
	test al, 1
	je .skipMul

	fmul st0, st1

.skipMul:
	mov edx, eax
	shr edx, 31
	add eax, edx

	sar eax, 1
	jne .loop

	fstp st1

	test edi
	jns .return

	fld1
	fdivrp st1, st0

.return:
	ret
