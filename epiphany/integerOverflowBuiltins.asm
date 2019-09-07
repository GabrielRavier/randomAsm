	.text

sadd_overflow:
saddl_overflow:
	add r3, r0, r1
	sub ip, r1, #0
	mov r1, #0
	blt .finish

	sub ip, r3, r0
	blt .ret1

.return:
	str r3, [r2]
	mov r0, r1
	rts

.finish:
	sub ip, r3, r0
	blte .return

.ret1:
	mov r1, #1
	b .return





saddll_overflow:
	mov r16, #0
	add r2, r0, r2
	mov ip, #1
	mov r17, r16
	movgteu r17, ip

	add ip, r1, r3
	add ip, r17, ip
	sub r17, r3, #0
	ldr r3, [sp, #2]
	blt .lt

	sub r17, r1, ip
	bgt .ret1
	bne .return

	sub r1, r0, r2
	blteu .return

.ret1:
	mov r16, #1
	b .return

.lt:
	sub r17, ip, r1
	bgt .ret1
	beq .checkLteu

.return:
	str r2, [r3]
	str ip, [r3, #1]
	mov r0, r16
	rts

.checkLteu:
	sub r1, r2, r0
	blteu .return
	b .ret1





uadd_overflow:
uaddl_overflow:
	add r1, r0, r1
	mov r3, #1
	mov r0, #0
	movgteu r0, r3

	lsl r0, #0x18
	str r1, [r2]
	lsr r0, #0x18
	rts





uaddll_overflow:
	mov ip, #0
	add r2, r0, r2
	mov r16, #1
	mov r17, ip
	movgteu r17, r16

	add r3, r1, r3
	add r3, r17, r3
	sub r16, r1, r3
	ldr r16, [sp, #2]
	bgtu .ret1
	beq .eq

.return:
	str r2, [r16]
	str r3, [r16, #1]
	mov r0, ip
	rts

.eq:
	sub r1, r0, r2
	blteu .return

.ret1:
	mov ip, #1
	b .return
