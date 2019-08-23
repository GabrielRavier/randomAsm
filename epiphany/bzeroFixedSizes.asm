	.text
	
bzero1:
	mov r1, #0
	strb r1, [r0]
	rts
	
	
	
	
	
bzero2:
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	rts
	
	
	
	
	
bzero4:
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	rts