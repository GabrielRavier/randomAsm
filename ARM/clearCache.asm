	.text

clear_cache:
#if WinCE
	push {r4, r5, lr}
	mov r4, r0
	mov r5, r1

	bl GetCurrentProcess
	sub r2, r5, r4
	mov r1, r4
	pop {r4, r5, lr}

	b FlushInstructionCache
#else
	ldr r3, .uF0002
	mov r2, #0
	svc 0

	bx lr

.uF0002:
	.word 0xF0002
#endif
