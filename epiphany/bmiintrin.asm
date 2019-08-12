	.text

__andn_u32:
	mov r2, %low(#1)
	movt r2, %high(#1)
	eor r0, r2
	and r0, r1
	rts





__blsi_u32:
	mov r1, #0
	sub r1, r0
	and r0, r1, r0
	rts





__blsmsk_u32:
	add r1, r0, #-1
	eor r0, r1, r0
	rts





__blsr_u32:
	add r1, r0, #-1
	and r0, r1, r0
	rts





__andn_u64:
	mov ip, %low(#-1)
	movt ip, %high(#-1)

	eor r0, ip
	eor r1, ip

	and r0, r2
	and r1, r3
	rts





__blsi_u64:
	mov r2, #0
	sub r3, r2, r0
	mov ip, #1
	mov r16, r2
	movltu r16, ip

	sub r2, r1
	sub r2, r16

	and r0, r3, r0
	and r1, r2, r1
	rts





__blsmsk_u64:
	add ip, r0, #-1
	sub r2, ip, r0

	mov r2, #1
	mov r3, #0
	movltu r3, r2

	add r2, r1, #-1
	add r2, r3, r2

	eor r0, ip, r0
	eor r1, r2, r1
	rts





__blsr_u64:
	add ip, r0, #-1
	sub r2, ip, r0

	mov r2, #1
	mov r3, #0
	movltu r3, r2

	add r2, r1, #-1
	add r2, r3, r2

	and r0, ip, r0
	and r1, r2, r1
	rts
