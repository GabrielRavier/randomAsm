.ifndef STANDARD_INC
.set STANDARD_INC 1

.macro usualProlog

	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	s_waitcnt_vscnt null, 0

.endm

.endif
