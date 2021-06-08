.include "standard.inc"

	.text

.macro makeCmp name, flag

START_FUNC \name
	fcmp d0, d1
	cset w0, \flag
	ret
END_FUNC \name

.endm

	makeCmp isgreater, gt
	makeCmp isgreaterequal, ge
	makeCmp isless, mi
	makeCmp islessequal, ls

START_FUNC islessgreater
	fcmp d0, d1
	cset w0, vs
	csinc w0, wzr, ne
	eor w0, 1
	and w0, 1
	ret
END_FUNC islessgreater

	makeCmp isunordered, vs
