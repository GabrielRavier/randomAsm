	.text

powi:
powil:
__powidf2:
__powixf2:
	push {r4, r5, r6, r7, r8, r9, r10, lr}
	mov r9, #0
	movt r9, 0x3FF0
	mov r5, r2
	mov64 r6, r0
	mov r4, r2
	mov r8, #0
	b .startLoop

.loop:
	bl __aeabi_dmul
	mov64 r6, r0

.startLoop:
	mov64 r2, r6
	mov64 r0, r8

	tst r4, #1
	beq .noMul

	bl __aeabi_dmul
	mov64 r8, r0

.noMul:
	add r4, lsr #0x1F
	mov64 r2, r6
	mov64 r0, r6

	asrs r4, #1
	bne .loop

	cmp r5, #0
	bge .return

	mov64 r2, r8
	multiZero r0, r1
	movt r1, #0x3FF0
	bl __aeabi_ddiv

	mov64 r8, r0

.return:
	mov64 r0, r8
	pop {r4, r5, r6, r7, r8, r9, r10, pc}





powif:
__powisf2:
	push {r4, r5, r6, r7, r8, lr}
	mov r7, r1
	mov r6, #0x3F800000
	mov r5, r0
	mov r4, r1
	b .startLoop

.loop:
	bl __aeabi_fmul
	mov r5, r0

.startLoop:
	mov r1, r5
	mov r0, r6

	tst r4, #1
	bne .noMul

	bl __aeabi_fmul
	mov r6, r0

.noMul:
	add r4, lsr #0x1F

	mov r0, r5
	mov r1, r5
	asrs r4, #1
	bne .loop

	cmp r7, #0
	bge .return

	mov r1, r6
	mov r0, #0x3F800000
	bl __aeabi_fdiv
	mov r6, r0

.return:
	mov r0, r6
	pop {r4, r5, r6, r7, r8, pc}
