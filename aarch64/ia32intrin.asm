	.text

__rold:
	neg w1
	ror w0, w1
	ret





__rord:
	ror w0, w1
	ret





__rolq:
	neg w1
	ror x0, x1
	ret





__rorq:
	ror x0, x1
	ret
