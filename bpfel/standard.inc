.ifndef STANDARD_INC
.set STANDARD_INC, 1

.macro START_FUNC name

	.globl acoshf
	.p2align 3
	.type \name, @function

\name:

.endm

.macro END_FUNC name

	.size \name, . - \name

.endm

.macro to32 reg

	reg <<= 0x20
	reg >>= 0x20

.endm

.macro toS32 reg

	reg <<= 0x20
	reg s>>= 0x20

.endm

.endif
