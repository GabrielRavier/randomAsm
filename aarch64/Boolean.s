.include "standard.inc"

	.section .rodata

	.align 3
.Lfalse:
	.string "False"

	.align 3
.Ltrue:
	.string "True"





	.text

START_FUNC BooleanToString
	tbz w0, 0, .LSfalse

	addr_to_reg x0, .Ltrue
	b strdup

.LSfalse:
	addr_to_reg x0, .Lfalse
	b strdup
END_FUNC BooleanToString





START_FUNC BooleanEquals
	eon w8, w0, w1
	and w0, w8, 1
	ret
END_FUNC BooleanEquals





START_FUNC BooleanCompare
	eor w8, w0, w1
	tst w0, 1
	mov w9, 1
	cneg w9, w9, eq
	tst w8, 1
	csel w0, w9, wzr, ne
	ret
END_FUNC BooleanCompare
