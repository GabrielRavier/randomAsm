.include "standard.inc"

	.text

START_FUNC cabsf
	fmul s1, s1, s1
	fmadd s0, s0, s0, s1
	fsqrt s0, s0
	ret
END_FUNC cabsf





START_FUNC cabsl
	sub sp, sp, 48
	stp x29, x30, [sp, 32]
	add x29, sp, 32
	str q1, [sp, 16]

	bl __multf3
	str q0, [sp]

	ldr q0, [sp, 16]
	mov v1.16b, v0.16b
	bl __multf3

	mov v1.16b, v0.16b
	ldr q0, [sp]
	bl __addtf3

	ldp x29, x30, [sp, 32]
	add sp, sp, 48
	b sqrtl
END_FUNC cabsl





START_FUNC cabs
	fmul d1, d1, d1
	fmadd d0, d0, d0, d1
	fsqrt d0, d0
	ret
END_FUNC cabs





START_FUNC cargf
	fmov s2, s0
	fmov s0, s1
	fmov s1, s2
	b atan2f
END_FUNC cargf





START_FUNC cargl
	mov v2.16b, v0.16b
	mov v0.16b, v1.16b
	mov v1.16b, v2.16b
	b atan2l
END_FUNC cargl





START_FUNC carg
	fmov d2, d0
	fmov d0, d1
	fmov d1, d2
	b atan2
END_FUNC carg





START_FUNC cimagf
	fmov s0, s1
	ret
END_FUNC cimagf





START_FUNC cimagl
	mov v0.16b, v1.16b
	ret
END_FUNC cimagl





START_FUNC cimag
	fmov d0, d1
	ret
END_FUNC cimag





START_FUNC conjf
	fneg s1, s1
	ret
END_FUNC conjf





START_FUNC conjl
	str q1, [sp, -16]!
	ldrb w8, [sp, 15]
	eor w8, w8, 0x80
	strb w8, [sp, 15]
	ldr q1, [sp], 16
	ret
END_FUNC conjl





START_FUNC conj
	fneg d1, d1
	ret
END_FUNC conj





START_FUNC copysignf
	movi v2.2s, 0x80, lsl 24
	bit v0.8b, v1.8b, v2.8b
	ret
END_FUNC copysignf





START_FUNC copysignl
	stp q0, q1, [sp, -32]!
	ldrb w8, [sp, 15]
	ldrb w9, [sp, 31]
	bfxil w9, w8, 0, 7
	strb w9, [sp, 15]
	ldr q0, [sp], 32
	ret
END_FUNC copysignl





START_FUNC copysign
	mov x0, 0x8000000000000000
	fmov d2, x0
	bit v0.8b, v1.8b, v2.8b
	ret
END_FUNC copysign





	make_empty_func cprojf
	make_empty_func cprojl
	make_empty_func cproj
	make_empty_func crealf
	make_empty_func creall
	make_empty_func creal





START_FUNC fmaf
	fmadd s0, s0, s1, s2
	ret
END_FUNC fmaf





START_FUNC fma
	fmadd d0, d0, d1, d2
	ret
END_FUNC fma





.macro make_fmaxmin name, op, reg0, reg1

START_FUNC \name
	\op \reg0, \reg0, \reg1
	ret
END_FUNC \name

.endm

	make_fmaxmin fmaxf, fmaxnm, s0, s1





START_FUNC fmaxl
	stp x29, x30, [sp, -48]!
	mov x29, sp
	str q0, [sp, 16]
	str q1, [sp, 32]
	bl __getf2

	ldr q2, [sp, 16]
	tbz w0, #0x1F, .LMXfirst

	ldr q2, [sp, 32]

.LMXfirst:
	mov v0.16b, v2.16b
	ldp x29, x30, [sp], 48
	ret
END_FUNC fmaxl





	make_fmaxmin fmax, fmaxnm, d0, d1
	make_fmaxmin fminf, fminnm, s0, s1





START_FUNC fminl
	stp x29, x30, [sp, -48]!
	mov x29, sp
	str q0, [sp, 16]
	str q1, [sp, 32]
	bl __letf2

	ldr q2, [sp, 16]
	tbz w0, #0x1F, .LMNfirst

	ldr q2, [sp, 32]

.LMNfirst:
	mov v0.16b, v2.16b
	ldp x29, x30, [sp], 48
	ret
END_FUNC fminl





	make_fmaxmin fmin, fminnm, d0, d1





START_FUNC imaxabs
START_FUNC llabs
	cmp x0, 0
	csneg x0, x0, x0, ge
	ret
END_FUNC imaxabs
END_FUNC llabs





.macro make_irint name, regf0

START_FUNC \name
	frintx \regf0, \regf0
	fcvtzs x0, \regf0
	ret
END_FUNC \name

.endm

	make_irint llrintf, s0
	make_irint llrint, d0





.macro make_iround name, regf0

START_FUNC \name
	fcvtas x0, \regf0
	ret
END_FUNC \name

.endm

	make_iround llroundf, s0
	make_iround llround, d0
	make_irint lrintf, s0
	make_irint lrint, d0
	make_iround lroundf, s0
	make_iround lround, d0





.macro make_nearbyint name, regf0

START_FUNC \name
	frinti \regf0, \regf0
	ret
END_FUNC \name

.endm

	make_nearbyint nearbyintf, s0
	make_nearbyint nearbyint, d0





.macro make_frint name, reg0

START_FUNC \name
	frintx \reg0, \reg0
	ret
END_FUNC \name

.endm

	make_frint rintf, s0
	make_frint rint, d0





.macro make_round name, reg0

START_FUNC \name
	frinta \reg0, \reg0
	ret
END_FUNC \name

.endm

	make_round roundf, s0
	make_round round, d0





.macro make_trunc name, reg0

START_FUNC \name
	frintz \reg0, \reg0
	ret
END_FUNC \name

.endm

	make_trunc truncf, s0
	make_trunc trunc, d0
