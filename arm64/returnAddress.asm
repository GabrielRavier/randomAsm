	.text

currentAddress:
	stp x29, x30, [sp, -16]!
	mov x0, x30
	mov x29, sp
	ldp x29, x30, [sp], 16
	ret
