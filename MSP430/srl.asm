1:
	add.w #-1, r14
	clrc

	rrc.w r13
	rrc.w r12

__mspabi_srll:
	cmp #0, r14
	jnz 1b
	ret
