	.text

isfinite:
	fabs d0
	mov x0, 0x7FEFFFFFFFFFFFFF
	fmov d1, x0
	fcmp d0, d1
	cset w0, ls
	ret





isnormal:
	fabs d0
	mov x0, 0x7FEFFFFFFFFFFFFF
	fmov d2, x0

	mov x1, 0x10000000000000
	fmov d1, x0
	fcmp d0, d2
	fccmp d0, d1, 1, ls
	cset w0, ge
	ret





isinf_sign:
	fabs d2, d0
	mov x0, 0x7FEFFFFFFFFFFFFF
	fmov d1, x0

	mov x0, 0
	fcmp d2, d1
	ble .return

	fmov x1, d0
	mov w0, 1
	cmp x1, 0
	csneg w0, ge

.return:
	ret





fpclassify:
	fabs d1, d0
	fcmp d1
	bvs .ret0

	mov x0, 0x7FEFFFFFFFFFFFFF
	fmov d2, x0

	mov w0, 1
	fcmp d1, d2
	bgt .return

	mov x0, 0x10000000000000
	fmov d2, x0
	mov w0, 4
	fcmpe d1, d2
	bge .return

	fcmp d0, #0.0
	cset w0, ne
	add w0, 2

.return:
	ret

.ret0:
	mov w0, 0
	ret