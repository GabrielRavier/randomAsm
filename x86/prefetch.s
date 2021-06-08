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
	mov eax, [esp + 4]
	prefetcht0 [eax]
	ret





	align 16
prefetchReadMediumLocality:
prefetchWriteMediumLocality:
	mov eax, [esp + 4]
	prefetcht1 [eax]
	ret





	align 16
prefetchReadLowLocality:
prefetchWriteLowLocality:
	mov eax, [esp + 4]
	prefetcht2 [eax]
	ret





	align 16
prefetchReadNoLocality:
prefetchWriteNoLocality:
	mov eax, [esp + 4]
	prefetchnta [eax]
	ret
