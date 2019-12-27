	.text

__andn_u32:
	not a0
	and a0, a1
	ret





__blsi_u32:
	neg a1, a0
	and a0, a1
	ret





__blsmsk_u32:
	addi a1, a0, -1
	xor a0, a1
	ret





__blsr_u32:
	addi a1, a0, -1
	and a0, a1
	ret





__andn_u64:
	not a0
	and a0, a2

	not a1
	and a1, a2
	ret





__blsi_u64:
	neg a2, a0
	and a2, a0
	snez a0

	add a0, a1
	neg a0
	and a1, a0
	mv a0, a2
	ret





__blsmsk_u64:
	addi a3, a0, -1
	xor a2, a3, a0
	sltu a0, a3, a0

	add a0, a1
	addi a0, -1
	xor a1, a0
	mv a0, a2
	ret





__blsr_u64:
	addi a3, a0, -1
	xor a2, a3, a0
	sltu a0, a3, a0

	add a0, a1
	addi a0, -1
	and a1, a0
	mv a0, a2
	ret
