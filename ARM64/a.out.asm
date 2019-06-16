N_MAGIC:
	ldrh w0, [x0]
	ret





N_MACHTYPE:
	ldrb w0, [x0, 2]
	ret





N_FLAGS:
	ldrb w0, [x0, 3]
	ret





N_SET_INFO:
	uxth w1
	ubfiz w2, 16, 0
	orr w1, w2, w1
	orr w1, w3, lsl 24
	sxtw x1, w1
	str x1, [x0]
	ret





N_BADMAG:
	ldrh w0, [x0]
	mov x2, 20
	cmp x0, 267
	sub x1, x0, #263

	ccmp x0, x2, 4, ne
	ccmp x1, 1, 0, ne
	cset w0, hi
	ret
