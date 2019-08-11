	.text

__andn_u32:
	bic r0, r1, r0
	bx lr





__blsi_u32:
	rsb r3, r0, #0
	and r0, r3
	bx lr





__blsmsk_u32:
	sub r3, r0, #1
	eor r0, r3
	bx lr





__blsr_u32:
	sub r3, r0, #1
	and r0, r3
	bx lr





__andn_u64:
	bic r0, r2, r0
	bic r1, r3 ,r1
	bx lr





__blsi_u64:
	push {r4, r5}
	rsbs r4, r0, #0
	rsc r5, r1, #0

	and r0, r4, r0
	and r1, r5, r1
	pop {r4, r5}
	bx lr





__blsmsk_u64:
	subs r2, r0, r1
	sbc r3, r1, #0

	eor r0, r2
	eor r1, r3
	bx lr





__blsr_u64:
	subs r2, r0, #1
	sbc r3, r1, #0

	and r0, r2
	and r1, r3
	bx lr
