	.text
	
_mm_cmpeq_epi64:
	vcmpequd 2, 3
	xxlxor 0
	vspltisw 0, -1
	xxsel 34, 0, 32, 34
	blr
	
	
	
	
	
_mm_mullo_epi32:
	vspltisw 0, -16
	vspltisw 13, 0
	vrlw 1, 3, 0
	vmulouh 3, 2, 3
	vmsumuhm 2, 1, 13
	vslw 2, 0
	vadduwm 2, 3
	blr
	
	
	
	
	
_mm_cmpgt_epi64:
	vcmpgtsd 2, 3
	xxlxor 0
	vspltisw 0, -1
	xxsel 34, 0, 32, 34
	blr