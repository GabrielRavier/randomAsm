.include "standard.inc"

	.text

.macro make_8_16_unsigned name, val

START_FUNC \name
	and w0, w0, \val
	asr w0, w0, w1
	ret
END_FUNC \name

.endm

.macro make_8_16_signed name, instr

START_FUNC \name
	\instr w0, w0
	asr w0, w0, w1
	ret
END_FUNC \name

.endm

	make_8_16_unsigned shr8, 0xFF
	make_8_16_signed shr8s, sxtb
	make_8_16_unsigned shr16, 0xFFFF
	make_8_16_signed shr16s, sxth

.macro make_32_64 name, instr, reg0, reg1

START_FUNC \name
	\instr \reg0, \reg0, \reg1
	ret
END_FUNC \name

.endm

	make_32_64 shr32, lsr, w0, w1
	make_32_64 shr32s, asr, w0, w1
	make_32_64 shr64, lsr, x0, x1
	make_32_64 shr64s, asr, x0, x1





START_FUNC shr128
	and x9, x2, 0xFF
	mvn w11, w2
	lsl x12, x1, 1
	lsr x10, x0, x2

	tst x9, 0x40
	lsl x9, x12, x11
	lsr x8, x1, x2
	orr x9, x9, x10
	csel x1, xzr, x8, ne
	csel x0, x8, x9, ne
	ret
END_FUNC shr128





START_FUNC shr128s
	and x9, x2, 0xFF
	mvn w12, w2
	lsl x13, x1, 1
	lsr x11, x0, x2

	tst x9, 0x40
	lsl x9, x13, x12
	asr x8, x1, x2
	asr x10, x1, 63
	orr x9, x9, x10
	csel x1, xzr, x8, ne
	csel x0, x8, x9, ne
	ret
