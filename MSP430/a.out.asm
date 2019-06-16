N_MAGIC:
	mov @r15, r15
	ret





N_MACHTYPE:
	mov.b 2(r15), r15
	ret





N_FLAGS:
	mov 2(r15), r15
	swpb r15
	ret





N_SET_INFO:
	mov.b r13, r13
	bis r14, r13
	mov.b r12, r12
	swpb r12

	bis r12, r13
	mov r13, @r15
	mov #0, 2(r15)
	ret





N_BADMAG:
	mov @r15, r14
	mov 2(r15), r15
	and #0xFFFF, r14
	and #lhi(0xFFFF), r15

	mov r14, r12
	mov r15, r13
	add #llo(-263), r12
	addc #lhi(-263), r13

	cmp #0, r13
	jne .skip

	cmp #2, r12
	jlo .ret0

.skip:
	cmp #267, r14
	jeq .finalCheck2

.almostThere:
	mov.b #1, r13
	cmp #204, r14
	beq .finalCheck

	mov.b r13, r15
	ret

.finalCheck2:
	cmp #0, r15
	jne .almostThere

.ret0:
	mov.b #0, r13
	mov r13, r15
	ret

.finalCheck:
	cmp #0, r15
	jeq .ret0

	mov.b r13, r15
	ret
