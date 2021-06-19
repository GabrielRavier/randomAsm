.include "standard.inc"

	.text

.macro cmp8_make name, op

START_FUNC \name
	and w8, w0, 0xFF
	cmp w8, w1, uxtb
	cset w0, \op
	ret
END_FUNC \name

.endm

	cmp8_make cmpeq8, eq
	cmp8_make cmpeq8s, eq





.macro cmp16_make name, op

START_FUNC \name
	and w8, w0, 0xFFFF
	cmp w8, w1, uxth
	cset w0, \op
	ret
END_FUNC \name

.endm

	cmp16_make cmpeq16, eq
	cmp16_make cmpeq16s, eq





.macro cmp32_make name, op

START_FUNC \name
	cmp w0, w1
	cset w0, \op
	ret
END_FUNC \name

.endm

	cmp32_make cmpeq32, eq
	cmp32_make cmpeq32s, eq





.macro cmp64_make name, op

START_FUNC \name
	cmp x0, x1
	cset w0, \op
	ret
END_FUNC \name

.endm

	cmp64_make cmpeq64, eq
	cmp64_make cmpeq64s, eq





.macro cmp128eqne_make name, op

START_FUNC \name
	eor x0, x0, x2
	eor x1, x1, x3
	orr x0, x0, x1

	cmp x0, 0
	cset w0, \op
	ret
END_FUNC \name

.endm

	cmp128eqne_make cmpeq128, eq
	cmp128eqne_make cmpeq128s, eq

	cmp8_make cmpne8, ne
	cmp8_make cmpne8s, ne
	cmp16_make cmpne16, ne
	cmp16_make cmpne16s, ne
	cmp32_make cmpne32, ne
	cmp32_make cmpne32s, ne
	cmp64_make cmpne64, ne
	cmp64_make cmpne64s, ne
	cmp128eqne_make cmpne128, ne
	cmp128eqne_make cmpne128s, ne

	cmp8_make cmplt8, lo

.macro cmp8s_make name, op

START_FUNC \name
	sxtb w1, w1
	cmp w1, w0, sxtb
	cset w0, \op
	ret
END_FUNC \name

.endm

	cmp8s_make cmplt8s, gt
	cmp16_make cmplt16, lo

.macro cmp16s_make name, op

START_FUNC \name
	sxth w1, w1
	cmp w1, w0, sxth
	cset w0, \op
	ret
END_FUNC \name

.endm

	cmp16s_make cmplt16s, gt
	cmp32_make cmplt32, lo
	cmp32_make cmplt32s, lt
	cmp64_make cmplt64, lo
	cmp64_make cmplt64s, lt

.macro cmp128_make name, op1, op2

START_FUNC \name
	cmp x0, x2
	cset w8, \op1

	cmp x1, x3
	cset w9, \op2

	csel w0, w8, w9, eq
	ret
END_FUNC \name

.endm

	cmp128_make cmplt128, lo, lo
	cmp128_make cmplt128s, lo, lt

	cmp8_make cmpgt8, hi
	cmp8s_make cmpgt8s, gt
	cmp16_make cmpgt16, hi
	cmp16s_make cmpgt16s, gt
	cmp32_make cmpgt32, hi
	cmp32_make cmpgt32s, gt
	cmp64_make cmpgt64, hi
	cmp64_make cmpgt64s, gt
	cmp128_make cmpgt128, hi, hi
	cmp128_make cmpgt128s, hi, gt

	cmp8_make cmple8, ls
	cmp8s_make cmple8s, le
	cmp16_make cmple16, ls
	cmp16s_make cmple16s, le
	cmp32_make cmple32, ls
	cmp32_make cmple32s, le
	cmp64_make cmple64, ls
	cmp64_make cmple64s, le
	cmp128_make cmple128, ls, ls
	cmp128_make cmple128s, ls, le

	cmp8_make cmpge8, hs
	cmp8s_make cmpge8s, ge
	cmp16_make cmpge16, hs
	cmp16s_make cmpge16s, ge
	cmp32_make cmpge32, hs
	cmp32_make cmpge32s, ge
	cmp64_make cmpge64, hs
	cmp64_make cmpge64s, ge
	cmp128_make cmpge128, hs, hs
	cmp128_make cmpge128s, hs, ge
