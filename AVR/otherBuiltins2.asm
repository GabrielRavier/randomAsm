	.text

cimagf:
cimagl:
cimag:
	ret





conjf:
conjl:
conj:
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15

	movw r8, r18
	movw r10, r20
	movw r12, r22
	movw r14, r24

	bst r15, 7
	com r15

	bld r15, 7
	com r15

	movw r20, r10
	movw r18, r8
	movw r24, r14
	movw r22, r12

	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	ret





copysignf:
copysignl:
copysign:
	bst r21, 7
	bld r25, 7
	ret





cprojf:
cprojl:
cproj:
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15

	movw r8, r18
	movw r10, r20
	movw r12, r22
	movw r14, r24

	movw r20, r10
	movw r18, r8
	movw r24, r14
	movw r22, r12

	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	ret





crealf:
creall:
creal:
	movw r24, r20
	movw r22, r18
	ret





fmaxf:
fmaxl:
fmax:
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29

	movw r12, r18
	movw r14, r20
	movw r16, r22

	mov r29, r24
	mov r28, r25
	call __gesf2

	sbrc r24, 7
	rjmp .finish

.return:
	movw r22, r16
	mov r24, r29
	mov r25, r28
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	ret

.finish:
	movw r16, r12
	mov r29, r14
	mov r28, r15
	rjmp .return





fminf:
fminl:
fmin:
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29

	movw r12, r18
	movw r14, r20
	movw r16, r22

	mov r29, r24
	mov r28, r25
	call __lesf2

	cp __zero_reg__, r24
	brge .return

	movw r16, r12
	mov r29, r14
	mov r28, r15

.return:
	movw r22, r16
	mov r24, r29
	mov r25, r28
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	ret





imaxabs:
llabs:
	push r15
	push r16
	push r17
	push r28
	push r29

	mov r17, r18
	mov r29, r19
	mov r28, r20
	mov r27, r21
	mov r31, r22
	mov r30, r23
	mov r15, r24
	mov r16, r25

	ldi r26, 0
	call __cmpdi2_s8
	brge .return

	call __negdi2

	mov r17, r18
	mov r29, r19
	mov r28, r20
	mov r27, r21
	mov r31, r22
	mov r30, r23
	mov r15, r24
	mov r16, r25

.return:
	mov r18, r17
	mov r19, r29
	mov r20, r28
	mov r21, r27
	mov r22, r31
	mov r23, r30
	mov r24, r15
	mov r25, r16

	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	ret
