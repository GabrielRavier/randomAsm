.include "standard.inc"

	.text
	
START_FUNC bzero1
	strb wzr, [x0]
	ret
END_FUNC bzero1
	
	
	
	
	
START_FUNC bzero2
	strh wzr, [x0]
	ret
END_FUNC bzero2
	
	
	
	
	
START_FUNC bzero4
	str wzr, [x0]
	ret
END_FUNC bzero4
	
	
	
	
	
START_FUNC bzero8
	str xzr, [x0]
	ret
END_FUNC
	
	
	
	
	
bzero16:
	stp xzr, xzr, [x0]
	ret
