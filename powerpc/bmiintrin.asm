	.text

__andn_u32:
	andc 3, 4, 3
	blr





__blsi_u32:
	neg 9, 3
	and 3, 9, 3
	blr





__blsmsk_u32:
	addi 9, 3, -1
	xor 3, 9, 3
	blr





__blsr_u32:
	addi 9, 3, -1
	and 3, 9, 3
	blr





__andn_u64:
	andc 3, 5, 3
	andc 4, 6, 4
	blr





__blsi_u64:
	mr 11, 4
	mr 10, 3

	subfic 9, 11, 0
	subfze 8, 10

	and 3, 8, 3
	and 4, 9, 4
	blr





__blsmsk_u64:
	mr 11, 4
	mr 10, 3

	addic 9, 11, -1
	addme 8, 10

	xor 3, 8, 3
	xor 4, 9, 4
	blr





__blsr_u64:
	mr 11, 4
	mr 10, 3

	addic 9, 11, -1
	addme 8, 10

	and 3, 8, 3
	and 4, 9, 4
	blr
