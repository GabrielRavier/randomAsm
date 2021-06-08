	.text
	
__blcfill_u32:
	addiw a5, a0, 1
	and a0, a5, a0
	sext.w a0
	ret
	
	
	
	
	
__blci_u32:
	addiw a5, a0, 1
	not a5
	or a0, a5, a0
	sext.w a0
	ret
	
	
	
	
	
__blcic_u32:
	not a5, a0
	addiw a0, 1
	and a0, a5, a0
	sext.w a0
	ret
	
	
	
	
	
__blcmsk_u32:
	addiw a5, a0, 1
	xor a0, a5, a0
	sext.w a0
	ret
	
	
	
	
	
__blcs_u32:
	addiw a5, a0, 1
	or a0, a5, a0
	sext.w a0
	ret
	
	
	
	
	
__blsfill_u32:
	addiw a5, a0, -1
	or a0, a5, a0
	sext.w a0
	ret
	
	
	
	
	
__blsic_u32:
	not a5, a0
	addiw a5, a0, -1
	or a0, a5, a0
	sext.w a0
	ret
	
	
	
	
	
__t1mskc_u32:
	not a5, a0
	addiw a5, a0, 1
	or a0, a5, a0
	sext.w a0
	ret
	
	
	
	
	
__tzmsk_u32:
	not a5, a0
	addiw a5, a0, -1
	and a0, a5, a0
	sext.w a0
	ret
	
	
	
	
		
__blcfill_u64:
	addi a5, a0, 1
	and a0, a5
	ret
	
	
	
	
	
__blci_u64:
	addi a5, a0, 1
	not a5
	or a0, a5, a0
	ret
	
	
	
	
	
__blcic_u64:
	not a5, a0
	addi a0, 1
	and a0, a5, a0
	ret
	
	
	
	
	
__blcmsk_u64:
	addi a5, a0, 1
	xor a0, a5, a0
	ret
	
	
	
	
	
__blcs_u64:
	addi a5, a0, 1
	or a0, a5, a0
	ret
	
	
	
	
	
__blsfill_u64:
	addi a5, a0, -1
	or a0, a5, a0
	ret
	
	
	
	
	
__blsic_u64:
	not a5, a0
	addi a0, -1
	or a0, a5, a0
	ret
	
	
	
	
	
__t1mskc_u64:
	not a5, a0
	addi a0, 1
	or a0, a5, a0
	ret
	
	
	
	
	
__tzmsk_u64:
	not a5, a0
	addi a0, -1
	and a0, a5, a0
	ret