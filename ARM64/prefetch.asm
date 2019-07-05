	.text

prefetchReadHighLocality:
prefetchWriteHighLocality:
	prfm PLDL1KEEP, [x0]
	ret





prefetchReadMediumLocality:
prefetchWriteMediumLocality:
	prfm PLDL2KEEP, [x0]
	ret





prefetchReadLowLocality:
prefetchWriteLowLocality:
	prfm PLDL3KEEP, [x0]
	ret





prefetchReadNoLocality:
prefetchWriteNoLocality:
	prfm PLDL1STRM, [x0]
	ret
