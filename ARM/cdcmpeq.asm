__aeabi_cdcmpeq:
__aeabi_cdcmple:
	push {r0, lr}

	bl __aeabi_cmpdf2

	cmp r0, #0
	cmnmi r0, #0
	pop {r0, pc}
