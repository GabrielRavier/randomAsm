	.text

_mm_malloc:
	cmp r1, #1
	beq .jmpMalloc

	str lr, [sp, #-4]!
	cmp r1, #2
	mov r2, r0
	sub sp, #12
	moveq r1, #4

	add r0, sp, #4
	bl posix_memalign

	cmp r0, #0
	movne r0, #0
	ldreq r0, [sp, #4]
	add sp, #12
	ldr pc, [sp], #4

.jmpMalloc:
	b malloc





_mm_free:
	b free
