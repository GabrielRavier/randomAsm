	.text

ffs:
ffsl:
	cmp r0, #0
	rbit r3, r0
	clz r3
	mvneq r3, #0
	add r0, r3, #1
	bx lr





clz:
clzl:
	clz r0
	bx lr





ctz:
ctzl:
	rbit r0
	clz r0
	bx lr





clrsb:
clrsbl:
	push {r4, lr}
	bl __clrsbsi2
	pop {r4, pc}





popcount:
popcountl:
	push {r4, lr}
	bl __popcountsi2
	pop {r4, pc}





parity:
parityl:
	push {r4, lr}
	bl __paritysi2
	pop {r4, pc}





clzll:
	cmp r1, #0
	clzne r0, r1
	clzeq r0
	addeq r0, #0x20
	bx lr





ctzll:
	push {r4, lr}
	bl __ctzdi2
	pop {r4, pc}





clrsbll:
	push {r4, lr}
	bl __clrsbdi2
	pop {r4, pc}





popcountll:
	push {r4, lr}
	bl __popcountdi2
	pop {r4, pc}





parityll:
	push {r4, lr}
	bl __paritydi2
	pop {r4, pc}
