	.text

_mm_malloc:
	sub r2, r1, #1
	strd lr, [sp], #-2

	mov r2, r0
	beq .jmpMalloc

	sub r0, r1, #2
	mov r0, #4
	mov r3, %low(posix_memalign)
	moveq r1, r0

	movt r3, %high(posix_memalign)
	add r0, sp, #12
	jalr r3

	sub r1, r0, #0
	ldr r1, [sp, #3]
	mov r0, #0
	moveq r0, r1
	ldrd lr, [sp, #2]
	add sp, #0x10
	rts

.jmpMalloc:
	mov r1, %low(malloc)
	ldrd lr, [sp, #2]
	movt r1, %high(malloc)
	add sp, #0x10
	jr r1





_mm_free:
	mov r1, %low(free)
	movt r1, %high(free)
	jr r1
