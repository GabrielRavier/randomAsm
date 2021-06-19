.include "standard.inc"

	.text

.macro make_abs name, reg0

START_FUNC \name
	cmp \reg0, 0
	cneg \reg0, \reg0, mi
	ret
END_FUNC \name

.endm

	make_abs abs, w0




.macro make_one_operand_op name, op

START_FUNC \name
	\op d0, d0
	ret
END_FUNC \name

.endm

	make_one_operand_op ceil, frintp
	make_one_operand_op fabs, fabs
	make_one_operand_op floor, frintm





START_FUNC isdigit
	sub w0, w0, #0x30
	cmp w0, 9
	cset w0, ls
	ret
END_FUNC isdigit





	make_abs labs, x0
	make_one_operand_op sqrt, fsqrt
