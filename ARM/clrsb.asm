__clrsbsi2:
	cmp r0, #0
	mvnlt r0

	cmp r0, #0
	clzne r0
	subne r0, #1
	moveq r0, #7
	bx lr





__clrsbdi2:
	asrs r3, r0, #8
	beq .maybeF

	cmn r3, #1
	beq .doMvn

	cmp r3, #0
	and r0, r3, #0xFF
	movge r3, #0
	blt .lt

.retClz:
	clz r0
	add r0, r3
	sub r0, #1
	bx lr

.doMvn:
	mvn r0

.maybeF:
	and r0, #0xFF
	cmp r0, #0
	movne r3, #8
	bne .retClz

	mov r0, #0xF
	bx lr

.lt:
	mvn r0
	mov r3, #0
	and r0, #0xFF
	b .retClz
