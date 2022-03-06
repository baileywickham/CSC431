	.arch armv7-a
	.comm	swapped,4,4

	.text
	.align 2
	.global compare
compare:
.LU1:
	push {fp, lr}
	add fp, sp, #4
	sub sp, sp, #12
	mov r2, r0
	mov r0, r1
	str r2, [sp, #0]
	str r0, [sp, #4]
	ldr r2, [sp, #0]
	ldr r0, [r2]
	ldr r2, [sp, #4]
	ldr r2, [r2]
	sub r2, r0, r2
	str r2, [sp, #8]
	b .LU0
.LU0:
	ldr r2, [sp, #8]
	mov r0, r2
	add sp, sp, #12
	pop {fp, pc}
	.size compare, .-compare
	.align 2
	.global deathSort
deathSort:
.LU3:
	push {fp, lr}
	add fp, sp, #4
	sub sp, sp, #16
	mov r2, r0
	str r2, [sp, #0]
	movw r2, #1
	str r2, [sp, #4]
	ldr r2, [sp, #4]
	mov r0, #0
	cmp r2, #1
	moveq r0, #1
	cmp r0, #1
	beq .LU4
	b .LU5
.LU4:
	movw r2, #0
	str r2, [sp, #4]
	ldr r2, [sp, #0]
	str r2, [sp, #12]
	ldr r2, [sp, #12]
	add r2, r2, #8
	ldr r1, [r2]
	ldr r2, [sp, #0]
	mov r0, #0
	cmp r1, r2
	movne r0, #1
	cmp r0, #1
	beq .LU6
	b .LU7
.LU6:
	ldr r2, [sp, #12]
	ldr r0, [sp, #12]
	add r0, r0, #8
	ldr r0, [r0]
	mov r1, r0
	mov r0, r2
	bl compare
	mov r2, r0
	mov r0, #0
	cmp r2, #0
	movgt r0, #1
	cmp r0, #1
	beq .LU8
	b .LU9
.LU8:
	ldr r2, [sp, #12]
	ldr r2, [r2]
	str r2, [sp, #8]
	ldr r2, [sp, #12]
	add r2, r2, #8
	ldr r2, [r2]
	ldr r0, [r2]
	ldr r2, [sp, #12]
	str r0, [r2]
	ldr r0, [sp, #8]
	ldr r2, [sp, #12]
	add r2, r2, #8
	ldr r2, [r2]
	str r0, [r2]
	movw r2, #1
	str r2, [sp, #4]
	b .LU9
.LU9:
	ldr r2, [sp, #12]
	add r2, r2, #8
	ldr r2, [r2]
	str r2, [sp, #12]
	ldr r2, [sp, #12]
	add r2, r2, #8
	ldr r1, [r2]
	ldr r0, [sp, #0]
	mov r2, #0
	cmp r1, r0
	movne r2, #1
	cmp r2, #1
	beq .LU6
	b .LU7
.LU7:
	ldr r2, [sp, #4]
	mov r0, #0
	cmp r2, #1
	moveq r0, #1
	cmp r0, #1
	beq .LU4
	b .LU5
.LU5:
	b .LU2
.LU2:
	add sp, sp, #16
	pop {fp, pc}
	.size deathSort, .-deathSort
	.align 2
	.global printEVILList
printEVILList:
.LU11:
	push {fp, lr}
	add fp, sp, #4
	sub sp, sp, #12
	mov r2, r0
	str r2, [sp, #0]
	ldr r2, [sp, #0]
	add r2, r2, #8
	ldr r2, [r2]
	str r2, [sp, #4]
	ldr r2, [sp, #0]
	ldr r2, [r2]
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #0]
	mov r0, r2
	bl free
	ldr r2, [sp, #4]
	ldr r1, [sp, #0]
	mov r3, #0
	cmp r2, r1
	movne r3, #1
	cmp r3, #1
	beq .LU12
	b .LU13
.LU12:
	ldr r2, [sp, #4]
	str r2, [sp, #8]
	ldr r2, [sp, #4]
	ldr r2, [r2]
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	add r2, r2, #8
	ldr r2, [r2]
	str r2, [sp, #4]
	ldr r2, [sp, #8]
	mov r0, r2
	bl free
	ldr r2, [sp, #4]
	ldr r1, [sp, #0]
	mov r3, #0
	cmp r2, r1
	movne r3, #1
	cmp r3, #1
	beq .LU12
	b .LU13
.LU13:
	b .LU10
.LU10:
	add sp, sp, #12
	pop {fp, pc}
	.size printEVILList, .-printEVILList
	.align 2
	.global main
main:
.LU15:
	push {fp, lr}
	add fp, sp, #4
	sub sp, sp, #24
	movw r0, #666
	movw r3, #:lower16:swapped
	movt r3, #:upper16:swapped
	str r0, [r3]
	add r1, sp, #4
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	ldr r3, [sp, #4]
	mov r0, #0
	cmp r3, #0
	movle r0, #1
	cmp r0, #1
	beq .LU16
	b .LU17
.LU16:
	movw r3, #0
	sub r3, r3, #1
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r3, #0
	sub r3, r3, #1
	str r3, [sp, #0]
	b .LU14
.LU17:
	ldr r0, [sp, #4]
	movw r3, #1000
	mul r3, r0, r3
	str r3, [sp, #4]
	ldr r3, [sp, #4]
	str r3, [sp, #8]
	movw r0, #12
	bl malloc
	mov r3, r0
	str r3, [sp, #16]
	ldr r3, [sp, #8]
	ldr r0, [sp, #16]
	str r3, [r0]
	ldr r0, [sp, #16]
	ldr r3, [sp, #16]
	add r3, r3, #4
	str r0, [r3]
	ldr r0, [sp, #16]
	ldr r3, [sp, #16]
	add r3, r3, #8
	str r0, [r3]
	ldr r3, [sp, #8]
	sub r3, r3, #1
	str r3, [sp, #8]
	ldr r3, [sp, #16]
	str r3, [sp, #20]
	ldr r3, [sp, #8]
	mov r0, #0
	cmp r3, #0
	movgt r0, #1
	cmp r0, #1
	beq .LU18
	b .LU19
.LU18:
	movw r0, #12
	bl malloc
	mov r3, r0
	str r3, [sp, #12]
	ldr r0, [sp, #8]
	ldr r3, [sp, #12]
	str r0, [r3]
	ldr r0, [sp, #20]
	ldr r3, [sp, #12]
	add r3, r3, #4
	str r0, [r3]
	ldr r0, [sp, #16]
	ldr r3, [sp, #12]
	add r3, r3, #8
	str r0, [r3]
	ldr r0, [sp, #12]
	ldr r3, [sp, #20]
	add r3, r3, #8
	str r0, [r3]
	ldr r3, [sp, #12]
	str r3, [sp, #20]
	ldr r3, [sp, #8]
	sub r3, r3, #1
	str r3, [sp, #8]
	ldr r0, [sp, #8]
	mov r3, #0
	cmp r0, #0
	movgt r3, #1
	cmp r3, #1
	beq .LU18
	b .LU19
.LU19:
	ldr r3, [sp, #16]
	mov r0, r3
	bl deathSort
	ldr r3, [sp, #16]
	mov r0, r3
	bl printEVILList
	movw r3, #0
	str r3, [sp, #0]
	b .LU14
.LU14:
	ldr r3, [sp, #0]
	mov r0, r3
	add sp, sp, #24
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
