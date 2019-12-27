	.text

_mm_malloc:
	mflr 0
	stwu 1, -0x20(1)
	cmplwi 7, 4, 1
	stw 0, 36(1)
	beq 7, .jmpMalloc

	cmplwi 7, 4, 2
	mr 5, 3
	beq 7, .do4

.memAlign:
	addi 3, 1, 0x10
	bl posix_memalign

	cmpwi 7, 3, 0
	bne 7, .ret0

	lwz 3, 16(1)

.return:
	lwz 0, 36(1)
	addi 1, 0x20
	mtlr 0
	blr

.do4:
	li 4, 4
	b .memAlign

.jmpMalloc:
	bl malloc
	b .return

.ret0:
	li 3, 0
	b .return





_mm_free:
	b free
