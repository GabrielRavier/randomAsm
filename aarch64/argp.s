.include "standard.inc"

	.text

START_FUNC __argp_usage
	adrp x1, stderr
	mov w2, 0x106
	ldr x1, [x1, #:lo12:stderr]
	b __argp_state_help
END_FUNC __argp_usage





START_FUNC __option_is_short
	stp x29, x30, [sp, -16]!
	mov x29, sp
	ldrb w8, [x0, 24]
	tbnz w8, 3, .LSret0

	ldr w0, [x0, 8]
	sub w8, w0, 1
	cmp w8, 0xFE
	b.hi .LSret0

	bl isprint
	cmp w0, 0
	cset w0, ne
	ldp x29, x30, [sp], 16
	ret

.LSret0:
	mov w0, wzr
	ldp x29, x30, [sp], 16
	ret
END_FUNC __option_is_short





START_FUNC __option_is_end
	mov x1, x0
	ldr w0, [x0, 8]
	cbnz w0, .LEret0

	ldr x2, [x1]
	cbz x2, .LEfinish

.LEret:
	ret

LABEL_ALIGNED .LEret0
	mov w0, 0
	ret

LABEL_ALIGNED .LEfinish
	ldr x2, [x1, 32]
	cbnz x2, .LEret

	ldr w0, [x1, 40]
	cmp w0, 0
	cset w0, eq
	ret
END_FUNC __option_is_end
