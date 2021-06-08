	.text
	
bzero1:
	sb zero, (a0)
	ret
	
	
	
	
	
bzero1:
	sb zero, 1(a0)
	sb zero, (a0)
	ret