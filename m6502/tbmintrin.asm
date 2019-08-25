__blcfill_u32:
	jsr pusheax
	jsr ldeax0sp
	jsr pusheax
	
	ldy #7
	jsr ldeaxysp
	
	ldy #1
	jsr inceaxy
	jsr tosandeax
	jmp incsp4
	
	
	
	
	
__blci_u32:
	jsr pusheax
	jsr ldeax0sp
	jsr pusheax
	
	ldy #7
	jsr ldeaxysp
	
	ldy #1
	jsr inceaxy
	jsr compleax
	jsr tosoreax
	jmp incsp4
	
	
	
	
	
__blcic_u32:
	jsr pusheax
	jsr ldeax0sp
	jsr compleax
	jsr pusheax
	
	ldy #7
	jsr ldeaxysp
	
	ldy #1
	jsr inceaxy
	jsr tosandeax
	jmp incsp4
	
	
	
	
	
__blcmsk_u32:
	jsr pusheax
	jsr ldeax0sp
	jsr pusheax
	
	ldy #7
	jsr ldeaxysp
	
	ldy #1
	jsr inceaxy
	jsr tosxoreax
	jmp incsp4
	
	
	
	
	
__blcs_u32:
	jsr pusheax
	jsr ldeax0sp
	jsr pusheax
	
	ldy #7
	jsr ldeaxysp
	
	ldy #1
	jsr inceaxy
	jsr tosoreax
	jmp incsp4
	
	
	
	
	
__blsfill_u32:
	jsr pusheax
	jsr ldeax0sp
	jsr pusheax
	
	ldy #7
	jsr ldeaxysp
	
	ldy #1
	jsr deceaxy
	jsr tosoreax
	jmp incsp4
	
	
	
	
	
__blsic_u32:
	jsr pusheax
	jsr ldeax0sp
	jsr compleax
	jsr pusheax
	
	ldy #7
	jsr ldeaxysp
	
	ldy #1
	jsr deceaxy
	jsr tosoreax
	jmp incsp4
	
	
	
	
	
__t1mskc_u32:
	jsr pusheax
	jsr ldeax0sp
	jsr pusheax
	
	ldy #7
	jsr ldeaxysp
	
	ldy #1
	jsr inceaxy
	jsr tosandeax
	jmp incsp4
	
	
	
	
	
__tzmsk_u32:
	jsr pusheax
	jsr ldeax0sp
	jsr compleax
	jsr pusheax
	
	ldy #7
	jsr ldeaxysp
	
	ldy #1
	jsr deceaxy
	jsr tosandeax
	jmp incsp4