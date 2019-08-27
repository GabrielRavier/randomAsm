	.text
	
__blcfill_u32:
	pushm.w #1, r4
	mov.w r1, r4
	
	mov.w r12, r15
	add #1, r15
	mov.w r13, r14
	addc #0, r14
	
	and.w r15, r12
	and.w r14, r13
	
	popm.w #1, r4
	ret
	
	
	
	
	
__blci_u32:
	pushm.w #1, r4
	mov.w r1, r4
	
	mov.w r12, r15
	add #1, r15
	mov.w r13, r14
	addc #0, r14
	inv.w r15
	inv.w r14
	
	bis.w r15, r12
	bis.w r14, r13
	
	popm.w #1, r4
	ret
	
	
	
	
	
__blcic_u32:
	pushm.w #1, r4
	mov.w r1, r4
	
	mov.w r12, r15
	add #1, r15
	mov.w r13, r14
	addc #0, r14
	
	bic.w r12, r15
	mov.w r15, r12
	bic.w r13, r14
	mov.w r14, r13
	
	popm.w #1, r4
	ret
	
	
	
	
	
__blcmsk_u32:
	pushm.w #1, r4
	mov.w r1, r4
	
	mov.w r12, r15
	add #1, r15
	mov.w r13, r14
	addc #0, r14
	
	xor.w r15, r12
	xor.w r14, r13
	
	popm.w #1, r4
	ret
	
	
	
	
	
__blcs_u32:
	pushm.w #1, r4
	mov.w r1, r4
	
	mov.w r12, r15
	add #1, r15
	mov.w r13, r14
	addc #0, r14
	
	bis.w r15, r12
	bis.w r14, r13
	
	popm.w #1, r4
	ret
	
	
	
	
	
__blsfill_u32:
	pushm.w #1, r4
	mov.w r1, r4
	
	mov.w r12, r15
	add #-1, r15
	mov.w r13, r14
	addc #-1, r14
	
	bis.w r15, r12
	bis.w r14, r13
	
	popm.w #1, r4
	ret
	
	
	
	
	
__blsic_u32:
	pushm.w #1, r4
	mov.w r1, r4
	
	mov.w r12, r15
	inv.w r15
	mov.w r13, r14
	inv.w r14
	add #-1, r12
	addc #-1, r13
	
	bis.w r15, r12
	bis.w r14, r13
	
	popm.w #1, r4
	ret
	
	
	
	
	
__t1mskc_u32:
	pushm.w #1, r4
	mov.w r1, r4
	
	mov.w r12, r15
	inv.w r15
	mov.w r13, r14
	inv.w r14
	add #1, r12
	addc #0, r13
	
	bis.w r15, r12
	bis.w r14, r13
	
	popm.w #1, r4
	ret
	
	
	
	
	
__tzmsk_u32:
	pushm.w #1, r4
	mov.w r1, r4
	
	mov.w r12, r15
	add #-1, r15
	mov.w r13, r14
	addc #-1, r14
	
	bic.w r12, r15
	mov.w r15, r12
	bic.w r13, r14
	mov.w r14, r13
	
	popm.w #1, r4
	ret