	.text

abs:
	cmp w0, 0
	csneg w0, ge
	ret





ceil:
	frintp d0
	ret





fabs:
	fabs d0
	ret





floor:
	frintm d0
	ret





isdigit:
	sub w0, #0x30
	cmp w0, 9
	cset w0, ls
	ret





labs:
	cmp x0, 0
	csneg x0, ge
	ret





sqrt:
	fsqrt d0
	ret
