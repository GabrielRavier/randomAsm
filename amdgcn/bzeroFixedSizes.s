.include "standard.inc"

	.text

START_FUNC bzero1
	usualProlog
	usualSmov1
	v_mov_b32_e32 v2, 0
	usualSmov23
	flat_store_byte v[0:1], v2
	waitAfterStore
	usualEpilog
END_FUNC bzero1





START_FUNC bzero2
	usualProlog
	doubleVMovB32E32 v6, v0
	usualSmov1
	v_mov_b32_e32 v4, 0
	usualSmov2
	v_add_co_u32_e64 v2, vcc_lo, v6, 1
	usualSmov3
	v_add_co_ci_u32_e32 v3, vcc_lo, 0, v7, vcc_lo
	flat_store_byte v[6:7], v4
	flat_store_byte v[2:3], v4
	waitAfterStore
	usualEpilog
END_FUNC bzero2
