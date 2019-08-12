.include "standard.inc"

	.text

__aeabi_cdrcmple:
	multiMov "ip, r0", "r0, r2", "r2, ip", "ip, r1", "r1, r3", "r3, ip"

__aeabi_cdcmpeq:
__aeabi_cdcmple:
	push {r0, lr}

	bl __aeabi_cmpdf2

	cmp r0, #0
	cmnmi r0, #0
	pop {r0, pc}





__aeabi_cfrcmple:
	multiMov "ip, r0", "r0, r1", "r1, ip"

__aeabi_cfcmpeq:
__aeabi_cfcmple:
	push {r0, r1, r2, r3, lr}

	bl __aeabi_cmpsf2

	cmp r0, #0
	cmnmi r0, #0
	pop {r0, r1, r2, r3, pc}

