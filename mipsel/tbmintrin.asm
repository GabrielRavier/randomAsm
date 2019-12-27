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
	addiu $2, $4, 1
	sltu $3, $2, $4
	addu $3, $5
	and $3, $5
	j $31
	and $2, $4
	
	
	
	
	
__blci_u64:
	addiu $6, $4, 1
	sltu $3, $6, $4
	addu $3, $5
	nor $2, $0, $6
	nor $3, $0, $3
	or $3, $5
	j $31
	or $2, $4
	
	
	
	
	
__blcic_u64:
	addiu $2, $4, 1
	sltu $3, $2, $4
	nor $6, $0, $5
	addu $3, $5
	nor $4, $0, $4
	and $3, $6, $3
	j $31
	and $2, $4, $2
	
	
	
	
	
__blcmsk_u64:
	addiu $2, $4, 1
	sltu $3, $2, $4
	addu $3, $5
	xor $3, $5
	j $31
	xor $2, $4
	
	
	
	
	
__blcs_u64:
	addiu $2, $4, 1
	sltu $3, $2, $4
	addu $3, $5
	or $3, $5
	j $31
	or $2, $4
	
	
	
	
	
__blsic_u64:
	addiu $2, $4, -1
	sltu $3, $2, $4
	addiu $6, $5, -1
	addu $3, $6
	nor $5, $0, $5
	nor $4, $0, $4
	or $3, $5, $3
	j $31
	or $2, $4, $2
	
	
	
	
	
__t1mskc_u64:
	addiu $2, $4, 1
	sltu $3, $2, $4
	nor $6, $0, $5
	addu $3, $5
	nor $4, $0, $4
	or $3, $6, $3
	j $31
	or $2, $4, $2
	
	
	
	
	
__tzmsk_u64:
	addiu $2, $4, -1
	sltu $3, $2, $4
	addiu $6, $5, -1
	addu $3, $6
	nor $5, $0, $5
	nor $4, $0, $4
	and $3, $5, $3
	j $31
	and $2, $4, $2
	