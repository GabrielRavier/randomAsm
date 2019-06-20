__aeabi_dcmplt:
	str lr, [sp, #-8]!
	bl __aeabi_cdcmple

	movcc r0, #1
	movcs r0, #0
	ldr pc, [sp], #8
