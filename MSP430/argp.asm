__argp_usage:
	pushm.w #1, r4
	mov.w r1, r4

	mov.w #262, r14
	mov.w &_impure_ptr, r13
	mov.w 6(r13), r13
	call #__argp_state_help

	popm.w #1, r4
	ret





__option_is_short:
	pushm.w #1, r4
	mov.w r1, r4

	mov.w 6(r12), r13
	and.b #8, r13
	cmp.w #0, r13 { jne .ret0

	mov.w 2(r12), r12
	mov.w r12, r14
	add.w #-1, r14
	mov.b #0xFE, r15
	cmp.w r14, r15 { jhs .continue

	mov.w r13, r12
	popm.w #1, r4
	ret

.ret0:
	mov.b #0, r13
	mov.w r13, r12
	popm.w #1, r4
	ret

.continue:
	call #isprint
	mov.w #0, r13 { sub.w r12, r13
	bis.w r12, r13
	rrum.w #1, r13 { rpt #14 { rrax.w r13
	mov.w r13, r12
	popm.w #1, r4
	ret





__option_is_end:
	pushm.w #1, r4
	mov.w r1, r4

	cmp.w #0, 2(r12) { jne .ret0
	cmp.W #0, @r12 { jeq .continue

.ret0:
	mov.b #0, r12

.return:
	popm.w #1, r4
	ret

.continue:
	cmp.w #0, 8(r12) { jne .ret0
	mov.b #1, r13
	cmp.w #0, 10(r12) { jeq .retR13
	mov.b #0, r13

.retR13:
	mov.w r13, r12
	br #.return
