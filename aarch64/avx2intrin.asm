	.text

_mm256_add_epi8:
	ld1 {v4.16b - v5.16b}, [x0]
	ld1 {v2.16b - v3.16b}, [x1]

	add v0.16b, v4.16b, v2.16b
	add v1.16b, v5.16b, v3.16b

	st1 {v0.16b - v1.16b}, [x8]
	ret





_mm256_add_epi16:
	ld1 {v4.16b - v5.16b}, [x0]
	ld1 {v2.16b - v3.16b}, [x1]

	add v0.8h, v4.8h, v2.8h
	add v1.8h, v5.8h, v3.8h

	st1 {v0.16b - v1.16b}, [x8]
	ret





_mm256_add_epi32:
	ld1 {v4.16b - v5.16b}, [x0]
	ld1 {v2.16b - v3.16b}, [x1]

	add v0.4s, v4.4s, v2.4s
	add v1.4s, v5.4s, v3.4s

	st1 {v0.16b - v1.16b}, [x8]
	ret





_mm256_add_epi64:
	ld1 {v4.16b - v5.16b}, [x0]
	ld1 {v2.16b - v3.16b}, [x1]

	add v0.2d, v4.2d, v2.2d
	add v1.2d, v5.2d, v3.2d

	st1 {v0.16b - v1.16b}, [x8]
	ret






_mm256_and_si256:
	ld1 {v4.16b - v5.16b}, [x0]
	ld1 {v2.16b - v3.16b}, [x1]

	and v0.16b, v4.16b, v2.16b
	and v1.16b, v5.16b, v3.16b

	st1 {v0.16b - v1.16b}, [x8]
	ret





_mm256_mullo_epi16:
	ld1 {v4.16b - v5.16b}, [x0]
	ld1 {v2.16b - v3.16b}, [x1]

	mul v0.8h, v4.8h, v2.8h
	mul v1.8h, v5.8h, v3.8h

	st1 {v0.16b - v1.16b}, [x8]
	ret





_mm256_mullo_epi32:
	ld1 {v4.16b - v5.16b}, [x0]
	ld1 {v2.16b - v3.16b}, [x1]

	mul v0.4s, v4.4s, v2.4s
	mul v1.4s, v5.4s, v3.4s

	st1 {v0.16b - v1.16b}, [x8]
	ret





_mm256_or_si256:
	ld1 {v4.16b - v5.16b}, [x0]
	ld1 {v2.16b - v3.16b}, [x1]

	orr v0.16b, v4.16b, v2.16b
	orr v1.16b, v5.16b, v3.16b

	st1 {v0.16b - v1.16b}, [x8]
	ret





_mm256_sub_epi8:
	ld1 {v4.16b - v5.16b}, [x0]
	ld1 {v2.16b - v3.16b}, [x1]

	sub v0.16b, v4.16b, v2.16b
	sub v1.16b, v5.16b, v3.16b

	st1 {v0.16b - v1.16b}, [x8]
	ret





_mm256_add_epi16:
	ld1 {v4.16b - v5.16b}, [x0]
	ld1 {v2.16b - v3.16b}, [x1]

	sub v0.8h, v4.8h, v2.8h
	sub v1.8h, v5.8h, v3.8h

	st1 {v0.16b - v1.16b}, [x8]
	ret





_mm256_add_epi32:
	ld1 {v4.16b - v5.16b}, [x0]
	ld1 {v2.16b - v3.16b}, [x1]

	sub v0.4s, v4.4s, v2.4s
	sub v1.4s, v5.4s, v3.4s

	st1 {v0.16b - v1.16b}, [x8]
	ret





_mm256_add_epi64:
	ld1 {v4.16b - v5.16b}, [x0]
	ld1 {v2.16b - v3.16b}, [x1]

	sub v0.2d, v4.2d, v2.2d
	sub v1.2d, v5.2d, v3.2d

	st1 {v0.16b - v1.16b}, [x8]
	ret





_mm256_xor_si256:
	ld1 {v4.16b - v5.16b}, [x0]
	ld1 {v2.16b - v3.16b}, [x1]

	eor v0.16b, v4.16b, v2.16b
	eor v1.16b, v5.16b, v3.16b

	st1 {v0.16b - v1.16b}, [x8]
	ret
