.include "standard.inc"

	.text

.macro mkPrefetch name, pKeep

START_FUNC \name
	prfm \pKeep, [x0]
	ret
END_FUNC \name

.endm

	mkPrefetch prefetchReadHighLocality, PLDL1KEEP
	mkPrefetch prefetchReadMediumLocality, PLDL2KEEP
	mkPrefetch prefetchReadLowLocality, PLDL3KEEP
	mkPrefetch prefetchReadNoLocality, PLDL1STRM
	mkPrefetch prefetchWriteHighLocality, PSTL1KEEP
	mkPrefetch prefetchWriteMediumLocality, PSTL2KEEP
	mkPrefetch prefetchWriteLowLocality, PSTL3KEEP
	mkPrefetch prefetchWriteNoLocality, PSTL1STRM

