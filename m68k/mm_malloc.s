	.text

_mm_malloc:
	link.w fp, #-4
	move.l d2, -(sp)
	move.l 8(fp), d1
	move.l 12(fp), d0
	moveq #1, d2
	cmp.l d0, d2
	jeq .jmpMalloc

	moveq #2, d2
	cmp.l d0, d2
	jeq .memAlign

	move.l d1, -(sp)
	move.l d0, -(sp)
	pea -4(fp)
	jsr posix_memalign

	lea (12, sp), sp
	tst.l d0
	jne .retNull

.return:
	move.l -4(fp), d0
	move.l -8(fp), d2
	unlk fp
	rts

.retNull:
	clr.l d0
	move.l -8(fp), d2
	unlk fp
	rts

.memAlign:
	moveq #4, d0
	move.l d1, -(sp)
	move.l d0, -(sp)
	pea -4(fp)
	jsr posix_memalign

	lea (12, sp), sp
	tst.l d0
	jne .retNull
	jra .return

.jmpMalloc:
	move.l -8(fp), d2
	unlk fp
	jra malloc





_mm_free:
	jra free
