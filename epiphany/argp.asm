	.text

__argp_usage:
	mov r1, %low(_impure_ptr)
	movt r1, %high(_impure_ptr)
	ldr r1, [r1]
	
	mov r3, %low(__argp_state_help)
	ldr r1, [r1, #3]
	mov r2, #0x106
	movt r3, %high(__argp_state_help)
	jr r3
	
	
	
	
	
__option_is_short:
	ldr r1, [r0, #3]
	mov r2, #8
	strd lr, [sp], #-1
	and r1, r2, r1
	bne .l3
	
	ldr r0, [r0, #1]
	add r2, r0, #-1
	sub r3, r2, #0xFE
	blteu .l6
	
	mov r0, r1
	ldrd lr, [sp, #1]
	add sp, #8
	rts
	
.l6:
	mov r1, %low(isprint)
	movt r1, %high(isprint)