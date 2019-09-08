.include "standard.inc"

	.text

START_FUNC _bit_scan_reverse
	bfffo 4(sp){#0:#0}, d0
	moveq #0x1F, d1
	sub.l d0, d1
	move.l d1, d0
	rts
END_FUNC _bit_scan_reverse





START_FUNC _loadbe_i16
	move.l 4(sp), a0
	clr.l d0

	move.b (a0), d0
	lsl.l #8, d0
	or.b 1(a0), d0
	ror.w #8, d0
	rts
END_FUNC _loadbe_i16





START_FUNC _storebe_i16
	move.l 4(sp), a0
	clr.l d0

	move.w 10(sp), d0
	move.w d0, d1
	ror.w #8, d1

	move.b d0, (a0)
	move.b d1, 1(a0)
	rts
END_FUNC _storebe_i16
