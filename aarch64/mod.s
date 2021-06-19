.include "standard.inc"

	.text

.macro make_small_unsigned name, val

START_FUNC \name
	and w1, w1, \val
	and w0, w0, \val
	udiv w2, w0, w1
	msub w0, w2, w1, w0
	ret
END_FUNC \name

.endm

	make_small_unsigned mod8, 0xFF

.macro make_small_signed name, op

START_FUNC \name
	\op w1, w1
	\op w0, w0
	sdiv w2, w0, w1
	msub w0, w2, w1, w0
	ret
END_FUNC \name

.endm

	make_small_signed mod8s, sxtb
	make_small_unsigned mod16, 0xFFFF
	make_small_signed mod16s, sxth

.macro make_normal name, op, reg0, reg1, reg2

START_FUNC \name
	\op \reg2, \reg0, \reg1
	msub \reg0, \reg2, \reg1, \reg0
	ret
END_FUNC \name

.endm

	make_normal mod32, udiv, w0, w1, w2
	make_normal mod32s, sdiv, w0, w1, w2
	make_normal mod64, udiv, x0, x1, x2
	make_normal mod64s, sdiv, x0, x1, x2


.macro make128 name, func

START_FUNC \name
	stp x29, x30, [sp, -16]!
	mov x29, sp
	bl \func
	ldp x29, x30, [sp], 16
	ret
END_FUNC \name

.endm

	make128 mod128, __umodti3
	make128 mod128s, __modti3
