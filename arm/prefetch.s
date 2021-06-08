	.text

prefetchReadHighLocality:
prefetchReadMediumLocality:
prefetchReadLowLocality:
prefetchReadNoLocality:
prefetchWriteHighLocality:
prefetchWriteMediumLocality:
prefetchWriteLowLocality:
prefetchWriteNoLocality:
	pld [r0]
	bx lr
