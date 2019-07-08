__paritysi2:
	srl $2, $4, 16
	xor $4, $2, $4

	srl $2, $4, 8
	xor $4, $2

	srl $2, $4, 4
	xor $4, $2
	andi $4, 0xF

	li $2, 0x6996
	sra $2, $4

	j $31
	andi $2, 1





__paritydi2:
	j __paritysi2
	xor $4, $5, $4
