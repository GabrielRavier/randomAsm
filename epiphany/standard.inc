.ifndef STANDARD_INC
.set STANDARD_INC, 1

.macro START_FUNC name

	.balign 4
	.global \name
	.type \name @function
\name:

.endm

.macro END_FUNC name

	.size \name, . - \name

.endm

.endif
