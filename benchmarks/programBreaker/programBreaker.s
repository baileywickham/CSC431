	.arch armv7-a
	.comm	GLOBAL,4,4
	.comm	count,4,4

	.text
	.align 2
	.global fun2
fun2:
.LU1:
	push {fp, lr}
	add fp, sp, #4
	sub sp, sp, #12
	mov r3, r0
	mov r0, r1
	str r3, [sp, #0]
	str r0, [sp, #4]
	ldr r3, [sp, #0]
	mov r0, #0
	cmp r3, #0
	moveq r0, #1
	cmp r0, #1
	beq .LU2
	b .LU3
.LU2:
	ldr r3, [sp, #4]
	str r3, [sp, #8]
	b .LU0
.LU3:
	ldr r3, [sp, #0]
	sub r3, r3, #1
	ldr r0, [sp, #4]
	mov r1, r0
	mov r0, r3
	bl fun2
	mov r3, r0
	str r3, [sp, #8]
	b .LU0
.LU4:
	b .LU0
.LU0:
	ldr r3, [sp, #8]
	mov r0, r3
	add sp, sp, #12
	pop {fp, pc}
	.size fun2, .-fun2
	.align 2
	.global fun1
fun1:
.LU6:
	push {fp, lr}
	add fp, sp, #4
	push {r4}
	sub sp, sp, #20
	mov r3, r0
	mov r4, r1
	mov r1, r2
	str r3, [sp, #0]
	str r4, [sp, #4]
	str r1, [sp, #8]
	movw r3, #5
	add r4, r3, #6
	ldr r3, [sp, #0]
	movw r1, #2
	mul r3, r3, r1
	sub r4, r4, r3
	ldr r3, [sp, #4]
	mov r1, r3
	movw r0, #4
	bl __aeabi_idiv
	mov r3, r0
	add r3, r4, r3
	ldr r4, [sp, #8]
	add r3, r3, r4
	str r3, [sp, #16]
	ldr r1, [sp, #16]
	ldr r4, [sp, #4]
	mov r3, #0
	cmp r1, r4
	movgt r3, #1
	cmp r3, #1
	beq .LU7
	b .LU8
.LU7:
	ldr r3, [sp, #16]
	ldr r4, [sp, #0]
	mov r1, r4
	mov r0, r3
	bl fun2
	mov r3, r0
	str r3, [sp, #12]
	b .LU5
.LU8:
	movw r3, #5
	mov r0, #0
	cmp r3, #6
	movlt r0, #1
	ldr r4, [sp, #16]
	ldr r3, [sp, #4]
	mov r1, #0
	cmp r4, r3
	movle r1, #1
	and r3, r0, r1
	cmp r3, #1
	beq .LU10
	b .LU11
.LU10:
	ldr r3, [sp, #16]
	ldr r4, [sp, #4]
	mov r1, r4
	mov r0, r3
	bl fun2
	mov r3, r0
	str r3, [sp, #12]
	b .LU5
.LU11:
	b .LU9
.LU9:
	ldr r3, [sp, #16]
	str r3, [sp, #12]
	b .LU5
.LU5:
	ldr r3, [sp, #12]
	mov r0, r3
	add sp, sp, #20
	pop {r4}
	pop {fp, pc}
	.size fun1, .-fun1
	.align 2
	.global main
main:
.LU13:
	push {fp, lr}
	add fp, sp, #4
	sub sp, sp, #8
	movw r2, #0
	str r2, [sp, #4]
	add r1, sp, #4
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	ldr r3, [sp, #4]
	movw r0, #10000
	mov r2, #0
	cmp r3, r0
	movlt r2, #1
	cmp r2, #1
	beq .LU14
	b .LU15
.LU14:
	ldr r3, [sp, #4]
	movw r2, #5
	mov r1, r3
	movw r0, #3
	bl fun1
	mov r2, r0
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	add r2, r2, #1
	str r2, [sp, #4]
	ldr r3, [sp, #4]
	movw r2, #10000
	mov r0, #0
	cmp r3, r2
	movlt r0, #1
	cmp r0, #1
	beq .LU14
	b .LU15
.LU15:
	movw r2, #0
	str r2, [sp, #0]
	b .LU12
.LU12:
	ldr r2, [sp, #0]
	mov r0, r2
	add sp, sp, #8
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
