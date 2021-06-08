.include "standard.inc"

	.text

START_FUNC _bit_scan_reverse
	mov r1, %low(__clzsi2)
	strd lr, [sp], #-1
	movt r1, %high(__clzsi2)
	jalr r1

	mov r1, #0x1F
	sub r0, r1, r0
	ldrd lr, [sp, #1]
	add sp, #8
	rts
END_FUNC _bit_scan_reverse





START_FUNC _loadbe_i16
	ldrb r1, [r0, #1]
	ldrb r2, [r0]
	lsl r0, r1, #8
	orr r1, r0, r2
	lsl r0, r1, #8
	lsr r1, #8
	orr r1, r0, r1
	lsl r1, #0x10
	asr r0, #0x10
	rts
END_FUNC _loadbe_i16





START_FUNC _storebe_i16
	movt r1, 0
	lsl r2, r1, #8
	lsr r1, #8
	orr r1, r2, r1

	movt r1, 0
	lsr r2, r1, #8
	strb r1, [r0]
	strb r2, [r0, #1]
	rts
END_FUNC _storebe_i16
