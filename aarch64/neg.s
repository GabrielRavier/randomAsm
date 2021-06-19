.include "standard.inc"

	.text

.macro make_func name, reg0

START_FUNC \name
	neg \reg0, \reg0
	ret
END_FUNC \name

.endm

	make_func neg8, w0
	make_func neg8s, w0
	make_func neg16, w0
	make_func neg16s, w0
	make_func neg32, w0
	make_func neg32s, w0
	make_func neg64, x0
	make_func neg64s, x0

START_FUNC neg128
START_FUNC neg128s
	negs x0, x0
	ngcs x1, x1
	ret
END_FUNC neg128
END_FUNC neg128s
