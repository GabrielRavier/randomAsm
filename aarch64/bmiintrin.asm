	.text

__andn_u32:
	bic w0, w1, w0
	ret





__blsi_u32:
	neg w1, w0
	and w0, w1, w0
	ret





__blsmsk_u32:
	sub w1, w0, #1
	eor w0, w1, w0
	ret





__blsr_u32:
	sub w1, w0, #1
	and w0, w1, w0
	ret





__andn_u64:
	bic x0, x1, x0
	ret





__blsi_u64:
	neg x1, x0
	and x0, x1, x0
	ret





__blsmsk_u64:
	sub x1, x0, #1
	eor x0, x1, x0
	ret





__blsr_u64:
	sub x1, x0, #1
	and x0, x1, x0
	ret
