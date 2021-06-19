.include "standard.inc"

	.text

START_FUNC _mm_malloc
	cmp x1, 1
	beq .Ltailc_malloc

	mov x2, x0
	sub x0, x1, #2

	tst x0, -3
	stp x29, x30, [sp, -0x20]!
	mov x3, 8
	mov x29, sp

	csel x1, x1, x3, ne
	add x0, sp, 0x18
	bl posix_memalign

	cmp w0, 0
	ldr x0, [sp, 0x18]

	ldp x29, x30, [sp], 0x20
	csel x0, x1, xzr, eq
	ret

LABEL_ALIGNED .Ltailc_malloc
	b malloc
END_FUNC _mm_malloc





START_FUNC _mm_free
	b free
END_FUNC _mm_free
