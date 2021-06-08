.include "standard.inc"

	.text
	
__blcfill_u32:
	multiPush r16, r17
	mov32 r16, r22
	
	subi32 r16, -1
	
	and32 r22, r16
	multiPop r17, r16
	ret
	
	
	
	
	
__blci_u32:
	multiPush r16, r17
	mov32 r16, r22
	
	subi32 r16, -1
	
	com32 r16
	or32 r22, r16
	multiPop r17, r16
	ret
	
	
	
	
	
__blcic_u32:
	multiPush r16, r17
	mov32 r16, r22
	com32 r16
	movw r26, r24
	movw r24, r22
	
	adiw r24, 1
	
	.irp reg, r26, r27
	
		adc \reg, __zero_reg__
		
	.endr
	
	mov32 r22, r24
	and32 r22, r16
	multiPop r17, r16
	ret
	
	
	
	
	
__blcmsk_u32:
	multiPush r16, r17
	mov32 r16, r22
	subi32 r16, -1
	eor32 r22, r16
	multiPop r17, r16
	ret
	
	
	
	
	
__blcs_u32:
	multiPush r16, r17
	mov32 r16, r22
	subi32 r16, -1
	or32 r22, r16
	multiPop r17, r16
	ret
	
	
	
	
	
__blsfill_u32:
	multiPush r16, r17
	mov32 r16, r22
	subi32 r16, -1
	or32 r22, r16
	multiPop r17, r16
	ret
	
	
	
	
	
__blsic_u32:
	multiPush r16, r17
	mov32 r16, r22
	com32 r16
	movw r26, r24
	movw r24, r22
	
	sbiw r24, 1
	
	.irp reg, r26, r27
	
		sbc \reg, __zero_reg__
		
	.endr
	
	mov32 r22, r24
	or32 r22, r16
	multiPop r17, r16
	ret
	
	
	
	
	
__t1mskc_u32:
	multiPush r16, r17
	mov32 r16, r22
	com32 r16
	movw r26, r24
	movw r24, r22
	
	adiw r24, 1
	
	.irp reg, r26, r27
	
		adc \reg, __zero_reg__
		
	.endr
	
	mov32 r22, r24
	or32 r22, r16
	multiPop r17, r16
	ret
	
	
	
	
	
__tzmsk_u32:
	multiPush r16, r17
	mov32 r16, r22
	com32 r16
	movw r26, r24
	movw r24, r22
	
	sbiw r24, 1
	
	.irp reg, r26, r27
	
		sbc \reg, __zero_reg__
		
	.endr
	
	mov32 r22, r24
	and32 r22, r16
	multiPop r17, r16
	ret
	
	
	
	
	
__blcfill_u64:
	multiPush r15, r16, r17, r28, r29
	
	mov r17, r18
	mov r29, r19
	mov r28, r20
	mov r27, r21
	mov r31, r22
	mov r30, r23
	mov r15, r24
	mov r16, r25
	
	ldi r26, lo8(1)
	call __adddi3_s8
	
	and r18, r17
	and r19, r29
	and r20, r28
	and r21, r27
	and r22, r31
	and r23, r30
	
	and16 r24, r15
	multiPop r29, r28, r17, r16, r15
	ret
	
	
	
	
	
__blci_u64:
	multiPush r15, r16, r17, r28, r29
	mov r17, r18
	mov r29, r19
	mov r28, r20
	mov r27, r21
	mov r31, r22
	mov r30, r23
	mov r15, r24
	mov r16, r25
	
	ldi r26, lo8(1)
	call __adddi3_s8
	
	com64 r18
	
	or r18, r17
	or r19, r29
	or r20, r28
	or r21, r27
	or r22, r31
	or r23, r30
	
	or16 r24, r15
	multiPop r29, r28, r17, r16, r15
	ret
	
	
	
	
	
__blcic_u64:
	multiPush r15, r16, r17, r28, r29
	
	movw r15, r18
	mov r17, r20
	mov r29, r21
	mov r28, r22
	mov r27, r23
	mov r31, r24
	mov r30, r25
	
	com16 r15
	com r17
	com r29
	com r28
	com r27
	com r31
	com r30
	
	ldi r26, lo8(1)
	call __adddi3_s8
	
	and16 r18, r15
	and r20, r17
	and r21, r29
	and r22, r28
	and r23, r27
	and r24, r31
	and r25, r30
	
	multiPop r29, r28, r17, r16, r15
	ret
	
	
	
	
	
__blcmsk_u64:
	multiPush r15,- r16, r17, r28, r29
	
	mov r17, r18
	mov r29, r19
	mov r28, r20
	mov r27, r21
	mov r31, r22
	mov r30, r23
	movw r15, r24
	
	ldi r26, lo8(1)
	call __adddi3_s8
	
	eor r18, r17
	eor r19, r29
	eor r20, r28
	eor r21, r27
	eor r22, r31
	eor r23, r30
	
	eor16 r24, r15
	multiPop r29, r28, r17, r16, r15
	ret
	
	
	
	
	
__blcs_u64:
	multiPush r15, r16, r17, r28, r29
	
	mov r17, r18
	mov r29, r19
	mov r28, r20
	mov r27, r21
	mov r31, r22
	mov r30, r23
	movw r15, r24
	
	ldi r26, lo8(1)
	call __adddi3_s8
	
	or r18, r17
	or r19, r29
	or r20, r28
	or r21, r27
	or r22, r31
	or r23, r30
	
	or16 r24, r15
	multiPop r29, r28, r17, r16, r15
	ret
	
	
	
	
	
__blsfill_u64:
	multiPush r15, r16, r17, r28, r29
	
	mov r17, r18
	mov r29, r19
	mov r28, r20
	mov r27, r21
	mov r31, r22
	mov r30, r23
	movw r15, r24
	
	ldi r26, lo8(-1)
	call __adddi3_s8
	
	or r18, r17
	or r19, r29
	or r20, r28
	or r21, r27
	or r22, r31
	or r23, r30
	
	or16 r24, r15
	multiPop r29, r28, r17, r16, r15
	ret
	
	
	
	
	
__blsic_u64:
	multiPush r15, r16, r17, r28, r29
	
	movw r15, r18
	mov r17, r20
	mov r29, r21
	mov r28, r22
	mov r27, r23
	mov r31, r24
	mov r30, r25
	
	com16 r15
	com r17
	com r29
	com r28
	com r27
	com r31
	com r30
	
	ldi r26, lo8(-1)
	call __adddi3_s8
	
	or16 r18, r15
	or r20, r17
	or r21, r29
	or r22, r28
	or r23, r27
	or r24, r31
	or r25, r30
	
	multiPop r29, r28, r17, r16, r15
	ret
	
	
	
	
	
__t1mskc_u64:
	multiPush r15, r16, r17, r28, r29
	
	movw r15, r18
	mov r17, r20
	mov r29, r21
	mov r28, r22
	mov r27, r23
	mov r31, r24
	mov r30, r25
	
	com16 r15
	com r17
	com r29
	com r28
	com r27
	com r31
	com r30
	
	ldi r26, lo8(1)
	call __adddi3_s8
	
	or16 r18, r15
	or r20, r17
	or r21, r29
	or r22, r28
	or r23, r27
	or r24, r31
	or r25, r30
	
	multiPop r29, r28, r17, r16, r15
	ret
	
	
	
	
	
__tzmsk_u64:
	multiPush r15, r16, r17, r28, r29
	
	movw r15, r18
	mov r17, r20
	mov r29, r21
	mov r28, r22
	mov r27, r23
	mov r31, r24
	mov r30, r25
	
	com16 r15
	com r17
	com r29
	com r28
	com r27
	com r31
	com r30
	
	ldi r26, lo8(-1)
	call __adddi3_s8
	
	and16 r18, r15
	and r20, r17
	and r21, r29
	and r22, r28
	and r23, r27
	and r24, r31
	and r25, r30
	
	multiPop r29, r28, r17, r16, r15
	ret
