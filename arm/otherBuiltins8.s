.include "standard.inc"

	.text

isfinite:
	push {r4, r5, r6, lr}
	mov r6, r0
	bic r5, r1, #0x80000000

	mov r0, r6
	mvn r2, #0
	movw r3, #0xFFFF
	movt r3, 0x7FEF
	mov r1, r5
	mov r4, #1
	bl __aeabi_dcmpun

	cmp r0, #0
	bne .not0

	mov r0, r6
	mvn r2, #0
	movw #0xFFFF
	movt 0x7FEF
	mov r1, r5
	bl __aeabi_dcmpgt

	cmp r0, #0
	moveq r4, r0

.not0:
	eor r0, r4, #1
	and r0, #1
	pop {r4, r5, r6, pc}





isnormal:
	push {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	bic r5, r1, #0x80000000

	mov r0, r6
	mvn r2, #0
	movw r3, #0xFFFF
	movt r3, 0x7FEF
	mov r1, r5
	mov r4, #1
	bl __aeabi_dcmpun

	cmp r0, #0
	bne .not0

	mov r0, r6
	mvn r2, #0
	movw r3, #0xFFFF
	movt r3, 0x7FEF
	mov r1, r5
	bl __aeabi_dcmpgt

	cmp r0, #0
	moveq r4, r0

.not0:
	mov r0, r6
	mov r2, #0
	mov r3, #0x100000
	mov r1, r5
	bl __aeabi_dcmpun

	mov r7, #1
	cmp r0, #0
	bne .not02

	mov r0, r6
	mov r2, #0
	mov r3, #0x100000
	mov r1, r5
	bl __aeabi_dcmplt

	cmp r0, #0
	moveq r7, r0

.not02:
	orr r0, r4, r7
	eor r0, #1
	and r0, #1
	pop {r4, r5, r6, r7, r8, pc}





isinf_sign:
	push {r4, r5, r6, lr}
	mov r5, r0
	bic r4, r1, #0x80000000

	mov r6, r1
	mov r0, r5
	mov r1, r4
	mvn r2, #0
	movw r3, #0xFFFF
	movt r3, 0x7FEF
	bl __aeabi_dcmpun

	cmp r0, #0
	bne .ret0

	mov r0, r5
	mvn r2, #0
	movw r3, #0xFFFF
	movt r3, 0x7FEF
	mov r1, r4
	bl __aeabi_dcmple

	cmp r0, #0
	bne .ret0

	cmp r6, #0
	mvnlt r0, #0
	movge r0, #1
	pop {r4, r5, r6, pc}

.ret0:
	mov r0, #0
	pop {r4, r5, r6, pc}





fpclassify:
	push {r4, r5, r6, lr}
	mov r4, r0
	bic r5, r1, #0x80000000

	mov r6, r1
	mov r2, r4
	mov r0, r4
	mov r3, r5
	mov r1, r5
	bl __aeabi_dcmpun

	cmp r0, #0
	bne .ret0

	mov r0, r4
	mvn r2, #0
	movw r3, #0xFFFF
	movt r3, 0x7FEF
	mov r1, r5
	bl __aeabi_dcmpun

	cmp r0, #0
	bne .checkGeEq

	mov r0, r4
	mvn r2, #0
	movw r3, #0xFFFF
	movt r3, 0x7FEF
	mov r1, r5
	bl __aeabi_dcmple

	cmp r0, #0
	bne .checkGeEq

	mov r0, #1
	pop {r4, r5, r6, pc}

.checkGeEq:
	mov64 r0, r4
	mov r2, #0
	mov r3, #0x100000
	bl __aeabi_dcmpge

	cmp r0, #0
	bne .ret4

	mov r0, r4
	multiZero r2, r3
	mov r1, r6
	bl __aeabi_dcmpeq

	cmp r0, #0
	movEqNe r0, #3, #2
	pop {r4, r5, r6, pc}

.ret4:
	mov r0, #4
	pop {r4, r5, r6, pc}

.ret0:
	mov r0, #0
	pop {r4, r5, r6, pc}
