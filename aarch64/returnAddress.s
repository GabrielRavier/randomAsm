.include "standard.inc"

	.text

START_FUNC currentAddress
	str x30, [sp, -16]!
	xpaci x30
	mov x0, x30
	ldr x30, [sp], 16
	ret
END_FUNC currentAddress
