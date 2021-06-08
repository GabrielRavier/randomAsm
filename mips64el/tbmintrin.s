	.text
	
__blcfill_u32:
	addiu $2, $4, 1
	j $31
	and $2, $4
	
	
	
	
	
__blci_u32:
	addiu $2, $4, 1
	nor $2, $0, $2
	j $31
	or $2, $4
	
	
	
	
	
__blcic_u32:
	nor $2, $0, $4
	addiu $4, 1
	j $31
	and $2, $4
	
	
	
	
	
__blcmsk_u32:
	addiu $2, $4, 1
	j $31
	xor $2, $4
	
	
	
	
	
__blcs_u32:
	addiu $2, $4, 1
	j $31
	or $2, $4
	
	
	
	
	
__blsic_u32:
	nor $2, $0, $4
	addiu $4, -1
	j $31
	or $2, $4
	
	
	
	
	
__t1mskc_u32:
	nor $2, $0, $4
	addiu $4, 1
	j $31
	or $2, $4
	
	
	
	
	
__tzmsk_u32:
	nor $2, $0, $4
	addiu $4, -1
	j $31
	and $2, $4
	
	
	
	
	
__blcfill_u64:
	daddiu $2, $4, 1
	j $31
	and $2, $4
	
	
	
	
	
__blci_u64:
	daddiu $2, $4, 1
	nor $2, $0, $2
	j $31
	or $2, $4
	
	
	
	
	
__blcic_u64:
	nor $2, $0, $4
	daddiu $4, 1
	j $31
	and $2, $4
	
	
	
	
	
__blcmsk_u64:
	daddiu $2, $4, 1
	j $31
	xor $2, $4
	
	
	
	
	
__blcs_u64:
	daddiu $2, $4, 1
	j $31
	or $2, $4
	
	
	
	
	
__blsic_u64:
	nor $2, $0, $4
	daddiu $4, -1
	j $31
	or $2, $4
	
	
	
	
	
__t1mskc_u64:
	nor $2, $0, $4
	daddiu $4, 1
	j $31
	or $2, $4
	
	
	
	
	
__tzmsk_u64:
	nor $2, $0, $4
	daddiu $4, -1
	j $31
	and $2, $4
	