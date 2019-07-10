	.text

__argp_usage:
	movw r3, #:lower16:stderr
	movt r3, #:upper16:stderr
	movw r2, #0x106
	ldr r1, [r3]
	b argp_state_help





__option_is_short:
	ldr r3, [r0, #12]
	ands r3, #8
	bne .ret0

	ldr r0, [r0, #4]
	sub r2, r0, #1
	cmp r2, #0xFE
	bls .continue
	
	mov r0, r3
	bx lr
	
.continue:
	push {r4, lr}
	bl isprint
	adds r3, r0, #0
	movne r3, #1

	mov r0, r3
	pop {r4, pc}

.ret0:
	mov r0, #0
	bx lr





__option_is_end:
	ldr r3, [r0, #4]
	cmp r3, #0
	bne .ret0

	ldr r2, [r0]
	cmp r2, #0
	beq .continue

.ret0:
	mov r0, #0
	bx lr

.continue:
	ldr r3, [r0, #16]
	cmp r3, #0
	bne .ret0

	ldr r3, [r0, #20]
	clz r0, r3
	lsr r0, #5
	bx lr
