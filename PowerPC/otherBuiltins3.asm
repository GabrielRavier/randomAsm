fabsf:
	fabs 1
	blr





fabsl:
	fmr 0, 1
	fabs 1
	fcmpu 7, 0, 1
	beqlr- 7

	fneg 2
	blr
