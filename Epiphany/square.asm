	.text

square:
	mov r2, %low(#0x80000)
	movt r2, %high(#0x80000)

	movfs r1, config
	gid
	movfs r3, config
	orr r3, r2
	movts config, r3
	gie

	imul r0

	mov r2, %low(#-0xE0002)
	movt r2, %high(#-0xE0002)

	gid
	movfs r3, config
	eor r3, r1
	and r3, r2
	eor r3, r1
	movts config, r3
	gie
	rts
