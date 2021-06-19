.include "standard.inc"

	.text

.macro make_func name, reg0, reg1

START_FUNC \name
	orr \reg0, \reg1, \reg0
	ret
END_FUNC \name

.endm

	make_func or8, w0, w1
	make_func or8s, w0, w1
	make_func or16, w0, w1
	make_func or16s, w0, w1
	make_func or32, w0, w1
	make_func or32s, w0, w1
	make_func or64, x0, x1
	make_func or64s, x0, x1

START_FUNC or128
START_FUNC or128s
	orr x0, x0, x2
	orr x1, x1, x3
	ret
END_FUNC or128
END_FUNC or128s
