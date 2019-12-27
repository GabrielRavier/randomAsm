.include "standard.inc"

	.text

START_FUNC __andn_u32
START_FUNC __andn_u64
	r0 = r1
	r0 ^= -1
	r0 &= r2
	exit
END_FUNC __andn_u32
END_FUNC __andn_u64





START_FUNC __blsi_u32
START_FUNC __blsi_u64
	r0 = r1
	r0 = -r0
	r0 &= r1
	exit
END_FUNC __blsi_u32
END_FUNC __blsi_u64





START_FUNC __blsmsk_u32
START_FUNC __blsmsk_u64
	r0 = r1
	r0 += -1
	r0 ^= r1
	exit
END_FUNC __blsmsk_u32
END_FUNC __blsmsk_u64





START_FUNC __blsr_u32
START_FUNC __blsr_u64
	r0 = r1
	r0 += -1
	r0 &= r1
	exit
END_FUNC __blsr_u32
END_FUNC __blsr_u64
