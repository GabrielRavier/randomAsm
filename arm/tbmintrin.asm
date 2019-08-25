	.text
	
__blcfill_u32:
	add r3, r0, #1
	and r0, r3
	bx lr
	
	
	
	
	
__blci_u32:
	add r3, r0, #1
	mvn r3
	
	orr r0, r3, r0
	bx lr
	
	
	
	
	
__blcic_u32:
	add r3, r0, #1
	bic r0, r3, r0
	bx lr
	
	
	
	
	
__blcmsk_u32:
	add r3, r0, #1
	orr r0, r3, r0
	bx lr
	
	
	
	
	
__blsfill_u32:
	sub r3, r0, #1
	orr r0, r3, r0
	bx lr
	
	
	
	
	
__blsic_u32:
	mvn r3, r0
	sub r0, #1
	
	orr r0, r3, r0
	bx lr
	
	
	
	
	
__t1mskc_u32:
	mvn r3, r0
	add r0, #1
	
	orr r0, r3, r0
	bx lr
	
	
	
	
	
__tzmsk_u32:
	sub r3, r0, #1
	
	bic r0, r3, r0
	bx lr
	
	
	
	
	
__blcfill_u64:
	adds r2, r0, #1
	adc r3, r1, #0
	
	and r0, r2
	and r1, r3
	bx lr
	
	
	
	
	
__blci_u64:
	adds r2, r0, #1
	adc r3, r1, #0
	mvn r2
	mvn r3
	
	orr r0, r2, r0
	orr r1, r3, r1
	bx lr
	
	
	
	
	
__blcic_u64:
	adds r2, r0, #1
	adc r3, r1, #0
	
	bic r0, r2, r0
	bic r1, r3, r1
	bx lr
	
	
	
	
	
__blcmsk_u64:
	adds r2, r0, #1
	adc r3, r1, #0
	
	eor r0, r2
	eor r1, r3
	bx lr
	
	
	
	
	
__blcs_u64:
	adds r2, r0, #1
	adc r3, r1, #0
	
	orr r0, r2, r0
	orr r1, r3, r1
	bx lr
	
	
	
	
	
__blsfill_u64:
	subs r2, r0, #1
	sbc r3, r1, #0
	
	orr r0, r2, r0
	orr r1, r3, r1
	bx lr
	
	
	
	
	
__blsic_u64:
	subs r2, r0, #1
	mvn r0
	sbc r3, r1, #0
	mvn r1
	
	orr r0, r2
	orr r1, r3
	bx lr
	
	
	
	
	
__t1mskc_u64:
	adds r2, r0, #1
	mvn r0
	adc r3, r1, #0
	mvn r1
	
	orr r0, r2
	orr r1, r3
	bx lr
	
	
	
	
	
__tzmsk_u64:
	subs r2, r0, #1
	sbc r3, r1, #0
	
	bic r0, r2, r0
	bic r1, r3, r1
	bx lr