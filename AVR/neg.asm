	.text

__negdi2:
	com r22
	com r23
	com r24
	com r25
	com r19
	com r20
	com r21

	neg r18
	sbci r19, -1
	sbci r20, -1
	sbci r21, -1
	sbci r22, -1
	sbci r23, -1
	sbci r24, -1
	sbci r25, -1

	ret
