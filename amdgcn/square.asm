.include "standard.inc"

	.text

square:
	usualProlog
	v_mul_lo_u32 v0
	usualSmov123
	usualEpilog
