fabsf:
	j $31
	abs.s $f0, $f12





fabsl:
	dmfc1 $3, $f13
	dmfc1 $2, $f12
	dext $3, 0, 0x3F
	dmtc1 $3, $f2
	j $31
	dmtc1 $2, $f0





sqrtf:
	j $31
	sqrt.s $f0, $f12
