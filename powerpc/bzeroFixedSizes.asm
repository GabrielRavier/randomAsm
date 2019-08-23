	.text
	
bzero1:
	li 9, 0
	stb 9, 0(3)
	blr
	
	
	
	
	
bzero2:
	li 9, 0
	sth 9, 0(3)
	blr
	
	
	
	
	
bzero4:
	li 9, 0
	stw 9, 0(3)
	blr
	
	
	
	
	
bzero8:
	li 9, 0
	stw 9, 0(3)
	stw 9, 4(3)
	blr