global sync_fetch_and_add_64
global sync_add_and_fetch_64
global sync_bool_compare_and_swap_64
global sync_val_compare_and_swap_64
global sync_synchronize
global sync_lock_test_and_set_64
global sync_lock_release_64

section .text align=16

	align 16
sync_fetch_and_add_64:
	mov rax, rsi
	lock xadd [rdi], rax
	ret





	align 16
sync_add_and_fetch_64:
	mov rax, rsi
	lock xadd [rdi], rax
	add rax, rsi
	ret





	align 16
sync_bool_compare_and_swap_64:
	mov eax, esi

	lock cmpxchg [rdi], rdx
	sete al

	ret





	align 16
sync_val_compare_and_swap_64:
	mov rax, rsi
	lock cmpxchg [rdi], rdx
	ret
