	.text

_mulx_u64:
	umulh x3, x0, x1
	mul x0, x1
	str x3, [x2]
	ret





_mulx_u32:
	umull x1, w0, w1
	mov w0, w1
	lsr x1, 32
	str w1, [x2]
	ret
