__andn_u32:
	jsr pusheax
	ldy #7

	jsr ldeaxysp
	jsr compleax
	jsr pusheax
	ldy #7
	jsr ldeaxysp
	jsr tosandeax
	jmp incsp8





__blsi_u32:
	jsr pusheax
	jsr ldeax0sp
	jsr pusheax
	ldy #7

	jsr ldeaxysp
	jsr negeax
	jsr tosandeax
	jmp incsp4





__blsmsk_u32:
	jsr pusheax
	jsr ldeax0sp
	jsr pusheax
	ldy #7

	jsr ldeaxysp
	ldy #1

	jsr deceaxy
	jsr tosxoreax
	jmp incsp4





__blsr_u32:
	jsr pusheax
	jsr ldeax0sp
	jsr pusheax

	ldy #7
	jsr ldeaxysp

	ldy #1
	jsr deceaxy
	jsr tosandeax
	jsr incsp4
