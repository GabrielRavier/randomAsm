	.text

__andn_u32:
	andc 3, 4, 3
	rldicl 3, 0, 0x20
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





__blsi_u32:
	neg 9, 3
	and 3, 9, 3

	rldicl 3, 0, 0x20
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





__blsmsk_u32:
	addi 9, 3, -1
	xor 3, 9, 3

	rldicl 3, 0, 0x20
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





__blsr_u32:
	addi 9, 3, -1
	and 3, 9, 3

	rldicl 3, 0, 0x20
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





__andn_u64:
	andc 3, 4, 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





__blsi_u64:
	neg 9, 3
	and 3, 9, 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





__blsmsk_u64:
	addi 9, 3, -1
	xor 3, 9, 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





__blsr_u64:
	addi 9, 3, -1
	and 3, 9, 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
