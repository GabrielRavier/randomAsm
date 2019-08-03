#pragma once

.macro ENTRY name
	.globl \name
	.type \name, %function
	.align 4

\name:
.endm

.macro END name
	.size \name, .-\name
.endm
