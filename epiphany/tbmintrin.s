	.text
	
__blcfill_u32:
	add r1, r0, #1
	and r0, r1, r0
	rts
	
	
	
	
	
__blci_u32:
	mov r2, %low(#-1)
	add r1, r0, #1
	movt r2, %high(#-1)
	eor r1, r2
	orr r0, r1, r0
	rts
	
	
	
	
	
__blcic_u32:
	mov r1, %low(#-1)
	movt r1, %high(#-1)
	eor r1, r0, r1
	add r0, #1
	and r0, r1, r0
	rts
	
	
	
	
	
__blcmsk_u32:
	add r1, r0, #1
	eor r0, r1, r0
	rts
	
	
	
	
	
__blcs_u32:
	add r1, r0, #1
	orr r0, r1, r0
	rts
	
	
	
	
	
__blsfill_u32:
	add r1, r0, #-1
	orr r0, r1, r0
	rts
	
	
	
	
	
__blsic_u32:
	mov r1, %low(#-1)
	movt r1, %high(#-1)
	eor r1, r0, r1
	add r0, #-1
	orr r0, r1, r0
	rts
	
	
	
	
	
__t1mskc_u32:
	mov r1, %low(#-1)
	movt r1, %high(#-1)
	eor r1, r0, r1
	add r0, #1
	orr r0, r1, r0
	rts
	
	
	
	
	
__tzmsk_u32:
	mov r1, %low(#-1)
	movt r1, %high(#-1)
	eor r1, r0, r1
	add r0, #-1
	and r0, r1, r0
	rts
	
	
	
	
	
__blcfill_u64:
	sub r3, r0, #-1
	mov ip, #1
	mov r2, #0
	movgteu r2, ip
	
	add r2, r1
	and r0, r3, r0
	and r1, r2, r1
	rts
	
	
	
	
	
__blci_u64:
	sub ip, r0, #-1
	mov r2, #1
	mov r3, #0
	movgteu r3, r2
	
	mov r2, %low(#-1)
	add r3, r1
	movt r2, %high(#-1)
	eor ip, r2
	eor r2, r3, r2
	orr r0, ip, r0
	orr r1, r2, r1
	rts
	
	
	
	
	
__blcic_u64:
	mov r2, %low(#-1)
	movt r2, %high(#-1)
	eor ip, r0, r2
	eor r2, r1, r2
	sub r0, #-1
	
	mov r16, #1
	mov r3, #0
	movgteu r3, r16
	
	add r1, r3, r1
	and r0, ip, r0
	and r1, r2, r1
	rts
	
	
	
	
	
__blcmsk_u64:
	sub r3, r0, #-1
	mov ip, #1
	mov r2, #0
	movgteu r2, ip
	
	add r2, r1
	eor r0, r3, r0
	eor r1, r2, r1
	rts
	
	
	
	
	
__blcs_u64:
	sub r3, r0, #-1
	mov ip, #1
	mov r2, #0
	movgteu r2, ip
	
	add r2, r1
	orr r0, r3, r0
	orr r1, r2, r1
	rts
	
	
	
	
	
__blsfill_u64:
	add ip, r0, #-1
	sub r2, ip, r0
	mov r2, #1
	mov r3, #0
	movltu r3, r2
	
	add r2, r1, #-1
	add r2, r3, r2
	orr r0, ip, r0
	orr r1, r2, r1
	rts
	
	
	
	
	
__blsic_u64:
	mov r2, %low(#-1)
	movt r2, %high(#-1)
	eor r16, r0, r2
	add ip, r0, #-1
	eor r2, r1, r2
	sub r3, ip, r0
	
	mov r3, #0
	mov r0, #1
	movltu r3, r0
	
	add r1, #-1
	add r1, r3, r1
	orr r0, r16, ip
	orr r1, r2, r1
	rts
	
	
	
	
	
__t1mskc_u64:
	mov r2, %low(#-1)
	movt r2, %high(#-1)
	eor ip, r0, r2
	eor r2, r1, r2
	sub r0, #-1
	
	mov r16, #1
	mov r3, #0
	movgteu r3, r16
	
	add r1, r3, r1
	orr r0, ip, r0
	orr r1, r2, r1
	rts
	
	
	
	
	
__tzmsk_u64:
	mov r2, %low(#-1)
	movt r2, %high(#-1)
	eor r16, r0, r2
	add ip, r0, #-1
	eor r2, r1, r2
	sub r3, ip, r0
	
	mov r3, #0
	mov r0, #1
	movltu r3, r0
	
	add r1, #-1
	add r1, r3, r1
	and r0, r16, ip
	and r1, r2, r1
	rts