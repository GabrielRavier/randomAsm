	.text

cabsf:
	fmul s1
	fmadd s0, s1
	fsqrt s0
	ret





cabs:
	fmul d1
	fmadd d0, d1
	fsqrt d0
	ret





cargf:
	fmov s2, s1
	fmov s1, s0
	fmov s0, s2
	b atan2f





cargl:
	mov v2.16b, v1.16b
	mov v1.16b, v0.16b
	mov v0.16b, v2.16b
	b atan2l





carg:
	fmov d2, d1
	fmov d1, d0
	fmov d0, d2
	b atan2





cimagf:
	fmov s0, s1
	ret





cimagl:
	mov v0.16b, v1.16b
	ret





cimag:
	fmov d0, d1
	ret





conjf:
	fneg s1
	ret





conjl:
	fmov x2, d1
	fmov x3, v1.d[1]
	mov x0, x2

	fmov d1, x0
	eor x1, x3, 0x8000000000000000
	fmov v1.d[1], x1
	ret





conj:
	fneg d1
	ret





copysignf:
	movi v2.2s, 0x80, lsl 24
	bit v0.8b, v1.8b, v2.8b
	ret





copysignl:
	fmov x4, d0
	fmov x5, v0.d[1]
	fmov x3, v1.d[1]
	mov x0, x4
	fmov d0, x0

	and x2, x5, 0x7FFFFFFFFFFFFFFF
	and x1, x3, 0x8000000000000000
	orr x5, x2, x1
	fmov v0.d[1], x5
	ret





copysign:
	mov x0, 0x8000000000000000
	fmov d2, x0
	bit v0.8b, v1.8b, v2.8b
	ret





cprojf:
cprojl:
cproj:
crealf:
creall:
creal:
	ret





fmaf:
	fmadd s0, s1, s2
	ret





fma:
	fmadd d0, d1, d2
	ret





fmaxf:
	fmaxnm s0, s1
	ret





fmax:
	fmaxnm d0, d1
	ret





fmaxl:
	stp x29, x30, [sp, -0x30]!
	mov x29, sp
	str q0, [sp, 0x10]
	str q1, [sp, 0x20]
	bl __getf2

	ldr q2, [sp, 0x10]
	tbz w0, #0x1F, .first

	ldr q2, [sp, 0x20]

.first:
	mov v0.16b, v2.16b
	ldp x29, x30, [sp], 0x30
	ret





fminf:
	fminnm s0, s1
	ret





fminl:
	stp x29, x30, [sp, -0x30]!
	mov x29, sp
	str q0, [sp, 0x10]
	str q1, [sp, 0x20]
	bl __letf2

	ldr q2, [sp, 0x10]
	tbz w0, #0x1F, .first

	ldr q2, [sp, 0x20]

.first:
	mov v0.16b, v2.16b
	ldp x29, x30, [sp], 0x30
	ret





fmin:
	fminnm d0, d1
	ret





imaxabs:
llabs:
	cmp x0, 0
	csneg x0, ge
	ret





llrintf:
lrintf:
	frintx s0
	fcvtzs x0, s0
	ret





llrint:
lrint:
	frintx d0
	fcvtzs x0, d0
	ret





llroundf:
lroundf:
	fcvtas x0, s0
	ret





llround:
lround:
	fcvtas x0, d0
	ret





nearbyintf:
	frinti s0
	ret





nearbyint:
	frinti d0
	ret





rintf:
	frintx s0
	ret





rint:
	frintx d0
	ret





roundf:
	frinta s0
	ret





round:
	frinta d0
	ret





truncf:
	frintz s0
	ret





trunc:
	frintz d0
	ret
