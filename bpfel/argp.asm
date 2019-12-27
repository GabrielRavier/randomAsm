.include "standard.inc"

	.text

START_FUNC __argp_usage
	r2 = stderr ll
	r2 = *(u64 *)(r2)
	r3 = 0x106
	call __argp_state_help
	exit
END_FUNC __argp_usage





START_FUNC __option_is_short
	r0 = 0
	r2 = *(u8 *)(r1 + 0x18)
	r2 &= 8
	if r2 != 0
		goto .LSreturn

	r1 = *(u32 *)(r1 + 8)
	r2 = r1
	r2 += -1
	to32 r2
	if r2 > 0xFE
		goto .LSreturn

	call isprint
	r1 = r0
	to32 r1
	r0 = 1
	if r1 != 0
		goto .LSreturn

	r0 = 0

.LSreturn:
	exit
END_FUNC __option_is_short





START_FUNC __option_is_end
	r0 = 0
	r2 = *(u32 *)(r1 + 8)
	if (r2 != 0)
		goto .LEreturn

	r2 = *(u64 *)(r1)
	if r2 != 0
		goto .LEreturn

	r2 = *(u64 *)(r1 + 0x20)
	if r2 != 0
		goto .LEreturn

	r1 = *(u32 *)(r1 + 0x28)
	r0 = 1
	if r1 == 0
		goto .LEreturn

	r0 = 0

.LEreturn:
	exit
END_FUNC __option_is_end
