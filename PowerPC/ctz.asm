__ctzdi2:
	addic 9, 4, -1
	subfe 9

	and 3, 9, 3
	andc 4, 9

	rlwinm 9, 0, 26, 26
	or 4, 3
	neg 3, 4
	and 3, 4, 3

	cntlzw 3
	subfic 3, 31

	add 3, 9
	blr
