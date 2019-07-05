	.text

clz:
	clz w0
	ret





ctz:
	rbit w0
	clz w0
	ret





clrsb:
	cls w0
	ret





popcount:
	uxtw x0, w0
	fmov d0, x0
	cnt v0.8b
	addv b0, v0.8b
	umov w0, v0.b[0]
	ret





parity:
	uxtw x0, w0
	fmov d0, x0
	cnt v0.8b
	addv b0, v0.8b
	umov w0, v0.b[0]
	and w0, 1
	ret





clzl:
clzll:
	clz x0
	ret





ctzl:
ctzll:
	rbit x0
	clz x0
	ret





clrsbl:
clrsbll:
	cls x0
	ret





popcountl:
popcountll:
	fmov d0, x0
	cnt v0.8b
	addv b0, v0.8b
	umov w0, v0.b[0]
	ret





parityl:
parityll:
	fmov d0, x0
	cnt v0.8b
	addv b0, v0.8b
	umov w0, v0.b[0]
	and w0, 1
	ret
