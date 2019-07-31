__ctzsi2:
	mov r17, r0
	movt r17, 0
	sub r2, r17, #0

	mov r2, #0x10
	mov r3, #0
	mov ip, r2
	movne ip, r3

	mov r1, #8
	mov r16, #0x18
	movne r16, r1

	lsr r0, ip
	lsl r2, r0, #0x18
	lsr r2, #0x18
	sub r17, r2, #0
	movne r1, r3
	moveq ip, r16

	lsr r2, r0, r1
	mov r1, #4
	mov r0, #0xF
	and r0, r2, r0
	mov r16, r1
	movne r16, r3

	lsr r1, r2, r16
	add r16, ip
	mov r2, #2
	mov ip, #3
	and r17, r1, ip
	mov r0, r2
	movne r0, r3

	lsr r1, r0
	mov r17, #1
	and ip, r1, ip
	and r1, r17
	lsr ip, #1
	eor r1, r17
	sub r2, ip
	sub r1, r3, r1
	and r1, r2, r1
	add r0, r16, r0
	add r0, r1, r0
	rts
