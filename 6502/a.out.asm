_N_MAGIC:
	jsr pushax

	ldy #$01
	lda (sp), y
	tax
#if CPU_65c02
	lda (sp)
#else
	dey
	lda (sp), y
#endif
	jsr ldeaxi
	jsr pusheax

	ldx #$FF
	txa
	jsr tosand0ax
	jmp incsp2





_N_MACHTYPE:
	jsr pushax

	ldy #$01
	lda (sp), y
	tax

#if CPU_65c02
	dey
	lda (sp), y
#else
	lda (sp)
#endif
	jsp ldeaxi

	lda sreg
	ldx #$00
	jmp incsp2





_N_FLAGS:
	jsr pushax

	ldy #$01
	lda (sp), y
	tax

#if CPU_65c02
	dey
	lda (sp), y
#else
	lda (sp)
#endif
	jsp ldeaxi

	ldx #$00
	lda sreg+1
	jmp incsp2
