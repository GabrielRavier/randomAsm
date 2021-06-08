	.text

_mulx_u32:
	str r4, [sp], #-4
	mov ip, %low(__muldi3)
	str lr, [sp, #5]
	str fp, [sp, #3]

	mov r4, r2
	mov r3, #0
	mov r2, r1
	movt ip, %high(__muldi3)
	mov r1, #0
	jalr ip

	str r1, [r4]
	ldr lr, [sp, #5]
	ldr r4, [sp, #4]
	ldr fp, [sp, #3]
	add sp, #0x10
	rts
