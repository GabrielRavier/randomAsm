.include "standard.inc"

	.text

START_FUNC __rold
	neg w1
	ror w0, w1
	ret
END_FUNC __rold





START_FUNC __rord
	ror w0, w1
	ret
END_FUNC __rord





START_FUNC __rolq
	neg w1
	ror x0, x1
	ret
END_FUNC __rolq





START_FUNC __rorq
	ror x0, x1
	ret
END_FUNC __rorq
