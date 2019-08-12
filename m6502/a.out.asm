N_MAGIC:
N_FLAGS:
	jsr pushax
	
	ldy #1
	lda (sp), y
	tax
	lda (sp)
	jsr ldeaxi
	
	ldx #0
	lda sreg+1
	jmp incsp2





N_MACHTYPE:
	jsr pushax
	
	ldy #1
	lda (sp), y
	tax
	lda (sp)
	jsr ldeaxi
	
	lda sreg
	ldx #0
	jmp incsp2





N_SET_INFO:
	jsr pusha
	
	ldy #7
	jsr pushwysp
	
	ldy #3
	lda (sp), y
	iny
	ora (sp), y
	pha
	iny
	lda (sp), y
	tax
	pla
	jsr pushax
	
	ldy #4
	lda (sp), y
	tax
	lda #0
	jsr tosorax
	
	ldy #0
	stz sreg
	stz sreg+1
	jsr steaxspidx
	jmp incsp6





N_BADMAG:
	jsr pushax
	
	ldy #1
	lda (sp), y
	tax
	lda (sp)
	jsr ldeaxi
	jsr pusheax
	
	ldx #$FF
	txa
	jsr tosand0ax
	jsr pusheax
	
	ldx #1
	stz sreg
	stz sreg+1
	lda #7
	jsr tosneeax
	beq .ret0
	
	ldy #1
	lda (sp), y
	tax
	lda (sp)
	jsr ldeaxi
	jsr pusheax
	
	ldx #$FF
	txa
	jsr tosand0ax
	jsr pusheax
	
	ldx #1
	stz sreg
	stz sreg+1
	lda #8
	jsr tosneeax
	beq .ret0
	
	ldy #1
	lda (sp), y
	tax
	lda (sp)
	jsr ldeaxi
	jsr pusheax
	
	ldx #$FF
	txa
	jsr tosand0ax
	jsr pusheax
	
	ldx #1
	stz sreg
	stz sreg+1
	lda #$B
	jsr tosneeax
	beq .ret0
	
	ldy #1
	lda (sp), y
	tax
	lda (sp)
	jsr ldeaxi
	jsr pusheax
	
	ldx #$FF
	txa
	jsr tosand0ax
	jsr pusheax
	
	ldx #0
	stz sreg
	stz sreg+1
	lda #$CC
	jsr tosneeax
	bne .ret1
	
.ret0:
	ldx #0
	txa
	jmp incsp2
	
.ret1:
	lda #1
	ldx #0
	jmp incsp2