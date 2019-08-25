	.text
	
__blcfill_u32:
	move.l 4(sp), d0
	move.l d0, d1
	addq.l #1, d1
	and.l d1, d0
	rts
	
	
	
	
	
__blci_u32:
	move.l 4(sp), d1
	move.l d1, d0
	addq.l #1, d0
	not.l d0
	or.l d1, d0
	rts
	
	
	
	
	
__blcic_u32:
	move.l 4(sp), d1
	move.l d1, d0
	not.l d0
	addq.l #1, d1
	and.l d1, d0
	rts
	
	
	
	
	
__blcmsk_u32:
	move.l 4(sp), d0
	move.l d0, d1
	addq.l #1, d1
	or.l d1, d0
	rts