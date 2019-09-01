.include "standard.inc"

	.text

sync_fetch_and_add_32:
	usualProlog
	waitBeforeAtomic
	flat_atomic_add v0, v[0:1], v2 glc
	waitAfterLoad
	invalidateBuffers
	buffer_gl0_inv
	buffer_gl1_inv
	usualSmov123
	s_waitcnt lgkmcnt(0)
	usualEpilog





sync_fetch_and_add_32:
	usualProlog
	waitBeforeAtomic
	flat_atomic_add v0, v[0:1], v2 glc
	waitAfterLoad
	invalidateBuffers
	usualSmov123
	s_waitcnt lgkmcnt(0)
	v_add_nc_u32_e32 v0, v2
	usualEpilog





sync_bool_compare_and_swap_32:
	usualProlog
	v_mov_b32_e32 v6, v3
	v_mov_b32_e32 v7, v2
	usualSmov12
	waitBeforeAtomic
	flat_atomic_cmpswap v0, v[0:1], v[6:7] glc
	waitAfterLoad
	invalidateBuffers
	usualSmov3
	s_waitcnt lgkmcnt(0)
	v_cmp_eq_u32_e32 vcc_lo, v0, v7
	v_cndmask_b32_e64 v0, 0, 1, vcc_lo
	usualEpilog





sync_bool_compare_and_swap_32:
	usualProlog
	v_mov_b32_e32 v6, v3
	v_mov_b32_e32 v7, v2
	usualSmov12
	waitBeforeAtomic
	flat_atomic_cmpswap v0, v[0:1], v[6:7] glc
	waitAfterLoad
	invalidateBuffers
	usualSmov3
	s_waitcnt lgkmcnt(0)
	usualEpilog





sync_synchronize:
	usualProlog
	usualSmov12
	waitBeforeAtomic
	invalidateBuffers
	usualSmov3
	usualEpilog





sync_lock_test_and_set_32:
	usualProlog
	waitBeforeAtomic
	flat_atomic_swap v0, v[0:1], v2 glc
	waitAfterLoad
	invalidateBuffers
	usualSmov123
	s_waitcnt lgkmcnt(0)
	usualEpilog





sync_lock_release_32:
	usualProlog
	usualSmov1
	v_mov_b32_e32 v2, 0
	usualSmov23
	waitBeforeAtomic
	flat_store_dword v[0:1], v2
	waitAfterStore
	usualEpilog
