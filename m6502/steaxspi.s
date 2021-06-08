steaxspidx:
	sta tmp1
	stx tmp2
	sty tmp3
	jsr popptr1
	
	ldy tmp3
	lda tmp1
	sta (ptr1), y
	
	iny
	lda tmp2
	sta (ptr1), y
	
	iny
	tax
	lda sreg
	sta (ptr1), y
	
	iny
	lda sreg+1
	sta (ptr1), y
	
	lda tmp1
	rts