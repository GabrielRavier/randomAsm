.include "standard.inc"

	.text

START_FUNC __letf2
START_FUNC __cmptf2
START_FUNC __eqtf2
START_FUNC __lttf2
START_FUNC __netf2
	fmov x1, v0.d[1]
	fmov x0, d0
	fmov x6, d1
	fmov x7, v1.d[1]
	and x4, x1, 0x7FFFFFFFFFFFFFFF

	mov x2, x1
	mov x5, x6
	mov x1, x0
	mov x3, x7

	mov x0, 0x7FFF000000000000
	cmp x4, x0
	mov w4, 1
	bhi .Lhi
	beq .LdoCbnz2

	mov w4, 0

.Lhi:
	and x7, x3, 0x7FFFFFFFFFFFFFFF

	mov x6, 0x7FFF000000000000
	mov w0, 1
	cmp x7, x6
	bhi .Lcontinue
	beq .LdoCbnz

	mov w0, 0

.Lcontinue:
	orr w4, w0
	mov w0, 1
	tbnz x4, 0, .Lreturn

	orr x6, x2, x3
	orr x4, x1, x5
	and x6, 0x7FFFFFFFFFFFFFFF

	mov w0, 0
	orr x4, x6
	cbz x4, .Lreturn

	tst x2, x3
	bmi .LcheckGt

	cmp x3, x2
	bgt .LretMin1
	beq .LcheckLess

.Lfinish:
	eor x0, x1, x5
	eor x1, x2, x3
	orr x1, x0, x1

	cmp x1, 0
	cset w0, ne

.Lreturn:
	ret

.LdoCbnz:
	cbnz x5, .Lcontinue

	mov w0, 0
	b .Lcontinue

.LdoCbnz2:
	cbnz x1, .Lhi

	mov w4, 0
	b .Lhi

.LcheckGt:
	cmp x2, x3
	bgt .LretMin1
	bne .Lfinish

	cmp x1, x5
	bls .Lfinish

.LretMin1:
	mov w0, -1
	ret

.LcheckLess:
	cmp x5, x1
	bls .Lfinish
	b .LretMin1
END_FUNC __letf2
END_FUNC __cmptf2
END_FUNC __eqtf2
END_FUNC __lttf2
END_FUNC __netf2





START_FUNC __getf2
START_FUNC __gttf2
	fmov x1, v0.d[1]
	fmov x0, d0
	fmov x6, d1
	fmov x7, v1.d[1]
	and x4, x1, 0x7FFFFFFFFFFFFFFF

	mov x2, x1
	mov x5, x6
	mov x1, x0
	mov x3, x7

	mov x0, 0x7FFF000000000000
	cmp x4, x0
	mov w4, 1
	bhi .LGhi
	beq .LGdoCbnz2

	mov w4, 0

.LGhi:
	and x7, x3, 0x7FFFFFFFFFFFFFFF

	mov x6, 0x7FFF000000000000
	mov w0, 1
	cmp x7, x6
	bhi .LGcontinue
	beq .LGdoCbnz

	mov w0, 0

.LGcontinue:
	orr w4, w0
	mov w0, -1
	tbnz x4, 0, .LGreturn

	orr x6, x2, x3
	orr x4, x1, x5
	and x6, 0x7FFFFFFFFFFFFFFF

	mov w0, 0
	orr x4, x6
	cbz x4, .LGreturn

	tst x2, x3
	bmi .LGcheckGt

	cmp x3, x2
	bgt .LGlessUnordered
	beq .LGcheckLess

.LGfinish:
	eor x0, x1, x5
	eor x1, x2, x3
	orr x1, x0, x1
	cmp x1, 0
	cset w0, ne

.LGreturn:
	ret

.LGdoCbnz:
	cbnz x5, .LGcontinue

	mov w0, 0
	b .LGcontinue

.LGdoCbnz2:
	cbnz x1, .LGhi

	mov w4, 0
	b .LGhi

.LGcheckGt:
	cmp x2, x3
	bgt .LGlessUnordered
	bne .LGfinish

	cmp x1, x5
	bls .LGfinish

.LGlessUnordered:
	mov w0, -1
	ret

.LGcheckLess:
	cmp x5, x1
	bls .LGfinish
	b .LGlessUnordered
END_FUNC __getf2
END_FUNC __gttf2
