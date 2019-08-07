.ifndef STANDARD_INC
.set STANDARD_INC 1

.macro multiInstructionAfterArg instruction, afterArg, args:vararg

	.irp arg, \args
		\instruction \arg \afterArg
	.endr

.endm

.macro multiInstruction instruction, args:vararg

	multiInstructionAfterArg \instruction, "", \args

.endm

.macro multiZero regs:vararg

	multiInstructionAfterArg mov, ", __zero_reg__", \regs

.endm

.macro multiLdi0 regs:vararg

	multiInstructionAfterArg ldi, ", 0", \regs

.endm

.macro multiSbciMin1 regs:vararg

	multiInstructionAfterArg sbci, ", -1", \regs

.endm

.macro multiClr regs:vararg

	multiInstruction clr, \regs

.endm

.macro multiSbcZR regs:vararg

	multiInstructionAfterArg sbc, ", __zero_reg__", \regs

.endm

.macro multiCpcZR regs:vararg

	multiInstructionAfterArg cpc, ", __zero_reg__", \regs

.endm

.macro multiCpcSameReg reg, regs:vararg

	multiInstructionAfterArg cpc, ", \reg", \regs

.endm

.macro multiPush regs:vararg

	multiInstruction push, \regs

.endm

.macro multiPop regs:vararg

	multiInstruction pop, \regs

.endm

.macro multiCom regs:vararg

	multiInstruction com, \regs

.endm

.macro multiNeg regs:vararg

	multiInstruction neg, \regs

.endm

.macro multiSbc regs:vararg

	multiInstruction sbc, \regs

.endm

.macro multiRol regs:vararg

	multiInstruction rol, \regs

.endm

.macro multiRor regs:vararg

	multiInstruction ror, \regs

.endm

.macro multiStdZR dests:vararg

	multiInstructionAfterArg std, ", __zero_reg__", \dests

.endm

.macro doSPProlog amountSbiw

	in r28, __SP_L__
	in r29, __SP_H__
	sbiw r28, \amountSbiw
	in __tmp_reg__, __SREG__
	cli

	out __SP_H__, r29
	out __SREG__, __tmp_reg__
	out __SP_L__, r28

.endm

.macro doSPEpilog amountAdiw

	adiw r28, \amountAdiw
	in __tmp_reg__, __SREG__
	cli

	out __SP_H__, r29
	out __SREG__, __tmp_reg__
	out __SP_L__, r28

.endm

.macro ldi016 reg

	multiLdi0 \reg, \reg + 1

.endm

.macro st16 dest, offset, reg

	.if offset == 0
		st \dest, \reg
	.else
		std \dest + \offset, \reg
	.endif

	std \dest+(\offset + 1), (\reg + 1)

.endm


.macro st32 dest, offset, reg

	st16 \dest, \offset, \reg
	st16 \dest, (\offset + 2), (\reg + 2)

.endm

.macro ld16 reg, src, offset

	.if offset == 0
		ld \reg, \src
	.else
		ldd \reg, \src + \offset
	.endif

	ldd (\reg + 1), \src + (\offset + 1)

.endm


.macro ld32 reg, src, offset

	ld16 \reg, \src, \offset
	ld16 (\reg + 2), \dest, (\offset + 2)

.endm

.macro mov32 dest, src

	movw \dest, \src
	movw (\dest + 2), (\src + 2)

.endm
