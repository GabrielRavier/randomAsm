.include "standard.inc"

	.text

START_FUNC __ror
	rlwinm 4, 0, 27, 0x1F
	subfic 4, 0x20
	rotlw 3, 4
	blr
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
END_FUNC __ror





START_FUNC __rorll
	rlwinm 4, 0, 26, 0x1F
	subfic 4, 0x40
	rotld 3, 4
	blr
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
END_FUNC __rorll





START_FUNC __rev16
	rotlwi 9, 3, 0x18
	rlwimi 9, 3, 8, 8, 0xF
	rlwimi 9, 3, 8, 0x18, 0x1F
	rotlwi 3, 9, 0x10
	blr
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
END_FUNC __rev16





START_FUNC __rev16ll
	srdi 10, 3, 0x20
	rotlwi 9, 10, 0x18
	rlwimi 9, 10, 8, 8, 0xF
	rlwimi 9, 10, 8, 0x18, 0x1F

	rotlwi 10, 3, 0x18
	rlwimi 10, 3, 8, 8, 0xF
	rotlwi 9, 0x10

	rlwimi 10, 3, 8, 0x18, 0x1F
	sldi 9, 0x20
	rotlwi 3, 10, 0x10

	or 3, 9, 3
	blr
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
END_FUNC __rev16ll
