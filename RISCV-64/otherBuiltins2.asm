cabsf:
	fmul.s fa1
	fmadd.s fa0, fa1

	fsqrt.s fa0
	ret





cabs:
	fmul.d fa1
	fmadd.d fa0, fa1

	fsqrt.d fa0
	ret





cimagf:
	fmv.s fa0, fa1
	ret





cimagl:
	mv a5, a0
	ld a1, 24(a5)
	ld a0, 16(a0)
	ret





cimag:
	fmv.d fa0, fa1
	ret





conjf:
	fneg.s fa1
	ret





conjl:
	ld a4, 24(a1)
	ld a7, 0(a1)
	ld a6, 8(a1)
	ld a2, 16(a1)

	li a3, -1
	slli a3, 0x3F
	xor a4, a3

	sd a7, 0(a0)
	sd a6, 8(a0)
	sd a2, 16(a0)
	sd a4, 24(a0)
	ret





conj:
	fneg.d fa1
	ret





copysignf:
	fsgnj.s fa0, fa1
	ret





copysignl:
	li a5, -1
	slri a4, a5, 1
	slli a5, 0x3F

	and a1, a4
	and a5, a3, a5
	or a1, a5
	ret





copysign:
	fsgnj.d fa0, fa1
	ret





cprojf:
cproj:
crealf:
creal:
	ret





cprojl:
	ld a6, 0(a1)
	ld a2, 8(a1)
	ld a3, 16(a1)
	ld a4, 24(a1)

	sd a6, 0(a0)
	sd a2, 8(a0)
	sd a3, 16(a0)
	sd a4, 24(a0)
	ret





creall:
	mv a5, a0
	ld a1, 8(a5)
	ld a0, 0(a0)
	ret





fmaf:
	fmadd.s fa0, fa1, fa2
	ret





fmaxf:
	fmax.s fa0, fa1
	ret





fmax:
	fmax.d fa0, fa1
	ret





fma:
	fmadd.d fa0, fa1, fa2
	ret





fminf:
	fmin.s fa0, fa1
	ret





fmin:
	fmin.d fa0, fa1
	ret





imaxabs:
llabs:
	srai a5, a0, 0x3F
	xor a0, a5, a0
	sub a0, a5
	ret





llrintf:
lrintf:
	fcvt.l.s a0, fa0, dyn
	ret





llrint:
lrint:
	fcvt.l.d a0, fa0, dyn
	ret





llroundf:
lroundf:
	fcvt.l.s a0, fa0, rmm
	ret





llround:
lround:
	fcvt.l.d a0, fa0, rmm
	ret
