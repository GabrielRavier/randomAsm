global __rold
global __rord
global __rolq
global __rorq

section .text align=16

	align 16
__rold:
	mov eax, [esp + 4]
	mov ecx, [esp + 8]
	rol eax, cl
	ret





	align 16
__rord:
	mov eax, [esp + 4]
	mov ecx, [esp + 8]
	ror eax, cl
	ret





	align 16
__rolq:
	mov edx, [esp + 12]
	and edx, 0x3F
	vmovq xmm1, [esp + 4]
	vmovd xmm0, edx
	neg edx
	and edx, 0x3F
	vpsllq xmm3, xmm1, xmm0
	vmovd xmm2, edx
	vpsrlq xmm4, xmm1, xmm2
	vpor xmm5, xmm3, xmm4
	vpsrlq xmm6, xmm5, 32
	vmovd eax, xmm5
	vmovd edx, xmm6
	ret





	align 16
__rolq:
	mov edx, [esp + 12]
	and edx, 0x3F
	vmovq xmm1, [esp + 4]
	vmovd xmm0, edx
	neg edx
	and edx, 0x3F
	vpsrlq xmm3, xmm1, xmm0
	vmovd xmm2, edx
	vpsllq xmm4, xmm1, xmm2
	vpor xmm5, xmm3, xmm4
	vpsrlq xmm6, xmm5, 32
	vmovd eax, xmm5
	vmovd edx, xmm6
	ret
