	.text
	
bzero1:
	sb zero, (a0)
	ret
	
	
	
	
bzero2:
	sb zero, (a0)
	sb zero, 1(a0)
	ret