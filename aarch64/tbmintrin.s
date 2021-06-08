.include "standard.inc"

	.text
	
START_FUNC __blcfill_u32
	add w1, w0, 1
	and w0, w1, w0
	ret
END_FUNC __blcfill_u32
	
	
	
	
	
START_FUNC __blci_u32
	add w1, w0, 1
	orn w0, w1
	ret
END_FUNC __blci_u32
	
	
	
	
	
START_FUNC __blcic_u32
	add w1, w0, 1
	bic w0, w1, w0
	ret
END_FUNC __blcic_u32
	
	
	
	
	
START_FUNC __blcmsk_u32
	add w1, w0, 1
	eor w0, w1, w0
	ret
END_FUNC __blcmsk_u32
	
	
	
	
	
START_FUNC __blcs_u32
	add w1, w0, 1
	orr w0, w1, w0
	ret
END_FUNC __blcs_u32
	
	
	
	
	
START_FUNC __blsfill_u32
	sub w1, w0, #1
	orr w0, w1, w0
	ret
END_FUNC __blsfill_u32
	
	
	
	
	
START_FUNC __blsic_u32
	sub w1, w0, #1
	orn w0, w1, w0
	ret
END_FUNC __blsic_u32
	
	
	
	
	
START_FUNC __t1mskc_u32
	add w1, w0, 1
	orn w0, w1, w0
	ret
END_FUNC __t1mskc_u32
	
	
	
	
	
START_FUNC __tzmsk_u32
	sub w1, w0, #1
	bic w0, w1, w0
	ret
END_FUNC __tzmsk_u32
	
	
	
	
	
START_FUNC __blcfill_u64
	add x1, x0, 1
	and x0, x1, x0
	ret
END_FUNC __blcfill_u64
	
	
	
	
	
START_FUNC __blci_u64
	add x1, x0, 1
	orn x0, x1, x0
	ret
END_FUNC __blci_u64
	
	
	
	
	
START_FUNC __blcic_u64
	add x1, x0, 1
	bic x0, x1, x0
	ret
END_FUNC __blcic_u64
	
	
	
	
	
START_FUNC __blcmsk_u64
	add x1, x0, 1
	eor x0, x1, x0
	ret
END_FUNC __blcmsk_u64
	
	
	
	
	
START_FUNC __blcs_u64
	add x1, x0, 1
	orr x0, x1, x0
	ret
END_FUNC __blcs_u64
	
	
	
	
	
START_FUNC __blsfill_u64
	sub x1, x0, #1
	orn x0, x1, x0
	ret
END_FUNC __blsfill_u64
	
	
	
	
	
START_FUNC __t1mskc_u64
	add x1, x0, 1
	orn x0, x1, x0
	ret
END_FUNC __t1mskc_u64
	
	
	
	
	
START_FUNC __tzmsk_u64
	sub x1, x0, #1
	bic x0, x1, x0
	ret
END_FUNC __tzmsk_u64

