.include "standard.inc"

	.text

START_FUNC _mulx_u64
	umulh x3, x0, x1
	mul x0, x1
	str x3, [x2]
	ret
END_FUNC _mulx_u64





START_FUNC _mulx_u32
	umull x1, w0, w1
	mov w0, w1
	lsr x1, 0x20
	str w1, [x2]
	ret
END_FUNC _mulx_u32
