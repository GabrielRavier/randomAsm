.ifndef STANDARD_INC
.set STANDARD_INC 1

.macro START_FUNC name

	.globl \name
	.align 3
	.type \name, @function
\name:

.endm

.macro END_FUNC name

	.size \name, . - \name

.endm

.endif
