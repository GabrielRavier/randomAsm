pusha:
	ldy sp
	beq .eq
	
	dec sp
	ldy #0
	sta (sp), y
	rts
	
.eq:
	dec sp+1
	dec sp
	sta (sp), y
	rts