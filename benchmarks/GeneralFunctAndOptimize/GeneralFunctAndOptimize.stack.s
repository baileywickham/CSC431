	.arch armv7-a
	.comm	interval,4,4
	.comm	end,4,4

	.text
	.align 2
	.global multBy4xTimes
multBy4xTimes:
.LU1:
	push {fp, lr}
	add fp, sp, #4
	sub sp, sp, #12
	mov r2, r0
	mov r3, r1
	str r2, [sp, #0]
	str r3, [sp, #4]
	ldr r3, [sp, #4]
	mov r2, #0
	cmp r3, #0
	movle r2, #1
	cmp r2, #1
	beq .LU2
	b .LU3
.LU2:
	ldr r2, [sp, #0]
	ldr r2, [r2]
	str r2, [sp, #8]
	b .LU0
.LU3:
	ldr r2, [sp, #0]
	ldr r2, [r2]
	movw r3, #4
	mul r3, r3, r2
	ldr r2, [sp, #0]
	str r3, [r2]
	ldr r2, [sp, #0]
	ldr r3, [sp, #4]
	sub r3, r3, #1
	mov r1, r3
	mov r0, r2
	bl multBy4xTimes
	ldr r2, [sp, #0]
	ldr r2, [r2]
	str r2, [sp, #8]
	b .LU0
.LU0:
	ldr r2, [sp, #8]
	mov r0, r2
	add sp, sp, #12
	pop {fp, pc}
	.size multBy4xTimes, .-multBy4xTimes
	.align 2
	.global divideBy8
divideBy8:
.LU5:
	push {fp, lr}
	add fp, sp, #4
	sub sp, sp, #4
	mov r2, r0
	str r2, [sp, #0]
	ldr r2, [sp, #0]
	ldr r2, [r2]
	movw r1, #2
	mov r0, r2
	bl __aeabi_idiv
	mov r3, r0
	ldr r2, [sp, #0]
	str r3, [r2]
	ldr r2, [sp, #0]
	ldr r2, [r2]
	movw r1, #2
	mov r0, r2
	bl __aeabi_idiv
	mov r3, r0
	ldr r2, [sp, #0]
	str r3, [r2]
	ldr r2, [sp, #0]
	ldr r2, [r2]
	movw r1, #2
	mov r0, r2
	bl __aeabi_idiv
	mov r3, r0
	ldr r2, [sp, #0]
	str r3, [r2]
	b .LU4
.LU4:
	add sp, sp, #4
	pop {fp, pc}
	.size divideBy8, .-divideBy8
	.align 2
	.global main
main:
.LU7:
	push {fp, lr}
	add fp, sp, #4
	sub sp, sp, #36
	movw r0, #4
	bl malloc
	mov r2, r0
	str r2, [sp, #28]
	movw r2, #:lower16:1000000
	movt r2, #:upper16:1000000
	movw r3, #:lower16:end
	movt r3, #:upper16:end
	str r2, [r3]
	add r1, sp, #4
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r1, #:lower16:interval
	movt r1, #:upper16:interval
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	ldr r2, [sp, #4]
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r2, #:lower16:interval
	movt r2, #:upper16:interval
	ldr r2, [r2]
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r2, #0
	str r2, [sp, #8]
	movw r2, #0
	str r2, [sp, #12]
	movw r2, #0
	str r2, [sp, #16]
	ldr r2, [sp, #8]
	mov r3, #0
	cmp r2, #50
	movlt r3, #1
	cmp r3, #1
	beq .LU8
	b .LU9
.LU8:
	movw r2, #0
	str r2, [sp, #12]
	ldr r2, [sp, #12]
	movw r3, #:lower16:end
	movt r3, #:upper16:end
	ldr r3, [r3]
	mov r0, #0
	cmp r2, r3
	movle r0, #1
	cmp r0, #1
	beq .LU10
	b .LU11
.LU10:
	movw r2, #1
	movw r3, #2
	mul r3, r2, r3
	movw r2, #3
	mul r3, r3, r2
	movw r2, #4
	mul r3, r3, r2
	movw r2, #5
	mul r3, r3, r2
	movw r2, #6
	mul r2, r3, r2
	movw r3, #7
	mul r2, r2, r3
	movw r3, #8
	mul r3, r2, r3
	movw r2, #9
	mul r3, r3, r2
	movw r2, #10
	mul r2, r3, r2
	movw r3, #11
	mul r2, r2, r3
	str r2, [sp, #16]
	ldr r2, [sp, #12]
	add r2, r2, #1
	str r2, [sp, #12]
	ldr r3, [sp, #12]
	ldr r2, [sp, #28]
	str r3, [r2]
	ldr r2, [sp, #28]
	ldr r2, [r2]
	str r2, [sp, #20]
	ldr r2, [sp, #28]
	movw r1, #2
	mov r0, r2
	bl multBy4xTimes
	ldr r2, [sp, #28]
	mov r0, r2
	bl divideBy8
	movw r2, #:lower16:interval
	movt r2, #:upper16:interval
	ldr r2, [r2]
	sub r2, r2, #1
	str r2, [sp, #24]
	ldr r3, [sp, #24]
	mov r2, #0
	cmp r3, #0
	movle r2, #1
	str r2, [sp, #32]
	ldr r2, [sp, #24]
	mov r3, #0
	cmp r2, #0
	movle r3, #1
	cmp r3, #1
	beq .LU12
	b .LU13
.LU12:
	movw r2, #1
	str r2, [sp, #24]
	b .LU13
.LU13:
	ldr r2, [sp, #12]
	ldr r3, [sp, #24]
	add r2, r2, r3
	str r2, [sp, #12]
	ldr r0, [sp, #12]
	movw r2, #:lower16:end
	movt r2, #:upper16:end
	ldr r2, [r2]
	mov r3, #0
	cmp r0, r2
	movle r3, #1
	cmp r3, #1
	beq .LU10
	b .LU11
.LU11:
	ldr r2, [sp, #8]
	add r2, r2, #1
	str r2, [sp, #8]
	ldr r2, [sp, #8]
	mov r3, #0
	cmp r2, #50
	movlt r3, #1
	cmp r3, #1
	beq .LU8
	b .LU9
.LU9:
	ldr r2, [sp, #12]
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #16]
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r2, #0
	str r2, [sp, #0]
	b .LU6
.LU6:
	ldr r2, [sp, #0]
	mov r0, r2
	add sp, sp, #36
	pop {fp, pc}
	.size main, .-main
	.section	.rodata
	.align	2
.PRINTLN_FMT:
	.asciz	"%ld\n"
	.align	2
.PRINT_FMT:
	.asciz	"%ld "
	.align	2
.READ_FMT:
	.asciz	"%ld"
	.global	__aeabi_idiv
