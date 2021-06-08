.include "standard.inc"

	.text

START_FUNC cabsf
	fmul s1
	fmadd s0, s1
	fsqrt s0
	ret
END_FUNC cabsf





START_FUNC cabs
	fmul d1
	fmadd d0, d1
	fsqrt d0
	ret
END_FUNC cabs





START_FUNC cargf
	fmov s2, s1
	fmov s1, s0
	fmov s0, s2
	b atan2f
END_FUNC cargf





START_FUNC cargl
	mov v2.16b, v1.16b
	mov v1.16b, v0.16b
	mov v0.16b, v2.16b
	b atan2l
END_FUNC cargl





START_FUNC carg
	fmov d2, d1
	fmov d1, d0
	fmov d0, d2
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
	fneg s1
	ret
END_FUNC conjf





START_FUNC conjl
	fmov x2, d1
	fmov x3, v1.d[1]
	mov x0, x2

	fmov d1, x0
	eor x1, x3, 0x8000000000000000
	fmov v1.d[1], x1
	ret
END_FUNC conjl





START_FUNC conj
	fneg d1
	ret
END_FUNC conj





START_FUNC copysignf
	movi v2.2s, 0x80, lsl 24
	bit v0.8b, v1.8b, v2.8b
	ret
END_FUNC copysignf





START_FUNC copysignl
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
END_FUNC copysignl





START_FUNC copysign
	mov x0, 0x8000000000000000
	fmov d2, x0
	bit v0.8b, v1.8b, v2.8b
	ret
END_FUNC copysign





START_FUNC cprojf
START_FUNC cprojl
START_FUNC cproj
START_FUNC crealf
START_FUNC creall
START_FUNC creal
	ret
END_FUNC cprojf
END_FUNC cprojl
END_FUNC cproj
END_FUNC crealf
END_FUNC creall
END_FUNC creal





START_FUNC fmaf
	fmadd s0, s1, s2
	ret
END_FUNC fmaf





START_FUNC fma
	fmadd d0, d1, d2
	ret
END_FUNC fma





START_FUNC fmaxf
	fmaxnm s0, s1
	ret
END_FUNC fmaxf





START_FUNC fmax
	fmaxnm d0, d1
	ret
END_FUNC fmax





START_FUNC fmaxl
	stp x29, x30, [sp, -0x30]!
	mov x29, sp
	str q0, [sp, 0x10]
	str q1, [sp, 0x20]
	bl __getf2

	ldr q2, [sp, 0x10]
	tbz w0, #0x1F, .LMXfirst

	ldr q2, [sp, 0x20]

.LMXfirst:
	mov v0.16b, v2.16b
	ldp x29, x30, [sp], 0x30
	ret
END_FUNC fmaxl





START_FUNC fminf
	fminnm s0, s1
	ret
END_FUNC fminf





START_FUNC fminl
	stp x29, x30, [sp, -0x30]!
	mov x29, sp
	str q0, [sp, 0x10]
	str q1, [sp, 0x20]
	bl __letf2

	ldr q2, [sp, 0x10]
	tbz w0, #0x1F, .LMNfirst

	ldr q2, [sp, 0x20]

.LMNfirst:
	mov v0.16b, v2.16b
	ldp x29, x30, [sp], 0x30
	ret
END_FUNC fminl





START_FUNC fmin
	fminnm d0, d1
	ret
END_FUNC fmin





START_FUNC imaxabs
START_FUNC llabs
	cmp x0, 0
	csneg x0, ge
	ret
END_FUNC imaxabs
END_FUNC llabs





START_FUNC llrintf
START_FUNC lrintf
	frintx s0
	fcvtzs x0, s0
	ret
END_FUNC llrintf
END_FUNC lrintf





START_FUNC llrint
START_FUNC lrint
	frintx d0
	fcvtzs x0, d0
	ret
END_FUNC llrint
END_FUNC lrint





START_FUNC llroundf
START_FUNC lroundf
	fcvtas x0, s0
	ret
END_FUNC llroundf
END_FUNC lroundf





START_FUNC llround
START_FUNC lround
	fcvtas x0, d0
	ret
END_FUNC llround
END_FUNC lround





START_FUNC nearbyintf
	frinti s0
	ret
END_FUNC nearbyintf





START_FUNC nearbyint
	frinti d0
	ret
END_FUNC nearbyint





START_FUNC rintf
	frintx s0
	ret
END_FUNC rintf





START_FUNC rint
	frintx d0
	ret
END_FUNC rint





START_FUNC roundf
	frinta s0
	ret
END_FUNC roundf





START_FUNC round
	frinta d0
	ret
END_FUNC round





START_FUNC truncf
	frintz s0
	ret
END_FUNC truncf





START_FUNC trunc
	frintz d0
	ret
END_FUNC trunc
