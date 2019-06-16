__argp_usage:
	ldr r3, .pStderr
#if !ARMv5
	mov r2, #260
	add r2, #2
#else
	ldr r2, .u262
#endif
	ldr r1, [r3]
	b __argp_state_help

.pStderr:
	dw stderr

#if ARMv5
.u262:
	dw 262
#endif





__option_is_short:
	ldr r3, [r0, #12]
	ands r3, #8
	bne .ret0

	ldr r0, [r0, #4]
	sub r2, r0, #1
	cmp r2, #0xFE
	bhi .retR3

	push {r4, lr}
	bl isprint
	adds r3, r0, #0
	movne r3, #1

	mov r0, r3
	pop {r4, pc}

.ret0:
	mov r3, #0

.retR3:
	mov r0, r3
	bx lr





__option_is_end:
	ldr r3, [r0, #4]
	cmp r3, #0
	bne .l15

	ldr r2, [r0]
	cmp r2, #0
	beq .l18

.l15:
	mov r0, #0
	bx lr

.l18:
	ldr r3, [r0, #16]
	cmp r3, #0
	bne .l15

	ldr r3, [r0, #20]
#if ARMv2
	rsbs r0, r3, #1
	movcc r0, #0
#else
	clz r0, r3
	lsr r0, #5
#endif
	bx lr
