.ifndef STANDARD_INC
.set STANDARD_INC, 1

.macro START_FUNC name

	.align 2
	.p2align 3,,7
	.global \name
	.type \name, %function
\name:

.endm





.macro END_FUNC name

	.size \name, . - \name

.endm





.macro addr_to_reg reg, addr

	adrp \reg, \addr
	add \reg, \reg, :lo12:\addr

.endm





.macro LABEL_ALIGNED name

	.p2align 2,,3
\name:

.endm





.macro make_empty_func name

START_FUNC \name
	ret
END_FUNC \name

.endm





.macro make_jump_func name, func

START_FUNC \name
	b \func
END_FUNC \name

.endm

.endif
