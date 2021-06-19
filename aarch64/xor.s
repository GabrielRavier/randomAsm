.include "standard.inc"

	.text

.macro make_xor name, reg0, reg1

START_FUNC \name
	eor \reg0, \reg1, \reg0
	ret
END_FUNC \name

.endm

	make_xor xor8, w0, w1
	make_xor xor8s, w0, w1
	make_xor xor16, w0, w1
	make_xor xor16s, w0, w1
	make_xor xor32, w0, w1
	make_xor xor32s, w0, w1
	make_xor xor64, x0, x1
	make_xor xor64s, x0, x1





START_FUNC xor128
START_FUNC xor128s
	eor x0, x0, x2
	eor x1, x1, x3
	ret
END_FUNC xor128
END_FUNC xor128s
