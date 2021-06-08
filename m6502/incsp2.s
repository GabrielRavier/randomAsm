incsp2:
	inc sp
	beq .eq
	
	inc sp
	beq .eq2
	
	rts
	
.eq:
	inc sp
	
.eq2:
	inc sp+1
	rts