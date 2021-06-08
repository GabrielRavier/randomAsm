	.text
	
bzero1:
	j $31
	sb $0, 0($4)
	
	
	
	
	
bzero2:
	sb $0, 0($4)
	j $31
	sb $0, 1($4)