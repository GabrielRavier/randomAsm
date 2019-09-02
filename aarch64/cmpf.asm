	.text

__letf2:
__cmptf2:
__eqtf2:
__lttf2:
__netf2:
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
	bhi .hi
	beq .doCbnz2

	mov w4, 0

.hi:
	and x7, x3, 0x7FFFFFFFFFFFFFFF

	mov x6, 0x7FFF000000000000
	mov w0, 1
	cmp x7, x6
	bhi .continue
	beq .doCbnz

	mov w0, 0

.continue:
	orr w4, w0
	mov w0, 1
	tbnz x4, 0, .return

	orr x6, x2, x3
	orr x4, x1, x5
	and x6, 0x7FFFFFFFFFFFFFFF

	mov w0, 0
	orr x4, x6
	cbz x4, .return

	tst x2, x3
	bmi .checkGt

	cmp x3, x2
	bgt .retMin1
	beq .checkLess

.finish:
	eor x0, x1, x5
	eor x1, x2, x3
	orr x1, x0, x1

	cmp x1, 0
	cset w0, ne

.return:
	ret

.doCbnz:
	cbnz x5, .continue

	mov w0, 0
	b .continue

.doCbnz2:
	cbnz x1, .hi

	mov w4, 0
	b .hi

.checkGt:
	cmp x2, x3
	bgt .retMin1
	bne .finish

	cmp x1, x5
	bls .finish

.retMin1:
	mov w0, -1
	ret

.checkLess:
	cmp x5, x1
	bls .finish
	b .retMin1





__getf2:
__gttf2:
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
	bhi .hi
	beq .doCbnz2

	mov w4, 0

.hi:
	and x7, x3, 0x7FFFFFFFFFFFFFFF

	mov x6, 0x7FFF000000000000
	mov w0, 1
	cmp x7, x6
	bhi .continue
	beq .doCbnz

	mov w0, 0

.continue:
	orr w4, w0
	mov w0, -1
	tbnz x4, 0, .return

	orr x6, x2, x3
	orr x4, x1, x5
	and x6, 0x7FFFFFFFFFFFFFFF

	mov w0, 0
	orr x4, x6
	cbz x4, .return

	tst x2, x3
	bmi .checkGt

	cmp x3, x2
	bgt .lessUnordered
	beq .checkLess

.finish:
	eor x0, x1, x5
	eor x1, x2, x3
	orr x1, x0, x1
	cmp x1, 0
	cset w0, ne

.return:
	ret

.doCbnz:
	cbnz x5, .continue

	mov w0, 0
	b .continue

.doCbnz2:
	cbnz x1, .hi

	mov w4, 0
	b .hi

.checkGt:
	cmp x2, x3
	bgt .lessUnordered
	bne .finish

	cmp x1, x5
	bls .finish

.lessUnordered:
	mov w0, -1
	ret

.checkLess:
	cmp x5, x1
	bls .finish
	b .lessUnordered
