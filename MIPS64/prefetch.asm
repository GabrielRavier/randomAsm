	.text

prefetchReadHighLocality:
	j $31
	pref 6, 0($4)





prefetchReadMediumLocality:
prefetchReadLowLocality:
	j $31
	pref 0, 0($4)





prefetchReadNoLocality:
	j $31
	pref 4, 0($4)





prefetchWriteHighLocality:
	j $31
	pref 7, 0($4)





prefetchWriteMediumLocality:
prefetchWriteLowLocality:
	j $31
	pref 1, 0($4)





prefetchWriteNoLocality:
	j $31
	pref 5, 0($4)
