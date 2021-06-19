.include "standard.inc"

	.text

.macro make_div_small name, val

START_FUNC \name
	and w1, w1, \val
	and w0, w0, \val
	udiv w0, w0, w1
	ret
END_FUNC \name

.endm

	make_div_small div8, 0xFF

.macro make_divs_small name, op

START_FUNC \name
	\op w1, w1
	\op w0, w0
	sdiv w0, w0, w1
	ret
END_FUNC \name

.endm

	make_divs_small div8s, sxtb
	make_div_small div16, 0xFFFF
	make_divs_small div16s, sxth

.macro make_div_normal name, op, reg0, reg1

START_FUNC \name
	\op \reg0, \reg0, \reg1
	ret
END_FUNC \name

.endm

	make_div_normal div32, udiv, w0, w1
	make_div_normal div32s, sdiv, w0, w1
	make_div_normal div64, udiv, x0, x1
	make_div_normal div64s, sdiv, x0, x1

.macro make_div128 name, func

START_FUNC \name
	stp x29, x30, [sp, -16]!
	mov x29, sp
	bl \func
	ldp x29, x30, [sp], 16
	ret
END_FUNC \name

.endm

	make_div128 div128, __udivti3
	make_div128 div128s, __divti3
