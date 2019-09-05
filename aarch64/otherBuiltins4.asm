.include "standard.inc"

	.text

START_FUNC abs
	cmp w0, 0
	csneg w0, ge
	ret
END_FUNC abs




START_FUNC ceil
	frintp d0
	ret
END_FUNC ceil





START_FUNC fabs
	fabs d0
	ret
END_FUNC fabs





START_FUNC floor
	frintm d0
	ret
END_FUNC floor





START_FUNC isdigit
	sub w0, #0x30
	cmp w0, 9
	cset w0, ls
	ret
END_FUNC isdigit





START_FUNC labs
	cmp x0, 0
	csneg x0, ge
	ret
END_FUNC labs





START_FUNC sqrt
	fsqrt d0
	ret
END_FUNC sqrt
