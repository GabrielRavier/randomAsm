.include "standard.inc"

	.text

.macro make_dec name

START_FUNC \name
	sub w0, w0, 1
	ret
END_FUNC \name

.endm

	make_dec dec8
	make_dec dec8s
	make_dec dec16
	make_dec dec16s
	make_dec dec32
	make_dec dec32s

.macro make_dec64 name

START_FUNC \name
	sub x0, x0, 1
	ret
END_FUNC \name

.endm

	make_dec64 dec64
	make_dec64 dec64s

.macro make_dec128 name

START_FUNC \name
	mov x2, -1
	adds x0, x0, x2
	sbc x1, x1, xzr
	ret
END_FUNC \name

.endm

	make_dec128 dec128
	make_dec128 dec128s
