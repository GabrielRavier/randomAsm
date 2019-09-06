.include "standard.inc"

	.text

START_FUNC bswap32
	rotmi $4, $3, -8
	ila $5, 0xFF00
	rotmi $6, $3, -0x18
	and $4, $5
	shli $7, $3, 8
	or $4, $6

	ilhu $6, 0xFF
	shli $3, 0x18
	and $5, $7, $6
	or $3, $5
	or $3, $4
	bi $lr
END_FUNC bswap32
