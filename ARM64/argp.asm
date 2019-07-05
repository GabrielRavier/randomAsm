	.text

__argp_usage:
	adrp x1, stderr
	mov w2, 0x106
	ldr x1, [x1, #:lo12:stderr]
	b __argp_state_help





__option_is_short:
	ldr w1, [x0, 24]
	tbnz x1, 3, .ret0

	ldr w0, [x0, 8]
	and w2, w1, 8

	sub w1, w0, #1
	cmp w1, 0xFE
	bhi .retW2

	stp x29, x30, [sp, -16]!
	mov x29, sp

	bl isprint
	cmp w0, 0
	cset w2, ne

	mov w0, w2
	ldp x29, x30, [sp], 16
	ret

.ret0:
	mov w2, 0

.retW2:
	mov w0, w2
	ret





__option_is_end:
	ldr w1, [x0, 8]
	cbnz w1, .ret0

	ldr x2, [x0]
	cbz x2, .continue

.retW1:
	mov w0, w1
	ret

.ret0:
	mov w0, 0
	ret

.continue:
	ldr x2, [x0, 32]
	cbnz x2, .retW1

	ldr w0, [x0, 40]
	cmp w0, 0
	cset w1, eq
	b .retW1
