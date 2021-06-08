	.text

currentAddress:
	str lr, [sp, #-4]!
	mov r0, lr
	ldr pc, [sp], #4
