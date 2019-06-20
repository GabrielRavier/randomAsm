__aeabi_fcmplt:
	str lr, [sp, #-8]!

	bl __aeabi_cfcmple

	movcc r0, #1
	movcs r0, #0
	ldr pc, [sp], #8
