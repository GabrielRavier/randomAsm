	.text
	
_mm_cmpeq_epi64:
	cmeq v0.2d, v1.2d
	ret
	
	
	
	
	
_mm_mullo_epi32:
	mul v0.4s, v1.4s
	ret
	
	
	
	
	
_mm_cmpgt_epi64:
	cmgt v0.2d, v1.2d
	ret