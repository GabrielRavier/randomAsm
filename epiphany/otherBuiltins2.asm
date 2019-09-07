	.text


cimagl:
cimag:
	mov r0, r2
	mov r1, r3
	rts





cimagf:
	mov r0, r1
	rts





conjl:
conj:
	str r2, [sp], #-2
	str r3, [sp, #3]
	str r2, [sp, #2]
	str r3, [sp, #3]

	mov r2, %low(#-0x80000000)
	ldr r3, [sp, #5]
	movt r2, %high(#-0x80000000)

	eor r2, r3
	ldrd r16, [sp, #1]
	ldr r3, [sp, #4]
	strd r16, [r0]
	str r3, [r0, #2]
	str r2, [r0, #3]

	add sp, #8
	rts





conjf:
	mov r2, %low(#-0x80000000)
	movt r2, %high(#-0x80000000)
	eor r2, r1
	mov r3, r0
	mov r1, r2
	rts





copysignl:
copysign:
	mov r2, %low(#0x7FFFFFFF)
	movt r2, %high(#0x7FFFFFFF)
	and r1, r2, r1

	mov r2, %low(#-0x80000000)
	movt r2, %high(#-0x80000000)
	and r3, r2, r3
	orr r1, r3
	rts





copysign:
	mov r2, %low(#-0x80000000)
	movt r2, %high(#-0x80000000)
	and r1, r2, r1

	mov r2, %low(#0x7FFFFFFF)
	movt r2, %high(#0x7FFFFFFF)
	and r0, r2, r0
	orr r0, r1
	rts





cprojl:
cproj:
	str r2, [sp], #-2
	str r3, [sp, #3]
	str r2, [sp, #2]

	ldrd r2, [sp, #1]
	strd r2, [r0]
	ldrd r2, [sp, #2]

	add sp, #8
	strd r2, [r0, #1]
	rts





cprojf:
	mov r2, r1
	mov r3, r0
	rts





creall:
creal:
crealf:
	rts





fmaf:
	mov ip, %low(#-0xE0002)
	movt ip, %high(#-0xE0002)

	movfs r3, config
	gid
	movfs r16, config
	and r16, ip
	movts config, r16
	gie

	fmadd r2, r0, r1
	mov r0, r2

	gid
	movfs r1, config
	eor r1, r3
	and r1, ip
	eor r1, r3
	movts config, r1
	gie
	rts





fmaxf:
	mov r2, %low(#-0xE0002)
	movt r2, %high(#-0xE0002)

	gid
	movfs r3, config
	and r3, r2
	movts config, r3
	gie

	fsub r2, r1, r0
	movblte r1, r0
	mov r0, r1
	rts





fminf:
	mov r2, %low(#-0xE0002)
	movt r2, %high(#-0xE0002)

	gid
	movfs r3, config
	and r3, r2
	movts config, r3
	gie

	fsub r2, r0, r1
	movblte r1, r0
	mov r0, r1
	rts





imaxabs:
llabs:
	asr r2, r1, #0x1F
	eor r1, r2, r1
	eor r0, r2, r0

	sub r0, r2
	mov ip, #1
	mov r3, #0
	movltu r3, ip

	sub r1, r2
	sub r1, r3
	rts
