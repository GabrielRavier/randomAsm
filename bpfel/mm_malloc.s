.include "standard.inc"

	.text

START_FUNC _mm_malloc
	r3 = r1
	if r2 == 4
		goto .Lr28

	if r2 == 2
		goto .Lr28

	if r2 != 1
		goto .Lcontinue

	r1 = r3
	call malloc
	exit

.Lr28:
	r2 = 8

.Lcontinue:
	r1 = r10
	r1 += -8
	call posix_memalign
	r1 = r0
	to32 r1
	r0 = *(u64 *)(r10 - 8)
	if r1 == 0
		goto .Lreturn

	r0 = 0

.Lreturn:
	exit
END_FUNC _mm_malloc





START_FUNC _mm_free
	call free
	exit
END_FUNC _mm_free
