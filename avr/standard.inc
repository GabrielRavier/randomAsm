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

.macro inSP reg

	in \reg, __SP_L__
	in (\reg + 1), __SP_H__

.endm

.macro doSPProlog amountSbiw

	inSP r28
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

.macro st64 dest, offset, reg

	st32 \dest, \offset, \reg
	st32 \dest, (\offset + 4), (\reg + 4)

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

.macro makeInstrMultiWithFlags instr1, instr2, reg1, reg2, offsets:varargs

	\instr1 \dest, \src

	.irp offset, \offsets

		\instr2 (\dest + \offset), (\src + \offset)

	.endr

.endm

.macro makeAdd dest, src, offsets:vararg

	makeInstrMultiWithFlags add, adc, \dest, \src, \offsets

.endm

.macro add16 dest, src

	makeAdd \dest, \src, 1

.endm

.macro add32 dest, src

	makeAdd \dest, \src, 1, 2, 3

.endm

.macro add64 dest, src

	makeAdd \dest, \src, 1, 2, 3, 4, 5, 6, 7

.endm

.macro makeCmp dest, src, offsets:vararg

	makeInstrMultiWithFlags cp, cpc, \dest, \src, \offsets

.endm

.macro cmp16 dest, src

	makeCmp \dest, \src, 1

.endm

.macro cmp32 dest, src

	makeCmp \dest, \src, 1, 2, 3

.endm

.macro cmp64 dest, src

	makeCmp \dest, \src, 1, 2, 3, 4, 5, 6, 7

.endm

.macro makeSub dest, src, offsets:vararg

	makeInstrMultiWithFlags sub, sbc, \dest, \src, \offsets

.endm

.macro sub16 dest, src

	makeSub \dest, \src, 1

.endm

.macro sub32 dest, src

	makeSub \dest, \src, 1, 2, 3

.endm

.macro sub64 dest, src

	makeSub \dest, \src, 1, 2, 3, 4, 5, 6, 7

.endm

.macro and16 dest, src

	and \dest, \src
	and (\dest + 1), (\src + 1)

.endm

.macro and32 dest, src

	and16 \dest, \src
	and16 (\dest + 2), (\src + 2)

.endm

.macro and64 dest, src

	and32 \dest, \src
	and32 (\dest + 4), (\src + 4)

.endm

.macro or16 dest, src

	or \dest, \src
	or (\dest + 1), (\src + 1)

.endm

.macro or32 dest, src

	or16 \dest, \src
	or16 (\dest + 2), (\src + 2)

.endm

.macro or64 dest, src

	or32 \dest, \src
	or32 (\dest + 4), (\src + 4)

.endm

.macro com16 reg

	multiCom \reg, (\reg + 1)

.endm

.macro com32 reg

	multiCom \reg, (\reg + 1), (\reg + 2), (\reg + 3)

.endm

.macro ldi16 reg, val

	ldi \reg, lo8(\val)
	ldi (\reg + 1), hi8(\val)

.endm

.macro ldi32 reg, val

	ldi16 \reg, \val
	ldi (\reg + 2), hlo8(\val)
	ldi (\reg + 3), hhi8(\val)

.endm

.macro subi16 reg, val

	subi \reg, lo8(\val)

	.if hi8(\val)

		sbci (\reg + 1), hi8(\val)

	.else

		sbc (\reg + 1), __zero_reg__

	.endif

.endm

.macro subi32 reg, val

	subi16 \reg, \val
	sbci (\reg + 2), hlo8(\val)
	sbci (\reg + 3), hhi8(\val)

.endm

.macro cpi16 reg, val

	.if \val

		cpi \reg, lo8(\val)

	.else

		cp \reg, __zero_reg__

	.endif

	cpc (\reg + 1), __zero_reg__

.endm

.macro cpi32 reg, val

	cpi16 \reg, \val
	cpc (\reg + 2), __zero_reg__
	cpc (\reg + 3), __zero_reg__

.endm

.macro sbc16 reg

	multiSbc \reg, (\reg + 1)

.endm

.macro lsl16 reg

	lsl \reg
	rol (\reg + 1)

.endm

.macro lsl32 reg

	lsl16 \reg
	rol (\reg + 2)
	rol (\reg + 3)

.endm

.macro lsr32 reg

	lsr16 \reg
	ror (\reg + 2)
	ror (\reg + 3)

.endm

.macro lsl64 reg

	lsl32 \reg
	rol (\reg + 4)
	rol (\reg + 5)
	rol (\reg + 6)
	rol (\reg + 7)

.endm

.macro lsr64 reg

	lsr32 \reg
	ror (\reg + 4)
	ror (\reg + 5)
	ror (\reg + 6)
	ror (\reg + 7)

.endm

.macro bswap16 reg1, reg2

	eor \reg2, \reg1
	eor \reg1, \reg2
	eor \reg2, \reg1

.endm

.macro bswap32 reg1, reg2, reg3, reg4

	swap16 \reg1, \reg4
	swap16 \reg2, \reg3

.endm

.macro bswap64 reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8

	swap16 \reg1, \reg8
	swap16 \reg2, \reg7
	swap32 \reg3, \reg4, \reg5, \reg6

.endm

.macro makeWrapper name, func

\name:
	call \func
	ret

.endm

.endif
