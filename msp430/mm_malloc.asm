	.text

_mm_malloc:
	pushm.w #1, r4
	mov.w r1, r4
	sub.w #2, r1
	mov.w r12, r14

	cmp.w #1, r13
	jeq .jmpMalloc

	mov.w r4, r12
	add.w #-2, r12
	call #posix_memalign

	cmp.w #0, r12
	jeq .retPtr

	mov.b #0, r12

.return:
	add.w #2, r1
	popm.w #1, r4
	ret

.retPtr:
	mov.w -2(r4), r12
	add.w #2, r1
	popm.w #1, r4
	ret

.jmpMalloc:
	call #malloc
	br #.return





_mm_free:
	pushm.w #1, r4
	mov.w r1, r4

	call #free

	popm.w #1, r4
	ret
