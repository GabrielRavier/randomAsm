popax:
	ldy #1
	lda (sp), y
	tax

#if CPU_65c02
	lda (sp)
#else
	dey
	lda (sp), y
#endif

incsp2:
	inc sp
	beq @twoSp

	inc sp
	beq @oneSp
	rts

@twoSp:
	inc sp

@oneSp:
	inc sp+1
	rts
