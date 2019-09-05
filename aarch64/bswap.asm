.include "standard.inc"

	.text

START_FUNC bswap16
	rev16 w0
	ret
END_FUNC bswap16





START_FUNC bswap32
	rev w0
	ret
END_FUNC bswap32





START_FUNC bswap64
	rev x0
	ret
END_FUNC bswap64
