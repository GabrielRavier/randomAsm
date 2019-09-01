	.text
	
__blcfill_u32:
	add w1, w0, 1
	and w0, w1, w0
	ret
	
	
	
	
	
__blci_u32:
	add w1, w0, 1
	orn w0, w1
	ret
	
	
	
	
	
__blcic_u32:
	add w1, w0, 1
	bic w0, w1, w0
	ret
	
	
	
	
	
__blcmsk_u32:
	add w1, w0, 1
	eor w0, w1, w0
	ret
	
	
	
	
	
__blcs_u32:
	add w1, w0, 1
	orr w0, w1, w0
	ret
	
	
	
	
	
__blsfill_u32:
	sub w1, w0, #1
	orr w0, w1, w0
	ret
	
	
	
	
	
__blsic_u32:
	sub w1, w0, #1
	orn w0, w1, w0
	ret
	
	
	
	
	
__t1mskc_u32:
	add w1, w0, 1
	orn w0, w1, w0
	ret
	
	
	
	
	
__tzmsk_u32:
	sub w1, w0, #1
	bic w0, w1, w0
	ret
	
	
	
	
	
__blcfill_u64:
	add x1, x0, 1
	and x0, x1, x0
	ret
	
	
	
	
	
__blci_u64:
	add x1, x0, 1
	orn x0, x1, x0
	ret
	
	
	
	
	
__blcic_u64:
	add x1, x0, 1
	bic x0, x1, x0
	ret
	
	
	
	
	
__blcmsk_u64:
	add x1, x0, 1
	eor x0, x1, x0
	ret
	
	
	
	
	
__blcs_u64:
	add x1, x0, 1
	orr x0, x1, x0
	ret
	
	
	
	
	
__blsfill_u64:
	sub x1, x0, #1
	orn x0, x1, x0
	ret
	
	
	
	
	
__t1mskc_u64:
	add x1, x0, 1
	orn x0, x1, x0
	ret
	
	
	
	
	
__tzmsk_u64:
	sub x1, x0, #1
	bic x0, x1, x0
	ret