	.text

__andn_u32:
	nor $2, $0, $4
	j $31
	and $2, $5





__blsi_u32:
	subu $2, $0, $4
	j $31
	and $2, $4





__blsmsk_u32:
	addiu $2, $4, -1
	j $31
	xor $2, $4





__blsr_u32:
	addiu $2, $4, -1
	j $31
	and $2, $4





__andn_u64:
	nor $5, $0, $5
	nor $2, $0, $4

	and $3, $5, $7
	j $31
	and $2, $6





__blsi_u64:
	subu $2, $0, $4
	sltu $3, $0, $2

	subu $6, $0, $5
	subu $3, $6, $3

	and $3, $5
	j $31
	and $2, $4





__blsmsk_u64:
	addiu $2, $4, -1
	sltu $6, $2, $4

	addiu $3, $5, -1
	addu $3, $6, $3

	xor $3, $5
	j $31
	xor $2, $4





__blsr_u64:
	addiu $2, $4, -1
	sltu $6, $2, $4

	addiu $3, $5, -1
	addu $3, $6, $3

	and $3, $5
	j $31
	and $2, $4
