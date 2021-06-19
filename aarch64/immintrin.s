.include "standard.inc"

	.text

START_FUNC _bit_scan_reverse
	clz w0, w0
	mov w1, 0x1F
	sub w0, w1, w0
	ret
END_FUNC _bit_scan_reverse





START_FUNC _loadbe_i16
	ldrh w0, [x0]
	rev16 w0, w0
	ret
END_FUNC _loadbe_i16





START_FUNC _storebe_i16
	rev16 w1, w1
	strh w1, [x0]
	ret
END_FUNC _storebe_i16





START_FUNC _loadbe_i32
	ldr w0, [x0]
	rev w0, w0
	ret
END_FUNC _loadbe_i32





START_FUNC _storebe_i32
	rev w1, w1
	str w1, [x0]
	ret
END_FUNC _storebe_i32





START_FUNC _loadbe_i64
	ldr x0, [x0]
	rev x0, x0
	ret
END_FUNC _loadbe_i32





START_FUNC _storebe_i64
	rev x1, x1
	str x1, [x0]
	ret
END_FUNC _storebe_i32
