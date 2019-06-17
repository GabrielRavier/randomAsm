_mulx_u64:
	mulhdu 9, 3, 4
	mulld 3, 4
	std 9, 0(5)
	blr
	.long 0
	.quad 0





_mulx_u32:
	mulld 4, 3
	srdi 9, 3, 32
	rldicl 3, 0, 32
	stw 9, 0(5)
	blr
	.long 0
	.quad 0
