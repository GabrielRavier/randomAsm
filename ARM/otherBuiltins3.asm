fabsf:
	bic r0, #0x80000000
	bx lr





fabsl:
	bic r3, r1, #0x80000000
	mov r1, r3
	bx lr
