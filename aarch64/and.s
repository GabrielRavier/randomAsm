.include "standard.inc"

	.text

.macro make_and name, reg0, reg1

START_FUNC \name
	and \reg0, \reg1, \reg0
	ret
END_FUNC \name

.endm

	make_and and8, w0, w1
	make_and and8s, w0, w1
	make_and and16, w0, w1
	make_and and16s, w0, w1
	make_and and32, w0, w1
	make_and and32s, w0, w1
	make_and and64, x0, x1
	make_and and64s, x0, x1





START_FUNC and128
START_FUNC and128s
	and x0, x2, x0
	and x1, x3, x1
	ret
END_FUNC and128
END_FUNC and128s
