.ifndef STANDARD_INC
.set STANDARD_INC, 1

.macro START_FUNC name

	.align 2
	.globl \name
	.type \name, @function
\name:

.endm

.macro END_FUNC name

	.size \name, . - \name

.endm

.endif
