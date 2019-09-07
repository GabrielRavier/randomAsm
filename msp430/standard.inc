.ifndef STANDARD_INC
.set STANDARD_INC 1

.macro START_FUNC name

	.b2align 2
	.global \name
	.type \name, @function
\name:

.endm

.macro END_FUNC name

	.size \name, . - \name

.endm

.macro mov32 src, dest

	mov.w \src, \dest
	mov.w (\src + 1), (\dest + 1)

.endm

.macro mov64 src, dest

	mov32 \src, \dest
	mov32 (\src + 2), (\dest + 2)

.endm

.macro bis32 src, dest

	bis.w \src, \dest
	bis.w (\src + 1), (\dest + 1)

.endm

.endif
