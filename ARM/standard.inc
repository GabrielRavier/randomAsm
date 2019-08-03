.ifndef STANDARD_INC
.set STANDARD_INC 1

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
	lsl \reg, #0x10
	lsr \reg, #0x10
.endm

.endif
