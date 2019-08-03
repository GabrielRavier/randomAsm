	.text

powi:
powil:
__powidf2:
__powixf2:
	push {r4, r5, r6, r7, r8, r9, r10, lr}
	multiMov "r5, r2", "r6, r0", "r7, r1", "r4, r2"

	mov r8, #0
	ldr r0, .dat
	b .startLoop

.loop:
	multiMov "r2, r6", "r3, r7", "r0, r6", "r1, r7"
	bl __aeabi_dmul

	multiMov "r6, r0", "r7, r1"

.startLoop:
	tst r4, #1
	beq .skipMul

	multiMov "r0, r8", "r1, r9", "r2, r6", "r3, r7"
	bl __aeabi_dmul

	multiMov "r8, r0", "r9, r1"

.skipMul:
	add r4, lsr #31
	asrs r4, #1
	bne .loop

	cmp r5, #0
	bge .return

	multiMov "r2, r8", "r3, r9", "r0, #0"
	ldr r1, .dat
	bl __aeabi_ddiv

	multiMov "r8, r0", "r9, r1"

.return:
	multiMov "r0, r8", "r1, r9"
	pop {r4, r5, r6, r7, r8, r9, r10, pc}

.dat:
	.word 0x3FF00000





powif:
__powisf2:
	push {r4, r5, r6, r7, r8, lr}
	multiMov "r7, r1", "r5, r0", "r4, r1", "r6, #0x3F800000"
	b .startLoop

.loop:
	multiMov "r1, r5", "r0, r5"
	bl __aeabi_fmul
	mov r5, r0

.startLoop:
	tst r4, #1
	beq .skipMul

	multiMov "r0, r6", "r1, r5"
	bl __aeabi_fmul
	mov r6, r0

.skipMul:
	add r4, lsr #31
	asrs r4, #1
	bne .loop

	cmp r7, #0
	bge .return

	multiMov "r1, r6", "r0, #0x3F800000"
	bl __aeabi_fdiv
	mov r6, r0

.return:
	mov r0, r6
	pop {r4, r5, r6, r7, r8, pc}
