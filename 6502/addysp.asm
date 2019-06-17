addysp1:
	iny

addysp:
	pha
	tya
	adc sp
	sta sp
	bcc @return

	inc sp+1

@return:
	pla
	rts
