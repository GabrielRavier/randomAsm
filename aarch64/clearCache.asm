.include "standard.inc"

	.text

START_FUNC clear_cache
.if 0
	mrs x4, ctr_el0

	ubfx w2, w4, 16, 4
	mov w3, 4
	lsl w3, w2
	sxtw x3, w3

	neg x2, x3
	and x2, x0, x2
	cmp x1, x2
	bls .LafterLoop

.Lloop:
	dc cvau, x2
	add x2, x3

	cmp x1, x2
	bhi .Lloop

.LafterLoop:
	dsb ish

	and w4, 0xF
	mov w2, 4
	lsl w2, w4
	sxtw x2, w2

	neg x3, x2
	and x0, x3
	cmp x1, x0
	bls .LafterLoop2

.Lloop2:
	ic ivau, x0
	add x0, x2

	cmp x1, x0
	bhi .Lloop2

.LafterLoop2:
	isb sy
	ret
.Lelse
	adrp x3, .Lanchor
	ldr w2, [x3, #:lo12:.Lanchor]
	cbnz w2, .Lafter

	mrs x4, ctr_el0
	mov w2, w4
	str w4, [x3, #:lo12:.Lanchor]

.Lafter:
	ubfx x4, x2, 16, 4
	mov w3, 4
	and w5, w2, 0xF
	lsl w4, w3, w4

	sub w2, w4, #1
	bic x2, x0, x2

	lsl w3, w5
	cmp x2, x1
	sxtw x4, w3
	bcs .LafterLoop

.Lloop:
	dc cvau, x2
	add x2, x4
	cmp x1, x2
	bhi .Lloop

.LafterLoop:
	dsb ish

	sub w2, w3, #1
	bic x0, x2

	sxtw x2, w3
	cmp x1, x0
	bls .LafterLoop2

.Lloop2:
	ic ivau, x0
	add x0, x2
	cmp x1, x0
	bhi .Lloop2

.LafterLoop2:
	dmb ish
	isb
	ret

.Lanchor:
.endif
END_FUNC clear_cache
