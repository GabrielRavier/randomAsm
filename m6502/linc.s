inceaxy:
	sty ptr4
	clc
	adc ptr4
	bcc .return
	
	inx
	bne .return
	
	inc sreg
	bne .return
	
	inc sreg+1
	
.return:
	rts