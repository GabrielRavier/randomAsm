.include "standard.inc"

	.text

START_FUNC __blcfill_u32
START_FUNC __blcfill_u64
	r0 = r1
	r0 += 1
	r0 &= r1
	exit
END_FUNC __blcfill_u32
END_FUNC __blcfill_u64





START_FUNC __blci_u32
START_FUNC __blci_u64
	r0 = -2
	r0 += r1
	r0 |= r1
	exit
END_FUNC __blci_u32
END_FUNC __blci_u64





START_FUNC __blcic_u32
START_FUNC __blcic_u64
	r0 = r1
	r1 ^= -1
	r0 += 1
	r0 &= r1
	exit
END_FUNC __blcic_u32
END_FUNC __blcic_u64





START_FUNC __blcmsk_u32
START_FUNC __blcmsk_u64
	r0 = r1
	r0 += 1
	r0 ^= r1
	exit
END_FUNC __blcmsk_u32
END_FUNC __blcmsk_u64





START_FUNC __blcs_u32
START_FUNC __blcs_u64
	r0 = r1
	r0 += 1
	r0 |= r1
	exit
END_FUNC __blcs_u32
END_FUNC __blcs_u64





START_FUNC __blsfill_u32
START_FUNC __blsfill_u64
	r0 = r1
	r0 += -1
	r0 |= r1
	exit
END_FUNC __blsfill_u32
END_FUNC __blsfill_u64





START_FUNC __blsic_u32
START_FUNC __blsic_u64
	r0 = r1
	r1 ^= -1
	r0 += -1
	r0 |= r1
	exit
END_FUNC __blsic_u32
END_FUNC __blsic_u64





START_FUNC __t1mskc_u32
START_FUNC __t1mskc_u64
	r0 = r1
	r1 ^= -1
	r0 += 1
	r0 |= r1
	exit
END_FUNC __t1mskc_u32
END_FUNC __t1mskc_u64





START_FUNC __tzmsk_u32
START_FUNC __tzmsk_u64
	r0 = r1
	r1 ^= -1
	r0 += -1
	r0 &= r1
	exit
END_FUNC __tzmsk_u32
END_FUNC __tzmsk_u64
