popptr1:
	ldy #1
	lda (sp), y
	sta ptr1+1
	dey
	lda (sp), y
	sta ptr1
	jmp incsp2