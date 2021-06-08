global bswap16
global bswap32
global bswap64

section .text align=16

	align 16
bswap16:
	movzx eax, word [esp + 4]
	rol ax, 8
	ret





	align 16
bswap32:
	mov eax, [esp + 4]
	bswap eax
	ret





	align 16
bswap64:
	mov edx, [esp + 4]
	mov eax, [esp + 8]
	bswap edx
	bswap eax
	ret
