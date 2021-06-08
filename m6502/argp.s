__argp_usage:
	jsr pushax
	jsr decsp4
	
	ldy #5
	lda (sp), y
	tax
	dey
	lda (sp), y
	ldy #2
	sta (sp), y
	iny
	txa
	sta (sp), y
	lda stderr
	
	sta (sp)
	ldy #1
	lda stderr+1
	
	sta (sp), y
	ldx #1
	lda #6
	jsr __argp_state_help
	jmp incsp2





__option_is_short:
	jsr pushax
	
	ldy #1
	lda (sp), y
	sta ptr1+1
	lda (sp)
	sta ptr1
	
	ldy #6
	lda (ptr1), y
	and #8
	beq .eq
	
	ldx #0
	txa
	jmp incsp2
	
.eq:
	ldy #1
	lda (sp), y
	sta ptr1+1
	lda (sp)
	sta ptr1
	
	ldy #3
	lda (ptr1), y
	tax
	dey
	lda (ptr1), y
	jsr pushax
	
	ldy #1
	lda (sp), y
	tax
	lda (sp)
	cmp #1
	txa
	sbc #0
	bvs .skip
	
	eor #$80
	
.skip:
	asl a
	lda #0
	tax
	bcc .return
	
	ldy #1
	lda (sp), y
	tax
	lda (sp)
	cmp #0
	txa
	sbc #1
	bvc .skip2
	
	eor #$80
	
.skip2:
	asl a
	lda #0
	tax
	bcc .return
	
	ldy #1
	lda (sp), y
	tax
	lda (sp)
	jsr isprint
	
	stx tmp1
	ora tmp1
	bne .ret1
	
	tax
	bra .return
	
.ret1:
	ldx #0
	lda #1

.return:
	jsr incsp2
	jmp incsp2





__option_is_end:
	jsr pushax
	
	ldy #1
	lda (sp), y
	sta ptr1+1
	lda (sp)
	sta ptr1
	
	ldy #3
	lda (ptr1), y
	tax
	dey
	lda (ptr1), y
	jsr bnegax
	beq .ret0
	
	dey
	lda (sp), y
	sta ptr1+1
	lda (sp)

	ldy #1
	lda (ptr1), y
	tax
	lda (ptr1)
	jsr bnegax
	beq .ret0
	
	ldy #1
	lda (sp), y
	sta ptr1+1
	lda (sp)
	sta ptr1
	
	ldy #9
	lda (ptr1), y
	tax
	dey
	
	lda (ptr1), y
	jsr bnegax
	beq .ret0
	
	ldy #1
	lda (sp), y
	sta ptr1+1
	lda (sp)
	sta ptr1
	ldy #$B
	lda (ptr1), y
	tax
	dey
	
	lda (ptr1), y
	jsr bnegax
	bne .ret1
	
.ret0:
	ldx #0
	txa
	jmp incsp2
	
.ret1:
	ldx #0
	lda #1
	jmp incsp2