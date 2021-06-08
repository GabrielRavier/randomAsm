toslcmp:
	sta ptr1
	stx ptr1+1
	
	ldy #3
	lda (sp), y
	sec
	sbc sreg+1
	bne .ne
	
	dey
	lda (sp), y
	cmp sreg
	bne .finish
	
	dey
	lda (sp), y
	cmp ptr1+1
	bne .finish
	
	dey
	lda (sp), y
	cmp ptr1
	
.finish:
	php
	jsr incsp4
	plp
	beq .return
	bcs .ret1
	
	lda #$FF

.return:
	rts
	
.ret1:
	lda #1
	rts
	
.ne:
	bvc .vc
	
	eor #$FF
	ora #1
	
.vc:
	php
	jsr incsp4
	plp
	rts