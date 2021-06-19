.include "standard.inc"

	.text

.macro make_inc name, reg0

START_FUNC \name
	add \reg0, \reg0, 1
	ret
END_FUNC \name

.endm

	make_inc inc8, w0
	make_inc inc8s, w0
	make_inc inc16, w0
	make_inc inc16s, w0
	make_inc inc32, w0
	make_inc inc32s, w0
	make_inc inc64, x0
	make_inc inc64s, x0

.macro make_inc128 name

START_FUNC \name
	adds x0, x0, 1
	adcs x1, x1, xzr	/* Alternative: cinc x1, x1, cs */
	ret
END_FUNC \name

.endm

	make_inc128 inc128
	make_inc128 inc128s
