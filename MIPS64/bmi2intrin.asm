	.text

_mulx_u64:
	dmultu $4, $5
	mfhi $3
	mfio $2

	j $31
	sd $3, 0($6)





_mulx_u32:
	multu $4, $5
	mfhi $2
	mflo $4
	dins $4, $2, 32, 32
	dsrl $3, $4, 32
	sll $2, $4, 0

	j $31
	dw $3, 0($6)
