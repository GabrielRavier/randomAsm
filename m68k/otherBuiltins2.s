	.text

cabs:
	fdmove.d 4(sp), fp0
	fdmul.x fp0

	fdmove.d 12(sp), fp1
	fdmul.x fp1

	fdadd.x fp1, fp0
	fdsqrt.x fp0
	rts





carg:
	fdmove.d 12(sp), fp0
	move.l 4(sp), 12(sp)
	move.l 8(sp), 16(sp)
	fmove.d fp0, 4(sp)
	jra atan2





cimagf:
	fsmove.s 8(sp), fp0
	rts





cimag:
	fdmove.d 12(sp), fp0
	rts





cimagl:
	fmove.x 16(sp), fp0
	rts





conjf:
	move.l 4(sp), d0
	move.l 8(sp), d1
	bchg #0x1F, d1
	rts





conj:
	move.l 4(sp), d0
	move.l 8(sp), d1
	move.l d0, (a0)
	move.l d1, 4(a0)

	fdneg.d 12(sp),	fp0
	fmove.d fp0, 8(a0)

	move.l a0, d0
	rts





conjl:
	fmove.x 4(sp), fp0
	fmove.x fp0, (a0)
	fneg.x 16(sp), fp0
	fmove.x fp0, 12(a0)
	move.l a0, d0
	rts





copysignf:
	fsabs.s 4(sp), fp0
	tst.l 8(sp)
	jge .noNeg

	fsneg.x fp0

.noNeg:
	rts





copysign:
	fdabs.d 4(sp), fp0
	tst.l 12(sp)
	jge .noNeg

	fsneg.x fp0

.noNeg:
	rts





copysignl:
	fabs.x 4(sp), fp0
	tst.l 16(sp)
	jge .noNeg

	fneg.x fp0

.noNeg:
	rts





cprojf:
	move.l 4(sp), d0
	move.l 8(sp), d1
	rts





cproj:
	move.l 4(sp), d0
	move.l 8(sp), d1
	move.l d0, (a0)
	move.l d1, 4(a0)

	move.l 12(sp), d0
	move.l 16(sp), d1
	move.l d0, 8(a0)
	move.l d1, 12(a0)

	move.l a0, d0
	rts





cprojl:
	fmove.x 4(sp), fp0
	fmove.x fp0, (a0)

	fmove.x 16(sp), fp0
	fmove.x fp0, 12(a0)

	move.l a0, d0
	rts





crealf:
	fsmove.s 4(sp), fp0
	rts





creal:
	fdmove.d 4(sp), fp0
	rts





creall:
	fmove.x 4(sp), fp0
	rts





fmaxf:
	move.l 8(sp), d0
	fsmove.s 4(sp), fp0
	fcmp.s d0, fp0
	fjge .noMov

	fsmove.s d0, fp0

.noMov:
	rts





fmax:
	fdmove.d 4(sp), fp0
	fcmp.d 12(sp), fp0
	fjge .noMov

	fdmove.d 12(sp), fp0

.noMov:
	rts





fmaxl:
	fmove.x 4(sp), fp0
	fcmp.x 16(sp), fp0
	fjge .noMov

	fmove.x 16(sp), fp0

.noMov:
	rts





fminf:
	move.l 8(sp), d0
	fsmove.s 4(sp), fp0
	fcmp.s d0, fp0
	fjle .noMov

	fsmove.s d0, fp0

.noMov:
	rts





fmin:
	fdmove.d 4(sp), fp0
	fcmp.d 12(sp), fp0
	fjle .noMov

	fdmove.d 12(sp), fp0

.noMov:
	rts





fminl:
	fmove.x 4(sp), fp0
	fcmp.x 16(sp), fp0
	fjle .noMov

	fmove.x 16(sp), fp0

.noMov:
	rts





imaxabs:
llabs:
	move.l 4(sp), d0
	move.l 8(sp), d1
	tst.l d0
	jmi .doNeg

	rts

.doNeg:
	neg.l d1
	negx.l d0
	rts
