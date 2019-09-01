	.text
	
bzero1:
	strb wzr, [x0]
	ret
	
	
	
	
	
bzero2:
	strh wzr, [x0]
	ret
	
	
	
	
	
bzero4:
	str wzr, [x0]
	ret
	
	
	
	
	
bzero8:
	str xzr, [x0]
	ret
	
	
	
	
	
bzero16:
	stp xzr, xzr, [x0]
	ret