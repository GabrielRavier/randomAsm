	.text
	
bzero1:
	movw r30, r24
	st Z, __zero_reg__
	ret
	
	
	
	
	
bzero2:
	movw r30, r24
	std Z+1, __zero_reg__
	st Z, __zero_reg__
	ret
	
	
	
	
	
bzero4:
	ldi r18, lo8(4)
	movw r30, r24
	
.loop:
	st Z+, __zero_reg__
	dec r18
	brne .loop
	
	ret