	.text

currentAddress:
	str lr, [sp, #-]!
	mov r0, lr
	ldr pc, [sp], #4
