global _bit_scan_reverse
global _loadbe_i16
global _storebe_i16
global _loadbe_i32
global _storebe_i32
global _loadbe_i64
global _storebe_i64

section .text align=16

	align 16
_bit_scan_reverse:
	bsr eax, edi
	ret





	align 16
_loadbe_i16:
	movbe ax, [rdi]
	ret





	align 16
_storebe_i16:
	movbe [rdi], si
	ret





	align 16
_loadbe_i32:
	movbe eax, [rdi]
	ret





	align 16
_storebe_i32:
	movbe [rdi], esi
	ret




	align 16
_loadbe_i64:
	movbe rax, [rdi]
	ret





	align 16
_storebe_i64:
	movbe [rdi], rsi
	ret
