.ifndef STANDARD_INC
.set STANDARD_INC 1

.macro START_FUNC name

	.align 2
	.global \name
	.type \name, @function
\name:

.endm

.macro END_FUNC name

	.size \name, . - \name

.endm

.macro getAddr reg, symbol
	movw \reg, #:lower16:\symbol
	movt \reg, #:upper16:\symbol
.endm

.macro multiZero regs:vararg
	.irp reg, \regs
		mov reg, #0
	.endr
.endm

.macro clrUpper16 reg
	.irp instr, lsl, lsr
		\instr \reg, #0x10
	.endr
.endm

.macro multiInstruction instr, args:vararg
	.irp current, \args
		\instr \current
	.endr
.endm

.macro multiMov args:vararg
	multiInstruction mov, \args
.endm

.macro multiStr args:vararg
	multiInstruction str, \args
.endm

.macro multiLdr args:vararg
	multiInstruction ldr, \args
.endm

.macro movConds reg, valCond1, valCond2, cond1, cond2
	mov\cond1 \reg, \valCond1
	mov\cond2 \reg, \valCond2

.macro movEqNe reg, valEq, valNe
	movConds \reg, \valEq, \valNe, eq, ne
.endm

.macro movHiLs reg, valEq, valNe
	movConds \reg, \valEq, \valNe, hi, ls
.endm

.macro movVcVs reg, valVc, valVs
	movConds \reg, \valVc, \valVs, vc, vs
.endm

.macro movCcCs reg, valVc, valVs
	movConds \reg, \valVc, \valVs, cc, cs
.endm

.macro mov64 dest, src

	mov \dest, \src
	mov (\dest + 1), (\src + 1)

.endm

.macro mov128 dest, src

	mov64 \dest, \src
	mov64 (\dest + 2), (\src + 2)

.endm

.endif
