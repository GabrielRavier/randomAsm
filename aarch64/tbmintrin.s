.include "standard.inc"

	.text

.macro make_op_1_and_op name, instr1, instr2, reg0, reg1

START_FUNC \name
	\instr1 \reg1, \reg0, 1
	\instr2 \reg0, \reg1, \reg0
	ret
END_FUNC \name

.endm

.macro make_op_1_and_op_32 name, instr1, instr2

	make_op_1_and_op \name, \instr1, \instr2, w0, w1

.endm

.macro make_add_1_and_op_32 name, instr

	make_op_1_and_op_32 \name, add, \instr

.endm

.macro make_op_1_and_op_64 name, instr1, instr2

	make_op_1_and_op \name, \instr1, \instr2, x0, x1

.endm

.macro make_add_1_and_op_64 name, instr

	make_op_1_and_op_64 \name, add, \instr

.endm

	make_add_1_and_op_32 __blcfill_u32, and
	make_add_1_and_op_32 __blci_u32, orn
	make_add_1_and_op_32 __blcic_u32, bic
	make_add_1_and_op_32 __blcmsk_u32, eor
	make_add_1_and_op_32 __blcs_u32, orr
	make_op_1_and_op_32 __blsfill_u32, sub, orr
	make_op_1_and_op_32 __blsic_u32, sub, orn
	make_add_1_and_op_32 __t1mskc_u32, orn
	make_op_1_and_op_32 __tzmsk_u32, sub, bic
	make_add_1_and_op_64 __blcfill_u64, and
	make_add_1_and_op_64 __blci_u64, orn
	make_add_1_and_op_64 __blcic_u64, bic
	make_add_1_and_op_64 __blcmsk_u64, eor
	make_add_1_and_op_64 __blcs_u64, orr
	make_op_1_and_op_64 __blsfill_u64, sub, orr
	make_op_1_and_op_64 __blsic_u64, sub, orn
	make_add_1_and_op_64 __t1mskc_u64, orn
	make_op_1_and_op_64 __tzmsk_u64, sub, bic
