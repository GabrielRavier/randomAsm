	.text

clz:
clzl:
	clz r0
	bx lr





ctz:
ctzl:
	rsb r3, r0, #0
	and r0, r3
	clz r0

	rsb r0, #0x1F
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
	addeq r0, #32
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
