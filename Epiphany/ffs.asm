__ffsdi2:
	strd lr, [sp], #-1
	sub r2, r0, #0
	bne .do1

	sub r0, r1, #0
	mov r0, r1
	bne .do21

	ldrd lr, [sp, #1]
	add sp, #8
	rts

.do1:
	mov r1, %low(__ctzsi2)
	movt r1, %high(__ctzsi2)
	jalr r1

	ldrd lr, [sp, #1]
	add r0, #1
	add sp, #8
	rts

.do21:
	mov r1, %low(__ctzsi2)
	movt r1, %high(__ctzsi2)
	jalr r1
	ldrd lr, [sp, #1]
	add r0, #0x21
	add sp, #8
	rts





__ffssi2:
	sub r1, r0, #0
	strd lr, [sp], #-1
	mov r1, #0
	beq .return

	mov r1, %low(__ctzsi2)
	movt r1, %high(__ctzsi2)
	jalr r1

	add r1, r0, #1

.return:
	mov r0, r1
	ldrd lr, [sp, #1]
	add sp, #8
	rts
