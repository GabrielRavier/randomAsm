.include "standard.inc"

	.text

currentAddress:
	usualProlog
	usualSmov1
	doubleVMovB32E32 v0, s30
	usualSmov23
	usualEpilog
