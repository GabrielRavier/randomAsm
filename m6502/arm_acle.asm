__ror:
	jsr pusheax
	lda (sp)
	and #$1F
	sta (sp)
	lda (sp)
	bne .continue

	ldy #4
	jsr ldeaxysp
	jmp incsp5

.continue:
	ldy #4
	jsr ldeaxysp
	jsr pusheax

	ldy #4
	lda (sp), y
	jsr tosshreax
	jsr pusheax

	ldy #8
	jsr ldeaxysp
	jsr pusheax

	lda #$20
	sec

	ldy #8
	sbc (sp), y
	jsr tosshleax
	jsr tosoreax
	jmp incsp5
