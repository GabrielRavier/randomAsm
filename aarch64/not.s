.include "standard.inc"

	.text

.macro make_func name, reg0

START_FUNC \name
	mvn \reg0, \reg0
	ret
END_FUNC \name

.endm

	make_func not8, w0
	make_func not8s, w0
	make_func not16, w0
	make_func not16s, w0
	make_func not32, w0
	make_func not32s, w0
	make_func not64, x0
	make_func not64s, x0

START_FUNC not128
START_FUNC not128s
	mvn x0, x0
	mvn x1, x1
	ret
END_FUNC not128
END_FUNC not128s
