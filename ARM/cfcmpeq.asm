__aeabi_cfcmpeq:
__aeabi_cfcmple:
	push {r0, r1, r2, r3, lr}

	bl __aeabi_cmpsf2

	cmp r0, #0
	cmnmi r0, #0
	pop {r0, r1, r2, r3, pc}
