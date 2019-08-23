	.text
	
bzero1:
	move.l 4(sp), a0
	clr.b (a0)
	rts
	
	
	
	
	
bzero2:
	move.l 4(sp), a0
	clr.b (a0)
	clr.b 1(a0)
	rts
	
	
	
	
	
bzero4:
	move.l 4(sp), a0
	
	.rept 3
	
		clr.b (a0)+
		
	.endr

	clr.b (a0)
	rts