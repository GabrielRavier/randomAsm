	.text

bzero:
	mov r3, %low(memset)
	mov r2, r1
	movt r3, %high(memset)
	mov r1, #0
	jr r3





ffsll:
	mov r2, %low(__ffsdi2)
	strd lr, [sp], #-1
	movt r2, %high(__ffsdi2)
	jalr r2

	ldrd lr, [sp, #1]
	add sp, #8
	rts





ffsl:
ffs:
	mov r1, %low(__ffssi2)
	strd lr, [sp], #-1
	movt r1, %high(__ffssi2)
	jalr r1

	ldrd lr, [sp, #1]
	add sp, #8
	rts





isascii:
	mov r1, %low(#-0x80)
	movt r1, %high(#-0x80)
	and r0, r1

	mov r0, #0
	mov r1, #1
	moveq r0, r1
	rts





toascii:
	mov r1, #0x7F
	and r0, r1
	rts
