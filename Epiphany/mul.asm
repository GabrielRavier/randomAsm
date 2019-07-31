	.text

__muldi3:
	strd r4, [sp], #-3
	strd r6, [sp, #2]

	mov r5, r1
	mov r7, r2
	mov r1, r2

	mov r2, %low(__muldsi3)
	strd lr, [sp, #1]
	movt r2, %high(__muldsi3)
	mov r4, r0

	movfs r6, config
	mov fp, r3
	jalr r2

	mov r2, %low(#0x80000)
	movt r2, %high(#0x80000)
	gid

	movfs r3, config
	orr r3, r2
	movts config, r3
	gie

	imul r5, r7, r5
	mov r2, %low(#-0xE0002)
	imul r4, fp, r4
	movt r2, %high(#-0xE0002)
	gid

	movfs r3, config
	eor r3, r6
	and r3, r2
	eor r3, r6
	movts config, r3
	gie

	add r4, r5, r4
	add r1, r4, r1

	ldrd r4, [sp, #3]
	ldrd r6, [sp, #2]
	ldrd lr, [sp, #1]
	add sp, #0x18
	rts





__muldsi3:
	mov ip, #0xFFFF
	mov r3, %low(#0x80000)
	movfs r19, config
	and r2, r0, ip
	movt r3, %high(#0x80000)
	gid

	movfs r16, config
	orr r16, r3
	movts config, r16
	gie

	and r3, r1, ip
	lsr r0, #0x10
	lsr r1, #0x10

	imul r17, r2, r3
	imul r18, r3, r0
	imul r16, r2, r1
	imul r1, r0, r1

	mov r0, %low(#-0xE0002)
	mov r0, %high(#-0xE0002)
	gid

	movfs r2, config
	eor r2, r19
	and r2, r0
	eor r2, r19
	movts config, r2
	gie

	lsr r3, r17, #0x10
	add r3, r18, r3
	and r17, ip

	lsl r0, r3, #0x10
	add r0, r17, r0

	lsr r2, r0, #0x10
	add r2, r16, r2

	lsr r3, #0x10
	and r0, ip
	add r1, r3, r1

	lsl ip, r2, #0x10
	lsr r2, #0x10
	add r0, ip
	add r1, r2
	rts
