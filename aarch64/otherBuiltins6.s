.include "standard.inc"

	.text

START_FUNC clz
	clz w0
	ret
END_FUNC clz





START_FUNC ctz
	rbit w0
	clz w0
	ret
END_FUNC ctz





START_FUNC clrsb
	cls w0
	ret
END_FUNC clrsb





START_FUNC popcount
	uxtw x0, w0
	fmov d0, x0
	cnt v0.8b
	addv b0, v0.8b
	umov w0, v0.b[0]
	ret
END_FUNC popcount





START_FUNC parity
	uxtw x0, w0
	fmov d0, x0
	cnt v0.8b
	addv b0, v0.8b
	umov w0, v0.b[0]
	and w0, 1
	ret
END_FUNC parity





START_FUNC clzl
START_FUNC clzll
	clz x0
	ret
END_FUNC clzl
END_FUNC clzll





START_FUNC ctzl
START_FUNC ctzll
	rbit x0
	clz x0
	ret
END_FUNC ctzl
END_FUNC ctzll





START_FUNC clrsbl
START_FUNC clrsbll
	cls x0
	ret
END_FUNC clrsbl
END_FUNC clrsbll





START_FUNC popcountl
START_FUNC popcountll
	fmov d0, x0
	cnt v0.8b
	addv b0, v0.8b
	umov w0, v0.b[0]
	ret
END_FUNC popcountl
END_FUNC popcountll





START_FUNC parityl
START_FUNC parityll
	fmov d0, x0
	cnt v0.8b
	addv b0, v0.8b
	umov w0, v0.b[0]
	and w0, 1
	ret
END_FUNC parityl
END_FUNC parityll
