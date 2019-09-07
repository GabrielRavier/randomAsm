.ifndef STANDARD_INC
.set STANDARD_INC 1

.macro START_FUNC name

	.hidden \name
	.globl \name
	.type \name, @function
\name:

.endm

.macro END_FUNC name

	.size \name, . - \name

.endm

.endif
