.include "standard.inc"

	.text

START_FUNC _bit_scan_reverse
	clz r0
	rsb r0, #0x1F
	bx lr
END_FUNC _bit_scan_reverse





START_FUNC _loadbe_i16
	ldrsh r0, [r0]
	revsh r0
	bx lr
END_FUNC _loadbe_i16





START_FUNC _storebe_i16
	rev16 r1
	strh r1, [r0]
	bx lr
END_FUNC _storebe_i16





START_FUNC _loadbe_i32
	ldr r0, [r0]
	rev r0
	bx lr
END_FUNC _loadbe_i32





START_FUNC _storebe_i32
	rev r1
	str r1, [r0]
	bx lr
END_FUNC _storebe_i32





START_FUNC _loadbe_i64
	ldr r1, [r0]
	ldr r0, [r0, #4]
	rev r1
	rev r0
	bx lr
END_FUNC _loadbe_i64





START_FUNC _storebe_i64
	rev r2
	rev r3
	str r2, [r0, #4]
	str r3, [r0]
	bx lr
END_FUNC _storebe_i64
