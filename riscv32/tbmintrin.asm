	.text
	
__blcfill_u32:
	addi a1, a0, 1
	and a0, a1
	ret
	
	
	
	
	
__blci_u32:
	li a1, -2
	sub a1, a0
	or a0, a1
	ret
	
	
	
	
	
__blcic_u32:
	not a1, a0
	addi a0, 1
	and a0, a1
	ret
	
	
	
	
	
__blcmsk_u32:
	addi a1, a0, 1
	xor a0, a1
	ret
	
	
	
	
	
__blcs_u32:
	addi a1, a0, 1
	or a0, a1
	ret
	
	
	
	
	
__blsfill_u32:
	addi a1, a0, -1
	or a0, a1
	ret
	
	
	
	
	
__blsic_u32:
	not a1, a0
	addi a0, -1
	or a0, a1
	ret
	
	
	
	
	
__t1mskc_u32:
	not a1, a0
	addi a0, 1
	or a0, a1
	ret
	
	
	
	
	
__tzmsk_u32:
	not a1, a0
	addi a0, -1
	and a0, a1
	ret
	
	
	
	
	
__blcfill_u64:
	addi a3, a0, 1
	and a2, a3, a0
	sltu a0, a3, a0
	add a0, a1
	and a1, a0
	mv a0, a2
	ret
	
	
	
	
	
__blci_u64:
	li a2, -2
	sub a2, a0
	or a2, a0
	not a0
	seqz a0
	
	add a0, a1
	not a0
	or a1, a0
	mv a0, a2
	ret
	
	
	
	
	
__blcic_u64:
	not a2, a0
	addi a3, a0, 1
	and a2, a3
	sltu a0, a3, a0
	add a0, a1
	not a1
	and a1, a0
	mv a0, a2
	ret
	
	
	
	
	
__blcmsk_u64:
	addi a3, a0, 1
	xor a2, a3, a0
	sltu a0, a3, a0
	add a0, a1
	xor a1, a0
	mv a0, a2
	ret
	
	
	
	
	
__blcs_u64:
	addi a3, a0, 1
	or a2, a3, a0
	sltu a0, a3, a0
	add a0, a1
	or a1, a0
	mv a0, a2
	ret
	
	
	
	
	
__blsfill_u64:
	addi a3, a0, -1
	or a2, a3, a0
	sltu a0, a3, a0
	add a0, a1
	addi a0, -1
	or a1, a0
	mv a0, a2
	ret
	
	
	
	
	
__blsic_u64:
	not a2, a0
	addi a3, a0, -1
	or a2, a3
	sltu a0, a3, a0
	add a0, a1
	addi a0, -1
	not a1
	or a1, a0
	mv a0, a2
	ret
	
	
	
	
	
__t1mskc_u64:
	not a2, a0
	addi a3, a0, 1
	or a2, a3
	sltu a0, a3, a0
	add a0, a1
	not a1
	or a1, a0
	mv a0, a2
	ret
	
	
	
	
	
__tzmsk_u64:
	not a2, a0
	addi a3, a0, -1
	and a2, a3
	sltu a0, a3, a0
	add a0, a1
	addi a0, -1
	not a1
	and a1, a0
	mv a0, a2
	ret