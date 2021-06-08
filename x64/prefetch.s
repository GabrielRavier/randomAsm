global prefetchReadHighLocality
global prefetchReadMediumLocality
global prefetchReadLowLocality
global prefetchReadNoLocality
global prefetchWriteHighLocality
global prefetchWriteMediumLocality
global prefetchWriteLowLocality
global prefetchWriteNoLocality

section .text align=16

	align 16
prefetchReadHighLocality:
prefetchWriteHighLocality:
	prefetcht0 [rdi]
	ret





	align 16
prefetchReadMediumLocality:
prefetchWriteMediumLocality:
	prefetcht1 [rdi]
	ret





	align 16
prefetchReadLowLocality:
prefetchWriteLowLocality:
	prefetcht2 [rdi]
	ret





	align 16
prefetchReadNoLocality:
prefetchWriteNoLocality:
	prefetchnta [rdi]
	ret
