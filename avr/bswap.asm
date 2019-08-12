	.text

.macro swap16 reg1, reg2

	eor \reg2, \reg1
	eor \reg1, \reg2
	eor \reg2, \reg1

.endm

.macro swap32 reg1, reg2, reg3, reg4

	swap16 \reg1, \reg4
	swap16 \reg2, \reg3

.endm

.macro swap64 reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8

	swap16 \reg1, \reg8
	swap16 \reg2, \reg7
	swap32 \reg3, \reg4, \reg5, \reg6

.endm

bswap16:
	swap16 r25, r24
	ret





bswap32:
__bswapsi2:
	swap32 r22, r23, r24, r25
	ret





bswap64:
__bswapdi2:
	swap64 r18, r19, r20, r21, r22, r23, r24, r25
	ret
