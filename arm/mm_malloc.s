	.text

_mm_malloc:
	str lr, [sp, #-4]!
	cmp r1, #1
	sub sp, #12
	beq .retMalloc

	cmp r1, #2
	mov r2, r0
	add r0, sp, #4
	moveq r1, #4
	bl posix_memalign

	cmp r0, #0
	movne r0, #0
	ldreq r0, [sp, #4]
	add sp, #12
	ldr pc, [sp], #4

.retMalloc:
	bl malloc
	add sp, #12
	ldr pc, [sp], #4





_mm_free:
	b free
