.include "standard.inc"

	.text

__muldi3_6:
	call __umulhisi3

	add16 r20, r22
	adc r28, r24
	adc r29, r25
	brcc .return

	adiw r30, 1

.return:
	ret





__mulsi3:
	movw r26, r22
	multiPush r24, r25
	call __muluhisi3
	multiPop r27, r26

	mul r26, r18
	add16 r24, r0

	mul r26, r11
	add r25, r0
	mul r27, r18
	add r25, r0

	clr __zero_reg__
	ret





__muluhisi3:
	call __umulhisi3

	mul r26, r21
	add r25, r0
	mul r27, r20
	add r25, r0
	mul r26, r20
	add16 r24, r0
	clr __zero_reg__
	ret





__muldi3:
	multiPush r29, r28, r17, r16

	mul r25, r10
	mul r31, r0

	mul r18, r17
	add r31, r0

	mul r24, r11
	add r31, r0

	mul r24, r10
	mov r30, r0
	add r31, r1

	mul r16, r19
	add r31, r0

	mul r16, r18
	add16 r30, r0

	mul r20, r14
	add16 r30, r0

	mul r21, r14
	add r31, r0

	mul r20, r15
	add r31, r0

	multiPush r23, r22, r11, r10, r21, r20

	movw r26, r10
	call __umulhisi3
	movw r16, r22
	movw r20, r24

	movw r26, r14
	call __umulhisi3
	movw r28, r22
	add16 r30, r24

	movw r26, r12
	call __muldi3_6

	multiPop r18, r19

	movw r26, r12
	call __umulhisi3
	add32 r28, r22

	multiPop r26, r27
	call __muldi3_6

	multiPop r18, r19

	call __umulhisi3
	add32 r28, r22

	movw r26, r12
	call __umulhisi3
	add16 r30, r22

	movw r18, r16
	mov32 r22, r28

	multiPop r16, r17, r28, r29
	ret
