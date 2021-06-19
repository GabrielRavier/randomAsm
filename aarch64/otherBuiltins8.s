.include "standard.inc"

	.section .rodata
	.p2align 4
.Lldbl_plus_inf:
	.xword 0, 0x7FFF000000000000

.Lldbl_min_normal:
	.xword 0, 0x0001000000000000

.Lldbl_0:
	.xword 0, 0

	.text

.macro make_isfinite name, regi0, regf0, regf1, val

START_FUNC \name
	fabs \regf0, \regf0
	mov \regi0, \val
	fmov \regf1, \regi0
	fcmp \regf0, \regf1
	cset w0, hi
	eor w0, w0, 1
	ret
END_FUNC \name

.endm

	make_isfinite isfinite, x0, d0, d1, 0x7FEFFFFFFFFFFFFF





START_FUNC isfinitel
	sub sp, sp, 80
	stp x29, x30, [sp, 48]
	str x19, [sp, 64]

	add x29, sp, 48
	stur q0, [x29, -16]
	ldurb w8, [x29, -1]
	and w8, w8, 0x7F
	sturb w8, [x29, -1]

	adrp x8, .Lldbl_plus_inf
	ldur q0, [x29, -16]
	ldr q1, [x8, :lo12:.Lldbl_plus_inf]

	stp q1, q0, [sp]
	bl __eqtf2
	ldp q1, q0, [sp]

	cmp w0, 0
	cset w19, ne
	bl __unordtf2

	cmp w0, 0
	cset w8, eq
	and w0, w8, w19

	ldr x19, [sp, 64]
	ldp x29, x30, [sp, 48]
	add sp, sp, 80
	ret
END_FUNC isfinitel





	make_isfinite isfinitef, w0, s0, s1, 0x7F7FFFFF





START_FUNC isnormal
	fabs d0, d0
	mov x0, 0x7FEFFFFFFFFFFFFF
	fmov d2, x0

	mov x1, 0x10000000000000
	fmov d1, x0
	fcmp d0, d2
	fccmp d0, d1, 1, ls
	cset w0, lt
	eor w0, w0, 1
	ret
END_FUNC isnormal





START_FUNC isnormall
	sub sp, sp, 64
	stp x29, x30, [sp, 32]
	stp x20, x19, [sp, 48]
	add x29, sp, 32

	mov v1.16b, v0.16b
	str q0, [sp]
	bl __unordtf2
	ldr q0, [sp]

	cmp w0, 0
	cset w19, eq

	str q0, [sp, 16]
	ldrb w8, [sp, 31]
	and w8, w8, 0x7F
	strb w8, [sp, 31]

	adrp x8, .Lldbl_plus_inf
	ldr q0, [sp, 16]
	ldr q1, [x8, :lo12:.Lldbl_plus_inf]
	str q0, [sp]
	bl __getf2

	adrp x8, .Lldbl_min_normal
	ldr q1, [x8, :lo12:.Lldbl_min_normal]
	ldr q0, [sp]
	cmp w0, 0
	cset w20, lt
	bl __lttf2

	and w9, w19, w20
	ldp x20, x19, [sp, 48]
	ldp x29, x30, [sp, 32]

	cmp w0, 0
	cset w8, ge
	and w0, w8, w9

	add sp, sp, 64
	ret
END_FUNC isnormall





START_FUNC isnormalf
	fabs s0, s0
	mov w0, 0x7F7FFFFF
	fmov s1, w0

	movi v2.2s, 0x80, lsl 16
	fcmp s0, s1
	fccmp s0, s2, 1, ls
	cset w0, lt
	eor w0, w0, 1
	ret
END_FUNC isnormalf





START_FUNC isinf_sign
	fmov x8, d0
	mov x9, 0x7FF0000000000000
	fabs d1, d0

	cmp x8, 0
	mov w8, -1
	fmov d0, x9
	cneg w8, w8, ge

	fcmp d1, d0
	csel w0, w8, wzr, eq
	ret
END_FUNC isinf_sign





START_FUNC isinf_signl
	sub sp, sp, 64
	stp x29, x30, [sp, 32]
	str x19, [sp, 48]
	add x29, sp, 32

	stp q0, q0, [sp]
	ldrb w8, [sp, 15]
	and w8, w8, 0x7F
	strb w8, [sp, 15]

	ldr x8, [sp, 24]
	ldr q2, [sp]
	cmp x8, 0
	mov w8, -1
	cneg w19, w8, ge

	adrp x8, .Lldbl_plus_inf
	ldr q1, [x8, :lo12:.Lldbl_plus_inf]
	mov v0.16b, v2.16b
	bl __eqtf2

	cmp w0, 0
	csel w0, w19, wzr, eq

	ldr x19, [sp, 48]
	ldp x29, x30, [sp, 32]
	add sp, sp, 64
	ret
END_FUNC isinf_signl





START_FUNC isinf_signf
	fmov w8, s0
	mov w9, 0x7F800000
	fabs s1, s0
	asr w8, w8, 31
	fmov s0, w9
	orr w8, w8, 1

	fcmp s1, s0
	csel w0, w8, wzr, eq
	ret
END_FUNC isinf_signf





START_FUNC fpclassify
	fabs d1, d0
	fcmp d1, d1
	bvs .LFCgot_nan

	mov x0, 0x7FEFFFFFFFFFFFFF
	fmov d2, x0
	fcmp d1, d2
	ble .LFCnot_inf

	mov w0, 1

.LFCreturn:
	ret

LABEL_ALIGNED .LFCnot_inf
	mov x0, 0x10000000000000
	fmov d2, x0
	mov w0, 4
	fcmpe d1, d2
	bge .LFCreturn

	fcmp d0, 0.0
	cset w0, ne
	add w0, w0, 2
	ret

LABEL_ALIGNED .LFCgot_nan
	mov w0, 0
	ret
END_FUNC fpclassify





START_FUNC fpclassifyl
	sub sp, sp, 48
	stp x29, x30, [sp, 32]
	add x29, sp, 32

.macro fpclassifyl_make_return

	ldp x29, x30, [sp, 32]
	add sp, sp, 48
	ret

.endm

	adrp x8, .Lldbl_0
	ldr q1, [x8, :lo12:.Lldbl_0]
	str q0, [sp]
	bl __netf2
	cbnz w0, .LFCLnot_0

	mov w0, 2
	fpclassifyl_make_return

.LFCLnot_0:
	ldr q0, [sp]
	mov v1.16b, v0.16b
	bl __unordtf2
	cbnz w0, .LFCLgot_nan

	ldr q0, [sp]
	str q0, [sp, 16]
	ldrb w8, [sp, 31]
	and w8, w8, 0x7F
	strb w8, [sp, 31]

	adrp x8, .Lldbl_plus_inf
	ldr q0, [sp, 16]
	ldr q1, [x8, :lo12:.Lldbl_plus_inf]
	str q0, [sp]
	bl __eqtf2
	cbnz w0, .LFCLnot_inf

	mov w0, 1
	fpclassifyl_make_return

.LFCLnot_inf:
	adrp x8, .Lldbl_min_normal
	ldr q1, [x8, :lo12:.Lldbl_min_normal]
	ldr q0, [sp]
	bl __lttf2

	cmp w0, 0
	mov w8, 3
	cinc w0, w8, ge
	fpclassifyl_make_return

.LFCLgot_nan:
	mov w0, wzr
	fpclassifyl_make_return

END_FUNC fpclassifyl





START_FUNC fpclassifyf
	fabs s1, s0
	fcmp s1, s1
	bvs .LFCFgot_nan

	mov w0, 0x7F7FFFFF
	fmov s2, w0
	fcmp s1, s2
	ble .LFCFnot_inf

	mov w0, 1

.LFCFreturn:
	ret

LABEL_ALIGNED .LFCFnot_inf
	movi v2.2s, 0x80, lsl 16
	mov w0, 4
	fcmpe s1, s2
	bge .LFCFreturn

	fcmp s0, 0.0
	cset w0, ne
	add w0, w0, 2
	ret

LABEL_ALIGNED .LFCFgot_nan
	mov w0, 0
	ret
END_FUNC fpclassifyf
