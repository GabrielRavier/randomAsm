__rold:
	jsr pusha

	lda (sp)
	and #$1F
	sta (sp)

	ldy #4
	jsr ldeaxysp
	jsr pusheax

	ldy #4
	lda (sp), y
	jsr tosshleax
	jsr pusheax

	ldy #8
	lda (sp), y
	eor #$FF
	clc
	adc #1
	and #$1F
	jsr tosshreax
	jsr tosoreax
	jmp incsp5





__rord:
	jsr pusha

	lda (sp)
	and #$1F
	sta (sp)

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

	ldy #8
	lda (sp), y
	eor #$FF
	clc
	adc #1
	and #$1F
	jsr tosshleax
	jsr tosoreax
	jmp incsp5
