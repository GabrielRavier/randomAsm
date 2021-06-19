.include "standard.inc"

	.text

START_FUNC RGBtoHSL
	and w1, w1, 0xFF
	and w2, w2, 0xFF

	cmp w1, w2
	and w0, w0, 0xFF
	csel w10, w1, w2, ge

	cmp w0, w10
	csel w9, w0, w10, ge

	cmp w1, w2
	csel w6, w1, w2, le

	cmp w6, w0
	csel w6, w6, w0, le

	cmp w9, w6
	beq .LRTHScmin_cmax_eq

	add w8, w9, w6
	sub w6, w9, w6

	mov w11, 512
	sub w11, w11, w8
	asr w12, w8, 1
	lsl w7, w6, 8
	sub w7, w7, w6
	strb w12, [x5]

	tst x12, 128
	csel w8, w11, w8, ne

	sdiv w5, w7, w8
	strb w5, [x4]

	cmp w0, w10
	bge .LRTHSge

	cmp w1, w9
	beq .LRTHSr_cmax_eq

	sub w0, w0, w1
	lsl w1, w0, 8
	sub w0, w1, w0
	sdiv w0, w0, w6
	add w0, w0, 1024

.LRTHSfinish:
	mov w1, 0xAAAB
	movk w1, 0x2AAA, lsl 16
	smull x1, w0, w1
	lsr x1, x1, 32
	sub w0, w1, w0, asr 31
	strb w0, [x3]
	ret

LABEL_ALIGNED .LRTHSge
	sub w1, w1, w2
	lsl w0, w1, 8
	sub w0, w0, w1
	sdiv w0, w0, w6
	b .LRTHSfinish

LABEL_ALIGNED .LRTHScmin_cmax_eq
	strb wzr, [x4]
	strb wzr, [x3]
	strb w0, [x5]
	ret

LABEL_ALIGNED .LRTHSr_cmax_eq
	sub w2, w2, w0
	lsl w0, w2, 8
	sub w0, w0, w2
	sdiv w0, w0, w6
	add w0, w0, 512
	b .LRTHSfinish
END_FUNC RGBtoHSL





START_FUNC RGBtoHCT
	and w1, w1, 0xFF
	and w2, w2, 0xFF
	and w0, w0, 0xFF

	stp x29, x30, [sp, -48]!
	mov x29, sp

	cmp w1, w2
	csel w6, w1, w2, ge

	stp x19, x20, [sp, 16]

	cmp w6, w0
	csel w20, w6, w0, ge

	cmp w1, w2
	csel w19, w1, w2, le

	stp x21, x22, [sp, 32]

	cmp w19, w0
	mov x22, x4
	csel w19, w19, w0, le
	mov x21, x5
	bl RGBtoHSL

	sub w1, w20, w19
	mov w0, 0
	and w1, w1, 0xFF
	strb w1, [x22]
	cmp w1, 0xFF
	beq .LRTHCfinish

	lsl w0, w19, 8
	and w1, w19, 0xFF
	sub w0, w0, w19
	sub w1, w1, w20
	udiv w0, w0, w1
	and w0, w0, 0xFF

.LRTHCfinish:
	strb w0, [x21]
	ldp x19, x20, [sp, 16]
	ldp x21, x22, [sp, 32]
	ldp x29, x30, [sp], 48
	ret
END_FUNC RGBtoHCT





START_FUNC HueToLetter
	sub w2, w0, 11
	mov w1, w0
	mov w0, 'R'
	cmp w2, 232
	bhi .LHreturn

	mov w0, 'O'
	cmp w2, 20
	bhi .LHcontinue

.LHreturn:
	ret

LABEL_ALIGNED .LHcontinue
.macro H_make_one val1, val2, val3

	sub w2, w1, \val1
	mov w0, \val2
	cmp w2, \val3
	bls .LHreturn

.endm
	H_make_one 32, 'Y', 20
	H_make_one 74, 'G', 21
	H_make_one 96, 'T', 20
	H_make_one 117, 'C', 20
	H_make_one 138, 'A', 20
	H_make_one 159, 'B', 21
	H_make_one 181, 'V', 20

	sub w1, w1, 202
	mov w0, 77
	cmp w1, 21
	mov w1, 70
	csel w0, w0, w1, cc
	ret
END_FUNC HueToLetter





START_FUNC lightnessToLetter
	mov w1, w0

.macro L_make_one val1, val2

	mov w0, \val1
	cmp w1, \val2
	ble .LLreturn

.endm

	L_make_one ' ', 15

	mov w0, '.'
	cmp w1, 47
	bgt .LLcontinue

.LLreturn:
	ret

LABEL_ALIGNED .LLcontinue
	L_make_one ':', 79
	L_make_one '-', 111
	L_make_one '!', 143
	L_make_one '*', 175
	L_make_one '+', 207

	cmp w1, 240
	mov w0, '='
	mov w1, '#'
	csel w0, w0, w1, lt
	ret
END_FUNC lightnessToLetter





	.section .rodata
	.p2align 2
.LapplyDither_pattern:
	.word 0, 8, 2, 10, 12, 4, 14, 6, 3, 11, 1, 9, 15, 7, 13, 5

	.text

START_FUNC applyDither
	and w8, w2, 3
	addr_to_reg x9, .LapplyDither_pattern
	bfi w8, w3, 2, 2
	ldr w8, [x9, w8, uxtw 2]
	add w8, w8, w8, lsl 4
	sub w8, w8, 128
	mul w8, w8, w1
	add w9, w8, 255
	cmp w8, 0
	csel w8, w9, w8, lt
	add w8, w0, w8, asr 8
	tbz w4, 0, .LAnot_w8

	and w0, w8, 0xFF
	ret

.LAnot_w8:
	cmp w8, 0xFF
	mov w9, 0xFF
	csel w8, w8, w9, lt
	bic w0, w8, w8, asr 31
	ret
END_FUNC applyDither





START_FUNC RGBtoLetter
	sub sp, sp, 96
	stp x29, x30, [sp, 32]
	stp x24, x23, [sp, 48]
	stp x22, x21, [sp, 64]
	stp x20, x19, [sp, 80]
	add x29, sp, 32

	and w8, w3, 0xFF
	mov w21, w7
	mov w19, w5
	mov w20, w4
	mov w22, w2
	mov w23, w1
	cmp w8, 0xFF
	mov w24, w0
	b.eq .LRTLafter_mul_divs

	and w9, w24, 0xFF
	and w11, w23, 0xFF
	and w12, w22, 0xFF
	mov w10, 0x8081
	mul w9, w8, w9
	mul w11, w8, w11
	mul w8, w8, w12
	mul w9, w9, w10
	mul w11, w11, w10
	mul w8, w8, w10
	lsr w24, w9, 23
	lsr w23, w11, 23
	lsr w22, w8, 23

.LRTLafter_mul_divs:
	tbz w6, 0, .LRTLno_dither

	sub x3, x29, 4
	sub x4, x29, 8
	sub x5, x29, 12
	mov w0, w24
	mov w1, w23
	mov w2, w22
	bl RGBtoHCT

	and w9, w23, 0xFF
	and w10, w24, 0xFF
	cmp w10, w9
	and w8, w2, 0xFF
	csel w11, w23, w24, lo

	cmp w8, w11, uxtb
	csel w11, w22, w11, hi

	cmp w9, w10
	csel w10, w23, w24, lo

	cmp w8, w10, uxtb
	and w9, w11, 0xFF
	csel w8, w22, w10, lo
	add w8, w9, w8, uxtb
	lsr w22, w8, 1
	tbz w21, 0, .LRTLafter_invert

	ldurb w8, [x29, -12]
	eor w22, w22, 0xFF
	mvn w8, w8
	sturb w8, [x29, -12]

.LRTLafter_invert:
	ldurb w0, [x29, -8]
	mov w1, 0xFE
	mov w2, w20
	mov w3, 19
	mov w4, wzr
	bl applyDither

	cmp w0, 128
	b.lt .LRTLdo_lt_128

	ldurb w0, [x29, -4]
	mov w1, 21
	mov w2, w20
	mov w3, w19
	mov w4, 1
	bl applyDither
	bl HueToLetter

	mov w21, w0
	add w2, w20, 2
	add w3, w19, 2
	mov w1, 64
	mov w0, w22
	mov w4, wzr
	bl applyDither

	cmp w0, 80
	cset w8, lt
	add w0, w21, w8, lsl 5

.macro RGBtoLetter_make_return

	ldp x20, x19, [sp, 80]
	ldp x22, x21, [sp, 64]
	ldp x24, x23, [sp, 48]
	ldp x29, x30, [sp, 32]
	add sp, sp, 96
	ret

.endm

	RGBtoLetter_make_return

.LRTLno_dither:
	mov w0, w24
	mov w1, w23
	mov w2, w22
	add x3, sp, 16
	add x4, sp, 12
	add x5, sp, 8
	bl RGBtoHSL
	tbz w21, 0, .LRTLafter_invert2

	ldrb w8, [sp, 8]
	mvn w8, w8
	strb w8, [sp, 8]

.LRTLafter_invert2:
	ldrb w0, [sp, 16]
	bl HueToLetter
	ldrb w8, [sp, 8]
	sub w9, w8, 24
	and w9, w9, 0xFF
	cmp w9, 208
	b.hi .LRTL_do_lightness_to_letter

	ldrb w9, [sp, 12]
	cmp w9, 63
	b.ls .LRTL_do_lightness_to_letter

	sxtb w8, w8
	add w9, w0, 32
	cmp w8, 0
	csel w0, w9, w0, ge
	RGBtoLetter_make_return

.LRTLdo_lt_128:
	mov w0, w22
	mov w1, 31
	mov w2, w20
	mov w3, w19
	mov w4, wzr
	bl applyDither
	b .LRTL_do_lightness_to_letter2

.LRTL_do_lightness_to_letter:
	mov w0, w8

.LRTL_do_lightness_to_letter2:
	bl lightnessToLetter
	RGBtoLetter_make_return
END_FUNC RGBtoLetter





START_FUNC getICCUint16
	add x8, x2, 2
	cmp x8, x1
	b.ls .LGIU16continue

	mov w0, wzr
	ret

.LGIU16continue:
	ldrh w8, [x0, x2]
	lsl w8, w8, 16
	rev w0, w8
	ret
END_FUNC getICCUint16





START_FUNC getICCUint32
START_FUNC getICCInt32
	add x8, x2, 2
	cmp x8, x1
	b.ls .LGIU32continue

	mov w0, wzr
	ret

.LGIU32continue:
	ldr w8, [x0, x2]
	rev w0, w8
	ret
END_FUNC getICCUint32
END_FUNC getICCInt32





.macro make_fixed16 name, instr, func

START_FUNC \name
	stp x29, x30, [sp, -16]!
	mov x29, sp
	bl \func
	\instr d0, w0, 16
	ldp x29, x30, [sp], 16
	fcvt s0, d0
	ret
END_FUNC \name

.endm

	make_fixed16 getICC15Fixed16, scvtf, getICCInt32
	make_fixed16 getICC16Fixed16, ucvtf, getICCUint32
