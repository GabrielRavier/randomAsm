	.text
	
__blcfill_u32:
	addi 9, 3, 1
	and 3, 9, 3
	rldicl 3, 3, 0, 0x20
	blr
	
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
	
	
	
	
	
__blci_u32:
	addi 9, 3, 1
	orc 3, 9
	rldicl 3, 3, 0, 0x20
	blr
	
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
	
	
	
	
	
__blcic_u32:
	addi 9, 3, 1
	andc 3, 9, 3
	rldicl 3, 3, 0, 0x20
	blr
	
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
	
	
	
	
	
__blcmsk_u32:
	addi 9, 3, 1
	xor 3, 9, 3
	rldicl 3, 3, 0, 0x20
	blr
	
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
	
	
	
	
	
__blcs_u32:
	addi 9, 3, 1
	or 3, 9, 3
	rldicl 3, 3, 0, 0x20
	blr
	
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
	
	
	
	
	
__blsfill_u32:
	addi 9, 3, -1
	or 3, 9, 3
	rldicl 3, 3, 0, 0x20
	blr
	
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
	
	
	
	
	
__blsic_u32:
	addi 9, 3, -1
	orc 3, 9, 3
	rldicl 3, 3, 0, 0x20
	blr
	
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
	
	
	
	
	
__t1mskc_u32:
	addi 9, 3, 1
	orc 3, 9, 3
	rldicl 3, 3, 0, 0x20
	blr
	
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
	
	
	
	
	
__tzmsk_u32:
	addi 9, 3, -1
	andc 3, 9, 3
	rldicl 3, 3, 0, 0x20
	blr
	
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
		
	
	
	

__blcfill_u64:
	addi 9, 3, 1
	and 3, 9, 3
	blr
	
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
	
	
	
	
	
__blci_u64:
	addi 9, 3, 1
	orc 3, 9
	blr
	
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
	
	
	
	
	
__blcic_u64:
	addi 9, 3, 1
	andc 3, 9, 3
	blr
	
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
	
	
	
	
	
__blcmsk_u64:
	addi 9, 3, 1
	xor 3, 9, 3
	blr
	
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
	
	
	
	
	
__blcs_u64:
	addi 9, 3, 1
	or 3, 9, 3
	blr
	
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
	
	
	
	
	
__blsfill_u64:
	addi 9, 3, -1
	or 3, 9, 3
	blr
	
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
	
	
	
	
	
__blsic_u64:
	addi 9, 3, -1
	orc 3, 9, 3
	blr
	
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
	
	
	
	
	
__t1mskc_u64:
	addi 9, 3, 1
	orc 3, 9, 3
	blr
	
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
	
	
	
	
	
__tzmsk_u64:
	addi 9, 3, -1
	andc 3, 9, 3
	blr
	
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0