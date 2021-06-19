.include "standard.inc"

	.text

.macro make_small_unsigned name, val

START_FUNC \name
	and w0, w0, \val
	lsl w0, w0, w1
	ret
END_FUNC \name

.endm

.macro make_small_signed name, op

START_FUNC \name
	\op w0, w0
	lsl w0, w0, w1
	ret
END_FUNC \name

.endm

	make_small_unsigned shl8, 0xFF
	make_small_signed shl8s, sxtb
	make_small_unsigned shl16, 0xFFFF
	make_small_signed shl16s, sxth

.macro make_32_64 name, reg0, reg1

START_FUNC \name
	lsl \reg0, \reg0, \reg1
	ret
END_FUNC \name

.endm

	make_32_64 shl32, w0, w1
	make_32_64 shl32s, w0, w1
	make_32_64 shl64, x0, x1
	make_32_64 shl64s, x0, x1





.macro make128 name

START_FUNC \name
	and x9, x2, 0xFF
	mvn w11, w2
	lsr x12, x0, 1
	lsr x10, x1, x2

	tst x9, 0x40
	lsr x9, x12, x11
	lsl x8, x0, x2
	orr x9, x10, x9
	csel x0, xzr, x8, ne
	csel x1, x8, x9, ne
	ret
END_FUNC \name

.endm

	make128 shl128
	make128 shl128s
