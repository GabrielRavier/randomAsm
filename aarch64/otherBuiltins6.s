.include "standard.inc"

	.text

START_FUNC ffs
	rbit w1, w0
	cmp w0, 0
	clz w1, w1
	csinc w0, wzr, w1, eq
	ret
END_FUNC ffs





.name make_one_operand_op name, op, reg0

START_FUNC \name
	\op \reg0, \reg0
	ret
END_FUNC \name

.endm

	make_one_operand_op clz, clz, w0





.name make_ctz name, reg0

START_FUNC \name
	rbit \reg0, \reg0
	clz \reg0, \reg0
	ret
END_FUNC \name

.endm

	make_ctz ctz, w0
	make_one_operand_op clrsb, cls, w0





.name make_popcount name, regi0, regf0

START_FUNC \name
	fmov \regf0, \regi0
	cnt v0.8b, v0.8b
	addv b0, v0.8b
	fmov w0, s0
	ret
END_FUNC \name

.endm

	make_popcount popcount, w0, s0





.name make_parity name, regi0, regf0

START_FUNC \name
	fmov \regf0, \regi0
	cnt v0.8b, v0.8b
	addv b0, v0.8b
	fmov w0, s0
	and w0, 1
	ret
END_FUNC \name

.endm

	make_parity parity, w0, s0





START_FUNC ffsl
START_FUNC ffsll
	rbit x8, x0
	clz x8, x0
	cmp x0, 0
	csinc w0, wzr, w8, eq
	ret
END_FUNC ffsl
END_FUNC ffsll





	make_one_operand_op clzl, clz, x0
	make_ctz ctzl, x0
	make_one_operand_op clrsbl, cls, x0
	make_popcount popcountl, x0, d0
	make_parity parityl, x0, d0
	make_one_operand_op clzll, clz, x0
	make_ctz ctzll, x0
	make_one_operand_op clrsbll, cls, x0
	make_popcount popcountll, x0, d0
	make_parity parityll, x0, d0
