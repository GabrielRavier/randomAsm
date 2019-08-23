	.text
	
bzero1:
	li 9, 0
	stb 9, 0(3)
	blr
	
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
	
	
	
	
	
bzero2:
	li 9, 0
	sth 9, 0(3)
	blr
	
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
	
	
	
	
	
bzero4:
	li 9, 0
	stw 9, 0(3)
	blr
	
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
	
	
	
	
	
bzero8:
	li 9, 0
	std 9, 0(3)
	blr
	
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
	
	
	
	
	
bzero16:
	li 9, 0
	std 9, 0(3)
	std 9, 8(3)
	blr
	
	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0