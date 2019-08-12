	.text

__andn_u32:
__andn_u64:
	nor $4, $0, $4
	j $31
	and $2, $4, $5





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





__blsi_u64:
	dsubu $2, $0, $4
	j $31
	and $2, $4





__blsmsk_u64:
	daddiu $2, $4, -1
	j $31
	xor $2, $4





__blsr_u64:
	daddiu $2, $4, -1
	j $31
	and $2, $4
