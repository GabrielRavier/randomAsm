tosmulax:
tosumulax:
	sta ptr4
	txa
	beq .rhsHighByte0
	
	stx ptr4+1
	jsr popptr1
	
	tya
	ldy ptr1+1
	beq .lhsHighByte0
	
	sta tmp1
	ldy #16
	
	lsr ptr4+1
	ror ptr4
	
.loop:
	bcc .cc
	
	clc
	adc ptr1
	tax
	lda ptr1+1
	adc tmp1
	sta tmp1
	txa
	
.cc:
	ror tmp1
	ror a
	ror ptr4+1
	ror ptr4
	
	dey
	bne .loop
	
	lda ptr4
	ldx ptr4+1
	rts
	
.rhsHighByte0:
	jmp mul8x16
	
.lhsHighByte0:
	stx ptr1+1
	ldy ptr1
	ldx ptr4
	stx ptr1
	stx ptr4
	ldy #8
	jmp mul8x16a