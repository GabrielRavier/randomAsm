mul8x16:
	jsr popptr1
	
	tya
	ldy #8
	ldx ptr1+1
	beq mul8x8
	
mul8x16a:
	sta ptr4+1
	lsr ptr4
	
.loop:
	bcc .cc
	
	clc
	adc ptr1
	tax
	lda ptr1+1
	adc ptr4+1
	sta ptr4+1
	txa
	
.cc:
	ror ptr4+1
	ror a
	ror ptr4
	
	dey
	bne .loop
	
	tax
	lda ptr4
	rts
	
	
	
	
	
mul8x8:
	lsr ptr4
	
.loop:
	bcc .cc
	
	clc
	adc ptr1
	
.cc:
	ror
	ror ptr4
	
	dey
	bne .loop
	
	tax
	lda ptr4
	rts