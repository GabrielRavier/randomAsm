.include "standard.inc"

	.text

START_FUNC __argz_next
	cbz x2, .Lquick_end

	stp x29, x30, [sp, -32]!
	stp x20, x19, [sp, 16]
	mov x29, sp
	add x20, x0, x1
	mov x19, x2
	cmp x20, x2
	b.ls .Lno_strlen

	mov x0, x19
	bl strlen

	add x8, x19, x0
	add x19, x8, 1

.Lno_strlen:
	cmp x19, x20
	csel x0, x19, xzr, lo
	ldp x20, x19, [sp, 16]
	ldp x29, x30, [sp], 32
	ret

.Lquick_end:
	cmp x1, 0
	csel x0, xzr, x0, eq
	ret
