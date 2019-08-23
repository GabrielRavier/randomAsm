	.text

_mm_malloc:
	cmp x1, 1
	beq .jmpMalloc

	mov x2, x0
	sub x0, x1, #2

	tst x0, -3
	stp x29, x30, [sp, -0x20]!
	mov x3, 8
	mov x29, sp

	csel x1, x3, ne
	add x0, sp, 0x18
	bl posix_memalign

	cmp w0, 0
	ldr x0, [sp, 0x18]

	ldp x29, x30, [sp], 0x20
	csel x0, xzr, eq
	ret





_mm_free:
	b free