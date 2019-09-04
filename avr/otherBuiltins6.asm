.include "standard.inc"

	.text

	makeWrapper clz, __clzhi2
	makeWrapper ctz, __ctzhi2
	makeWrapper clrsb, __clrsbhi2
	makeWrapper popcount, __popcounthi2
	makeWrapper parity, __parityhi2
	makeWrapper clzl, __clzsi2
	makeWrapper ctzl, __ctzsi2
	makeWrapper clrsbl, __clrsbsi2
	makeWrapper popcountl, __popcountsi2
	makeWrapper parityl, __paritysi2
	makeWrapper clzll, __clzdi2
	makeWrapper ctzll, __ctzdi2
	makeWrapper clrsbll, __clrsbdi2
	makeWrapper popcountll, __popcountdi2
	makeWrapper parityll, __paritydi2
