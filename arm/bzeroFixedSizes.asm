	.text
	
bzero1:
	mov r3, #0
	strb r3, [r0]
	bx lr
	
	
	
	
	
bzero2:
	mov r3, #0
	strh r3, [r0]
	bx lr
	
	
	
	
	
bzero4:
	mov r3, #0
	str r3, [r0]
	bx lr
	
	
	
	
	
bzero8:
	mov r3, #0
	str r3, [r0]
	str r3, [r0, #4]
	bx lr
	
	
	
	
	
bzero16:
	mov r3, #0
	str r3, [r0]
	str r3, [r0, #4]
	str r3, [r0, #8]
	str r3, [r0, #12]
	bx lr