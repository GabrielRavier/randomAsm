_mm_malloc:
	jsr pushax
	jsr decsp2

	ldy #3
	lda (sp), y
	bne .ne2

	dey
	lda (sp), y
	cmp #1
	bne .ne

	ldy #5
	lda (sp), y
	tax
	dey
	lda (sp), y
	jsr malloc
	jmp incsp6

.ne:
	iny

.ne2:
	lda (sp), y
	bne .ne3

	dey
	lda (sp), y
	cmp #2
	bne .ne3

	sta (sp), y
	lda #0
	iny
	sta (sp), y

.ne3:
	jsr decsp4
	lda sp
	ldx sp+1
	clc
	adc #4
	bcc .cc

	inx

.cc:
	ldy #2
	sta (sp), y
	iny
	txa
	sta (sp), y

	ldy #7
	lda (sp), y

	tax
	dey
	lda (sp), y

	sta (sp)
	ldy #1
	txa
	sta (sp), y

	ldy #9
	lda (sp), y

	tax
	dey
	lda (sp), y
	jsr posix_memalign

	cpx #0
	bne .ne4

	cmp #0
	bne .ne5

	ldy #1
	lda (sp), y
	tax
	lda (sp)
	jmp incsp6

.ne4:
	ldx #0

.ne5:
	txa
	jmp incsp6





_mm_free:
	jsr pushax
	ldy #1
	lda (sp), y

	tax
	lda (sp)
	jsr free
	jmp incsp2
