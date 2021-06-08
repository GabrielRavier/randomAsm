.include "standard.inc"

	.text

START_FUNC _bit_scan_reverse
	cntlzw 3
	subfic 3, 0x1F
	extsw 3
	blr
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
END_FUNC _bit_scan_reverse





START_FUNC _loadbe_i16
	lhbrx 3, 0, 3
	extsh 3
	blr
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
END_FUNC _loadbe_i16





START_FUNC _storebe_i16
	sthbrx 4, 9, 3
	blr
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
END_FUNC _storebe_i16





START_FUNC _loadbe_i32
	lwbrx 3, 0, 3
	extsw 3
	blr
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
END_FUNC _loadbe_i32





START_FUNC _storebe_i32
	stwbrx 4, 0, 3
	blr
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
END_FUNC _storebe_i32





START_FUNC _loadbe_i64
	ldbrx 3, 0, 3
	blr
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
END_FUNC _loadbe_i64





START_FUNC _storebe_i64
	stdbrx 4, 0, 3
	blr
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
END_FUNC _storebe_i64
