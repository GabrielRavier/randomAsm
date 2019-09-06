.ifndef STANDARD_INC
.set STANDARD_INC 1

.macro START_FUNC name

	.globl \name
	.p2align 2
	.type \name, @function

.endm

.macro END_FUNC name

	.size \name, . - \name

.endm

.macro usualProlog

	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	s_waitcnt_vscnt null, 0

.endm

.macro usualEpilog

	s_setpc_b64 s[30:31]

.endm

.macro waitAfterStore

	s_waitcnt lgkmcnt(0)
	s_waitcnt_vscnt null, 0

.endm

.macro waitAfterLoad

	s_waitcnt vmcnt(0) lgkmcnt(0)

.endm

.macro usualSMov1 reg=s4

	s_mov_b32 \reg, s34

.endm

.macro usualSmov2

	s_mov_b32 s34, s32

.endm

.macro usualSmov3 reg=s4

	s_mov_b32 s34, \reg

.endm

.macro usualSmov12 reg=s4

	usualSMov1 \reg
	usualSmov2

.endm

.macro usualSmov23 reg=s4

	usualSmov2
	usualSmov3 \reg

.endm

.macro usualSmov123 reg=s4

	usualSmov12 \reg
	usualSmov3 \reg

.endm

.macro emptyMethod

	usualProlog
	usualSmov123
	usualEpilog

.endm

.macro loadSymbolAddressAddress reg, symbol

	s_getpc_b64 s[\reg:(\reg + 1)]
	s_add_u32 \reg, \symbol@gotpcrel32@lo+4
	s_addc_u32 (\reg + 1), \symbol@gotpcrel32@hi+4

.endm

.macro loadSymbolAddress reg, symbol

	loadSymbolAddressAddress \reg, \symbol
	s_load_dwordx2 s[\reg:(\reg + 1)], 0

.endm

.macro doubleVMovB32E32 reg1, reg2

	v_mov_b32_e32 \reg1, \reg2
	v_mov_b32_e32 (\reg1 + 1), (\reg2 + 1)

.endm

.macro doubleVAndB32E32 reg1, reg2

	v_and_b32_e32 \reg1, \reg2
	v_and_b32_e32 (\reg1 + 1), (\reg2 + 1)

.endm

.macro doubleVNotB32E32 reg

	v_not_b32_e32 \reg
	v_not_b32_e32 (\reg + 1)

.endm

.macro doubleVMovB32E320 reg

	v_mov_b32_e32 \reg, 0
	v_mov_b32_e32 (\reg + 1), 0

.endm

.macro doubleSMovB320 reg

	s_mov_b32 \reg, 0
	s_mov_b32 (\reg + 1), 0

.endm

.macro doubleVSwapB32 reg1, reg2

	v_swap_b32 \reg1, \reg2
	v_swap_b32 (\reg1 + 1), (\reg2 + 1)

.endm

.macro tripleVMovB32E320 reg

	doubleVMovB32E320 \reg
	v_mov_b32_e32 (\reg + 2), 0

.endm

.macro quadrupleVMovB32E320 reg

	doubleVMovB32E320 \reg
	doubleVMovB32E320 (\reg + 2)

.endm

.macro quadrupleVMovB32E32 reg1, reg2

	doubleVMovB32E32 \reg1, \reg2
	doubleVMovB32E32 (\reg1 + 2), (\reg2 + 2)

.endm

.macro invalidateBuffers

	buffer_gl0_inv
	buffer_gl1_inv

.endm

.macro waitBeforeAtomic

	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_waitcnt_vscnt null, 0

.endm

.endif
