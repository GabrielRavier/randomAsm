.include "standard.inc"

	.text

.macro make_mul name, reg0, reg1

START_FUNC \name
	mul \reg0, \reg0, \reg1
	ret
END_FUNC

.endm

	make_mul mul8, w0, w1
	make_mul mul8s, w0, w1
	make_mul mul16, w0, w1
	make_mul mul16s, w0, w1
	make_mul mul32, w0, w1
	make_mul mul32s, w0, w1
	make_mul mul64, x0, x1
	make_mul mul64s, x0, x1

START_FUNC mul128
START_FUNC mul128s
	umulh x4, x0, x2
	madd x4, x1, x2, x4
	madd x1, x0, x3, x4
	mul x0, x0, x2
	ret
END_FUNC mul128
END_FUNC mul128s
