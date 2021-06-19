.include "standard.inc"

	.text

START_FUNC bswap16
	rev16 w0, w0
	ret
END_FUNC bswap16





START_FUNC bswap32
	rev w0, w0
	ret
END_FUNC bswap32





START_FUNC bswap64
	rev x0, x0
	ret
END_FUNC bswap64





START_FUNC bswap128
	mov x2, x0
	rev x0, x1
	rev x1, x2
	ret
END_FUNC bswap128
