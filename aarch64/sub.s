.include "standard.inc"

	.text

.macro make_sub name, reg0, reg1

START_FUNC \name
	sub \reg0, \reg0, \reg1
	ret
END_FUNC \name

.endm

	make_sub sub8, w0, w1
	make_sub sub8s, w0, w1
	make_sub sub16, w0, w1
	make_sub sub16s, w0, w1
	make_sub sub32, w0, w1
	make_sub sub32s, w0, w1
	make_sub sub64, x0, x1
	make_sub sub64s, x0, x1

.macro make_sub128 name

START_FUNC \name
	subs x0, x0, x2
	sbc x1, x1, x3
	ret
END_FUNC \name

.endm

	make_sub128 sub128
	make_sub128 sub128s
