.include "standard.inc"

	.text

.macro makeCmp name, flag, reg0, reg1

START_FUNC \name
	fcmp \reg0, \reg1
	cset w0, \flag
	ret
END_FUNC \name

.endm

.macro makeCmpDbl name, flag

	makeCmp \name, \flag, d0, d1

.endm

.macro makeCmpLdbl name, flag, func

START_FUNC \name
	stp x29, x30, [sp, -16]!
	mov x29, sp

	bl \func
	cmp w0, 0
	cset w0, \flag

	ldp x29, x30, [sp], 16
	ret
END_FUNC \name

.endm

.macro makeCmpAll name1, name2, name3, flag, flag_ldbl, func

	makeCmpDbl \name1, \flag
	makeCmpLdbl \name2, \flag_ldbl, \func
	makeCmp \name3, \flag, s0, s1

.endm

.macro makeCmpAllOneFlag name1, name2, name3, flag, func

	makeCmpAll \name1, \name2, \name3, \flag, \flag, \func

.endm

	makeCmpAllOneFlag isgreater, isgreaterl, isgreaterf, gt, __gttf2
	makeCmpAllOneFlag isgreaterequal, isgreaterequall, isgreaterequalf, ge, __getf2
	makeCmpAll isless, islessl, islessf, mi, lt, __lttf2
	makeCmpAll islessequal, islessequall, islessequalf, ls, le, __letf2

.macro make_islessgreater name, reg0, reg1

START_FUNC \name
	fcmp \reg0, \reg1
	cset w8, mi
	csinc w0, w8, wzr, le
	ret
END_FUNC \name

.endm

	make_islessgreater islessgreater, d0, d1





START_FUNC islessgreaterl
	sub sp, sp, 64
	stp x29, x30, [sp, 32]
	str x19, [sp, 48]
	add x29, sp, 32

	stp q0, q1, [sp]
	bl __eqtf2
	ldp q0, q1, [sp]

	cmp w0, 0
	cset w19, ne
	bl __unordtf2

	cmp w0, 0
	cset w8, eq
	and w0, w8, w19

	ldr x19, [sp, 48]
	ldp x29, x30, [sp, 32]
	add sp, sp, 64
	ret
END_FUNC islessgreaterl





	make_islessgreater islessgreaterf, s0, s1
	makeCmpAll isunordered, isunorderedl, isunorderedf, vs, ne, __unordtf2
