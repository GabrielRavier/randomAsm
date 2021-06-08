	.text

__andn_u32:
__andn_u64:
	not a0
	and a0, a1
	ret





__blsi_u32:
	subw a5, zero, a0
	and a0, a5

	sext.w a0
	ret





__blsmsk_u32:
	addiw a5, a0, -1
	xor a0, a5, a0

	sext.w a0
	ret





__blsr_u32:
	addiw a5, a0, -1
	and a0, a5, a0

	sext.w a0
	ret






__blsi_u64:
	sub a5, zero, a0
	and a0, a5, a0
	ret





__blsmsk_u64:
	addi a5, a0, -1
	xor a0, a5, a0
	ret





__blsr_u64:
	addi a5, a0, -1
	and a0, a5, a0
	ret
