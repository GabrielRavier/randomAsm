	.text

clz:
	pushm.w #1, r4
	mov.w r1, r4
	call #__clzhi2
	popm.w #1, r4
	ret





ctz:
	pushm.w #1, r4
	mov.w r1, r4
	call #__ctzhi2
	popm.w #1, r4
	ret





clrsb:
	pushm.w #1, r4
	mov.w r1, r4
	call #__clrsbhi2
	popm.w #1, r4
	ret





popcount:
	pushm.w #1, r4
	mov.w r1, r4
	call #__popcounthi2
	popm.w #1, r4
	ret




parity:
	pushm.w #1, r4
	mov.w r1, r4
	call #__parityhi2
	popm.w #1, r4
	ret





clzl:
	pushm.w #1, r4
	mov.w r1, r4
	call #__clzsi2
	popm.w #1, r4
	ret





ctzl:
	pushm.w #1, r4
	mov.w r1, r4
	call #__ctzsi2
	popm.w #1, r4
	ret





clrsbl:
	pushm.w #1, r4
	mov.w r1, r4
	call #__clrsbsi2
	popm.w #1, r4
	ret





popcountl:
	pushm.w #1, r4
	mov.w r1, r4
	call #__popcountsi2
	popm.w #1, r4
	ret





parityl:
	pushm.w #1, r4
	mov.w r1, r4
	call #__paritysi2
	popm.w #1, r4
	ret





clzll:
	pushm.w #1, r4
	mov.w r1, r4
	call #__clzdi2
	popm.w #1, r4
	ret





ctzll:
	pushm.w #1, r4
	mov.w r1, r4
	call #__ctzdi2
	popm.w #1, r4
	ret





clrsbll:
	pushm.w #1, r4
	mov.w r1, r4
	call #__clrsbdi2
	popm.w #1, r4
	ret





popcountll:
	pushm.w #1, r4
	mov.w r1, r4
	call #__popcountdi2
	popm.w #1, r4
	ret





parityll:
	pushm.w #1, r4
	mov.w r1, r4
	call #__paritydi2
	popm.w #1, r4
	ret
