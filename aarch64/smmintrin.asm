.include "standard.inc"

	.text
	
START_FUNC _mm_cmpeq_epi64
	cmeq v0.2d, v1.2d
	ret
END_FUNC _mm_cmpeq_epi64
	
	
	
	
	
START_FUNC _mm_mullo_epi32
	mul v0.4s, v1.4s
	ret
END_FUNC _mm_mullo_epi32
	
	
	
	
	
START_FUNC _mm_cmpgt_epi64
	cmgt v0.2d, v1.2d
	ret
END_FUNC _mm_cmpgt_epi64
