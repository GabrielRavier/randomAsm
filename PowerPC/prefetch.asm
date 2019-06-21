prefetchReadHighLocality:
prefetchReadMediumLocality:
prefetchReadLowLocality:
prefetchReadNoLocality:
	dcbt 0, 3
	blr





prefetchWriteHighLocality:
prefetchWriteMediumLocality:
prefetchWriteLowLocality:
prefetchWriteNoLocality:
	dcbtst 0, 3
	blr
