	.text

prefetchReadHighLocality:
prefetchReadMediumLocality:
prefetchReadLowLocality:
prefetchReadNoLocality:
	dcbt 0, 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





prefetchWriteHighLocality:
prefetchWriteMediumLocality:
prefetchWriteLowLocality:
prefetchWriteNoLocality:
	dcbtst 0, 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
