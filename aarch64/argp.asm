.include "standard.inc"

	.text

START_FUNC __argp_usage
	adrp x1, stderr
	mov w2, 0x106
	ldr x1, [x1, #:lo12:stderr]
	b __argp_state_help
END_FUNC __argp_usage





START_FUNC __option_is_short
	ldr w1, [x0, 24]
	tbnz x1, 3, .LSret0

	ldr w0, [x0, 8]
	and w2, w1, 8

	sub w1, w0, #1
	cmp w1, 0xFE
	bhi .LSretW2

	stp x29, x30, [sp, -16]!
	mov x29, sp

	bl isprint
	cmp w0, 0
	cset w2, ne

	mov w0, w2
	ldp x29, x30, [sp], 16
	ret

.LSret0:
	mov w2, 0

.LSretW2:
	mov w0, w2
	ret
END_FUNC __option_is_short





START_FUNC __option_is_end
	ldr w1, [x0, 8]
	cbnz w1, .LEret0

	ldr x2, [x0]
	cbz x2, .LEcontinue

.LEretW1:
	mov w0, w1
	ret

.LEret0:
	mov w0, 0
	ret

.LEcontinue:
	ldr x2, [x0, 32]
	cbnz x2, .LEretW1

	ldr w0, [x0, 40]
	cmp w0, 0
	cset w1, eq
	b .LEretW1
END_FUNC __option_is_end
