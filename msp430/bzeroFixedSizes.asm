	.text
	
bzero1:
	pushm.w #1, r4
	mov.w r1, r4
	
	mov.b #0, @r12
	
	popm.w #1, r4
	ret
	
	
	
	
	
bzero2:
	pushm.w #1, r4
	mov.w r1, r4
	
	mov.b #0, @r12
	mov.b #0, 1(r12)
	
	popm.w #1, r4
	ret