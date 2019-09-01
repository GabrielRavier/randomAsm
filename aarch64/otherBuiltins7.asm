	.text

.macro makeCmp name, flag

\name:
	fcmp d0, d1
	cset w0, \flag
	ret

.endm

	makeCmp isgreater, gt
	makeCmp isgreaterequal, ge
	makeCmp isless, mi
	makeCmp islessequal, ls

islessgreater:
	fcmp d0, d1
	cset w0, vs
	csinc w0, wzr, ne
	eor w0, 1
	and w0, 1
	ret

	makeCmp isunordered, vs
