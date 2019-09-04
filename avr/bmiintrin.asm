.include "standard.inc"

	.text

__andn_u32:
	com16 r24
	and16 r24
	ret





__blsi_u32:
	clr16 r18
	sub16 r18, r24
	and16 r24, r18
	ret





__blsmsk_u32:
	movw r18, r24
	subi16 r18, 1
	eor16 r24, r18
	ret





__blsr_u32:
	movw r18, r24
	subi16 r18, 1
	and16 r24, r18
	ret





__andn_u64:
	multiPush r8, r9, r10, r11, r12, r13, r14, r15, r16, r17
	com16 r24, r25
	and16 r24, r16
	multiPop r17, r16, r15, r14, r13, r12, r11, r10, r9, r8
	ret





__blsi_u64:
	clr16 r18
	sub16 r18, r24
	and16 r24, r18
	ret





__blsmsk_u64:
	movw r18, r24
	subi16 r18, 1
	eor16 r24, r18
	ret





__blsr_u64:
	movw r18, r24
	subi16 r18, 1
	and16 r24, r18
	ret
