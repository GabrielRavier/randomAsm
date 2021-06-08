	.text
	
__blcfill_u32:
	addi 9, 3, 1
	and 3, 9, 3
	blr
	
	
	
	
	
__blci_u32:
	addi 9, 3, 1
	orc 3, 9
	blr
	
	
	
	
	
__blcic_u32:
	addi 9, 3, 1
	andc 3, 9, 3
	blr
	
	
	
	
	
__blcmsk_u32:
	addi 9, 3, 1
	xor 3, 9, 3
	blr
	
	
	
	
	
__blcs_u32:
	addi 9, 3, 1
	or 3, 9, 3
	blr
	
	
	
	
	
__blsfill_u32:
	addi 9, 3, -1
	or 3, 9, 3
	blr
	
	
	
	
	
__blsic_u32:
	addi 9, 3, -1
	orc 3, 9, 3
	blr
	
	
	
	
	
__t1mskc_u32:
	addi 9, 3, 1
	orc 3, 9, 3
	blr
	
	
	
	
	
__tzmsk_u32:
	addi 9, 3, -1
	andc 3, 9, 3
	blr
	
	
	
	
	
__blcfill_u64:
	mr 11, 4
	mr 10, 3
	
	addic 9, 11, 1
	addze 8, 10
	
	and 3, 8, 3
	and 4, 9, 4
	blr
	
	
	
	
	
__blci_u64:
	mr 11, 4
	mr 10, 3
	
	addic 9, 11, 1
	addze 8, 10
	
	orc 3, 8, 3
	orc 4, 9, 4
	blr
	
	
	
	
	
__blcic_u64:
	mr 11, 4
	mr 10, 3
	
	addic 9, 11, 1
	addze 8, 10
	
	andc 3, 8, 3
	andc 4, 9, 4
	blr
	
	
	
	
	
__blcmsk_u64:
	mr 11, 4
	mr 10, 3
	
	addic 9, 11, 1
	addze 8, 10
	
	xor 3, 8, 3
	xor 4, 9, 4
	blr
	
	
	
	
	
__blcs_u64:
	mr 11, 4
	mr 10, 3
	
	addic 9, 11, 1
	addze 8, 10
	
	or 3, 8, 3
	or 4, 9, 4
	blr
	
	
	
	
	
__blsfill_u64:
	mr 11, 4
	mr 10, 3
	
	addic 9, 11, -1
	addme 8, 10
	
	or 3, 8, 3
	or 4, 9, 4
	blr
	
	
	
	
	
__blsic_u64:
	mr 11, 4
	mr 10, 3
	
	addic 9, 11, -1
	addme 8, 10
	
	orc 3, 8, 3
	orc 4, 9, 4
	blr
	
	
	
	
	
__t1mskc_u64:
	mr 11, 4
	mr 10, 3
	
	addic 9, 11, 1
	addze 8, 10
	
	orc 3, 8, 3
	orc 4, 9, 4
	blr
	
	
	
	
	
__tzmsk_u64:
	mr 11, 4
	mr 10, 3
	
	addic 9, 11, -1
	addme 8, 10
	
	andc 3, 8, 3
	andc 4, 9, 4
	blr