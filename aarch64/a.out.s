.include "standard.inc"

	.text

START_FUNC N_MAGIC
	ldrh w0, [x0]
	ret
END_FUNC N_MAGIC





START_FUNC N_MACHTYPE
	ldrb w0, [x0, 2]
	ret
END_FUNC N_MACHTYPE





START_FUNC N_FLAGS
	ldrb w0, [x0, 3]
	ret
END_FUNC N_FLAGS





START_FUNC N_SET_INFO
	and w8, w2, 0xFF
	bfi w1, w8, 16, 8
	bfi w1, w3, 24, 8
	sxtw x8, w1
	str x8, [x0]
	ret
END_FUNC N_SET_INFO





START_FUNC N_BADMAG
	ldrh w0, [x0]
	mov x1, 1
	movk x1, 0x9800, lsl 48
	sub x0, x0, 204
	cmp x0, 64
	lsr x0, x1, x0
	mvn x0, x0
	and w0, w0, 1
	csinc w0, w0, wzr, cc
	ret
END_FUNC N_BADMAG
