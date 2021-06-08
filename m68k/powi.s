	.text

powif:
__powisf2:
	fsmove.s 4(sp), fp1
	move.l 8(sp), d1
	move.l d1, d0
	fmove.s #0x3F800000, fp0

.loop:
	btst #0, d0
	jeq .eq

	fsmul.x fp1, fp0

.eq:
	move.l d0
	jpl .pl

	addq.l #1, d0

.pl:
	asr.l #1, d0
	jeq .eq2

	fsmul.x fp1
	jra .loop

.eq2:
	tst.l d1
	jlt .lt

	rts

.lt:
	fmove.s #0x3F800000, fp1
	fsdiv.x fp0, fp1
	fsmove.x fp1, fp0
	rts





powi:
__powidf2:
	fdmove.d 4(sp), fp1
	move.l 12(sp), d1
	move.l d1, d0
	fmove.d #0x3FF0000000000000, fp0

.loop:
	btst #0, d0
	jeq .eq

	fdmul.x fp1, fp0

.eq:
	move.l d0
	jpl .pl

	addq.l #1, d0

.pl:
	asr.l #1, d0
	jeq .eq

	fdmul.x fp1
	jra .loop

.eq:
	tst.l d1
	jlt .lt

	rts

.lt:
	fmove.d #0x3FF0000000000000, fp1
	fddiv.x fp0, fp1
	fdmove.x fp1, fp0
	rts
