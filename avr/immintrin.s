.include "standard.inc"

	.text

START_FUNC _bit_scan_reverse
	call __clzsi2
	ldi16 r18, 0x1F
	sub16 r18, r24
	movw r24, r20
	ret
END_FUNC _bit_scan_reverse





START_FUNC _loadbe_i16
	movw r30, r24
	ld16 r24, Z, 0
	bswap16 r24, r25
	ret
END_FUNC _loadbe_i16





START_FUNC _storebe_i16
	bswap16 r22, r23
	movw r30, r24
	st16 Z, 0, r22
	ret
END_FUNC _storebe_i16





START_FUNC _loadbe_i32
	movw r30, r24
	ld32 r22, Z, 0
	call __bswapsi2
	ret
END_FUNC _loadbe_i32





START_FUNC _storebe_i32
	movw r30, r24
	movw r24, r22
	movw r22, r20
	call __bswapsi2
	st32 Z, 0, r22
	ret
END_FUNC _storebe_i32





START_FUNC _loadbe_i64
	movw r30, r24
	ld64 r18, Z, 0
	call __bswapdi2
	ret
END_FUNC _loadbe_i64





START_FUNC _storebe_i64
	multiPush r16, r17, r28, r29
	movw r28, r24
	mov r27, r18
	mov r26, r19
	mov r31, r20
	mov r30, r21
	movw r24, r22

	movw r18, r16
	mov r20, r27
	mov r21, r26
	mov r22, r31
	mov r23, r30
	call __bswapdi2

	st64 Y, 0, r18
	multiPop r29, r28, r17, r16
	ret
END_FUNC _storebe_i64
