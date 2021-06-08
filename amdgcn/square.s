.include "standard.inc"

	.text

START_FUNC square
	usualProlog
	v_mul_lo_u32 v0
	usualSmov123
	usualEpilog
END_FUNC square
