	.text

isgreater:
	push {r4, lr}
	bl __aeabi_dcmpgt
	adds r0, #0
	movne r0, #1
	pop {r4, pc}





isgreaterequal:
	push {r4, lr}
	bl __aeabi_dcmpge
	adds r0, #0
	movne r0, #1
	pop {r4, pc}





isless:
	push {r4, lr}
	bl __aeabi_dcmplt
	adds r0, #0
	movne r0, #1
	pop {r4, pc}





islessequal:
	push {r4, lr}
	bl __aeabi_dcmple
	adds r0, #0
	movne r0, #1
	pop {r4, pc}





islessgreater:
	push {r4, lr}
	bl __aeabi_dcmpeq
	clz r0
	lsr r0, #5
	pop {r4, pc}





isunordered:
	push {r4, lr}
	bl __aeabi_dcmpun
	adds r0, #0
	movne r0, #1
	pop {r4, lr}
