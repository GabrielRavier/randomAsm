1:
	add.w #-1, r14
	add.w r12, r12
	addc.w r13, r12

__mspabi_slll:
	cmp #0, r14
	jnz 1b
	ret
