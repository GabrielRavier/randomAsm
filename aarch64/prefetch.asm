.include "standard.inc"

	.text

.macro mkPrefetch nameRead, nameWrite, pldKeep

START_FUNC \nameRead
START_FUNC \nameWrite
	prfm \pldKeep, [x0]
	ret
END_FUNC \nameRead
END_FUNC \nameWrite

.endm

	mkPrefetch prefetchReadHighLocality, prefetchWriteHighLocality, PLDL1KEEP
	mkPrefetch prefetchReadMediumLocality, prefetchWriteMediumLocality, PLDL2KEEP
	mkPrefetch prefetchReadLowLocality, prefetchWriteLowLocality, PLDL3KEEP
	mkPrefetch prefetchReadNoLocality, prefetchWriteNoLocality, PLDL1STRM

