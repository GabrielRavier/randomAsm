	.text


cimagl:
cimag:
	mov r0, r2
	mov r1, r3
	rts





cimagf:
	mov r0, r1
	rts





conjl:
conj:
	str r2, [sp], #-2
	str r3, [sp, #3]
	str r2, [sp, #2]
	str r3, [sp, #3]

	mov r2, %low(#-0x80000000)
	ldr r3, [sp, #5]
	movt r2, %high(#-0x80000000)

	eor r2, r3
	ldrd r16, [sp, #1]
	ldr r3, [sp, #4]
	strd r16, [r0]
	str r3, [r0, #2]
	str r2, [r0, #3]

	add sp, #8
	rts





conjf:
	mov r2, %low(#-0x80000000)
	movt r2, %high(#-0x80000000)
	eor r2, r1
	mov r3, r0
	mov r1, r2
	rts





