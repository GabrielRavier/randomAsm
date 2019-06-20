bzero:
	mv a2, a1
	li a1, 0
	tail memset





ffsll:
	lui a2, 0x55555
	addi t1, a2, 0x555

	lui a2, 0x33333
	addi a5, a2, 0x333

	lui a2, 0xF0F1
	addi a6, a2, -0xF1

	lui a2, 0x1010
	addi a7, a2, 0x101

	li a2, 0

	bnez a0, .not0

	addi a3, a1, -1
	not a4, a1
	and a3, a4
	srli a4, a3, 1
	and a4, t1
	sub a3, a4
	and a4, a3, a5
	srli a3, 2

	and a3, a5
	add a3, a4
	srli a4, a3, 4

	add a3, a4
	and a3, a6
	mul a3, a7
	srli a3, 24
	addi a3, 32

	or a0, a1
	bne a0, a2, .retA3Plus1
	j .retA2

.not0:
	addi t0, a0, -1
	not a4, a0
	and a4, t0
	srli a3, a4, 1

	and a3, t1
	sub a3, a4, a3
	and a4, a3, a5
	srli a3, 2

	and a3, a5
	add a3, a4
	srli a4, a3, 4

	add a3, a4
	and a3, a6
	mul a3, a7
	srli a3, 24

	or a0, a1
	beq a0, a2, .retA2

.retA3Plus1:
	addi a2, a3, 1

.retA2:
	mv a0, a2
	ret





ffsl:
ffs:
	li a1, 0
	beqz a0, .retA1

	addi a1, a0, -1
	not a0
	and a0, a1

	lui a1, 0x55555
	addi a1, 0x555
	srli a2, a0, 1

	and a1, a2
	sub a0, a1

	lui a1, 0x33333
	addi a1, 0x333
	and a2, a0, a1
	srli a0, 2

	and a0, a1
	add a0, a2
	srli a1, a0, 4

	add a0, a1
	lui a1, 0xF0F1
	addi a1, -0xF1
	and a0, a1

	lui a1, 0x1010
	addi a1, 0x101
	mul a0, a1
	srli a0, 24
	addi a1, a0, 1

.retA1:
	mv a0, a1
	ret





mempcpy:
	addi sp, -0x10
	sw ra, 12(sp)
	sw s0, 8(sp)
	sw s1, 4(sp)
	mv s0, a2
	mv s1, a0

	call memcpy
	add a0, s1, s0
	lw s1, 4(sp)
	lw s0, 8(sp)
	lw ra, 12(sp)
	addi sp, 0x10
	ret





signbit:
	addi sp, -0x10
	sw a0, 0(sp)
	sw a1, 4(sp)
	fld ft0, 0(sp)
	fsd ft0, 8(sp)
	lw a0, 12(sp)
	srli a0, 31
	addi sp, 0x10
	ret





signbitf:
	srli a0, 31
	ret





signbitl:
	lw a0, 12(a0)
	srli a0, 31
	ret
