	.arch armv7-a
	.comm	a,4,4
	.comm	b,4,4
	.comm	i,4,4

	.text
	.align 2
	.global concatLists
concatLists:
.LU1:
	push {fp, lr}
	add fp, sp, #4
	sub sp, sp, #16
	mov r3, r0
	mov r0, r1
	str r3, [sp, #0]
	str r0, [sp, #4]
	ldr r3, [sp, #0]
	str r3, [sp, #12]
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
	ldr r3, [sp, #12]
	add r3, r3, #4
	ldr r0, [r3]
	mov r3, #0
	cmp r0, #0
	movne r3, #1
	cmp r3, #1
	beq .LU4
	b .LU5
.LU4:
	ldr r3, [sp, #12]
	add r3, r3, #4
	ldr r3, [r3]
	str r3, [sp, #12]
	ldr r3, [sp, #12]
	add r3, r3, #4
	ldr r0, [r3]
	mov r3, #0
	cmp r0, #0
	movne r3, #1
	cmp r3, #1
	beq .LU4
	b .LU5
.LU5:
	ldr r0, [sp, #4]
	ldr r3, [sp, #12]
	add r3, r3, #4
	str r0, [r3]
	ldr r3, [sp, #0]
	str r3, [sp, #8]
	b .LU0
.LU0:
	ldr r3, [sp, #8]
	mov r0, r3
	add sp, sp, #16
	pop {fp, pc}
	.size concatLists, .-concatLists
	.align 2
	.global add
add:
.LU7:
	push {fp, lr}
	add fp, sp, #4
	sub sp, sp, #16
	mov r2, r0
	mov r3, r1
	str r2, [sp, #0]
	str r3, [sp, #4]
	movw r0, #8
	bl malloc
	mov r2, r0
	str r2, [sp, #12]
	ldr r3, [sp, #4]
	ldr r2, [sp, #12]
	str r3, [r2]
	ldr r3, [sp, #0]
	ldr r2, [sp, #12]
	add r2, r2, #4
	str r3, [r2]
	ldr r2, [sp, #12]
	str r2, [sp, #8]
	b .LU6
.LU6:
	ldr r2, [sp, #8]
	mov r0, r2
	add sp, sp, #16
	pop {fp, pc}
	.size add, .-add
	.align 2
	.global size
size:
.LU9:
	push {fp, lr}
	add fp, sp, #4
	sub sp, sp, #8
	mov r2, r0
	str r2, [sp, #0]
	ldr r2, [sp, #0]
	mov r3, #0
	cmp r2, #0
	moveq r3, #1
	cmp r3, #1
	beq .LU10
	b .LU11
.LU10:
	movw r2, #0
	str r2, [sp, #4]
	b .LU8
.LU11:
	ldr r2, [sp, #0]
	add r2, r2, #4
	ldr r2, [r2]
	mov r0, r2
	bl size
	mov r2, r0
	movw r3, #1
	add r2, r3, r2
	str r2, [sp, #4]
	b .LU8
.LU8:
	ldr r2, [sp, #4]
	mov r0, r2
	add sp, sp, #8
	pop {fp, pc}
	.size size, .-size
	.align 2
	.global get
get:
.LU13:
	push {fp, lr}
	add fp, sp, #4
	sub sp, sp, #12
	mov r2, r1
	str r0, [sp, #0]
	str r2, [sp, #4]
	ldr r0, [sp, #4]
	mov r2, #0
	cmp r0, #0
	moveq r2, #1
	cmp r2, #1
	beq .LU14
	b .LU15
.LU14:
	ldr r0, [sp, #0]
	ldr r0, [r0]
	str r0, [sp, #8]
	b .LU12
.LU15:
	ldr r0, [sp, #0]
	add r0, r0, #4
	ldr r0, [r0]
	ldr r2, [sp, #4]
	sub r2, r2, #1
	mov r1, r2
	bl get
	str r0, [sp, #8]
	b .LU12
.LU12:
	ldr r0, [sp, #8]
	add sp, sp, #12
	pop {fp, pc}
	.size get, .-get
	.align 2
	.global pop
pop:
.LU17:
	push {fp, lr}
	add fp, sp, #4
	sub sp, sp, #8
	mov r2, r0
	str r2, [sp, #0]
	ldr r2, [sp, #0]
	add r2, r2, #4
	ldr r2, [r2]
	str r2, [sp, #0]
	ldr r2, [sp, #0]
	str r2, [sp, #4]
	b .LU16
.LU16:
	ldr r2, [sp, #4]
	mov r0, r2
	add sp, sp, #8
	pop {fp, pc}
	.size pop, .-pop
	.align 2
	.global printList
printList:
.LU19:
	push {fp, lr}
	add fp, sp, #4
	sub sp, sp, #4
	mov r2, r0
	str r2, [sp, #0]
	ldr r2, [sp, #0]
	mov r0, #0
	cmp r2, #0
	movne r0, #1
	cmp r0, #1
	beq .LU20
	b .LU21
.LU20:
	ldr r2, [sp, #0]
	ldr r2, [r2]
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #0]
	add r2, r2, #4
	ldr r2, [r2]
	mov r0, r2
	bl printList
	b .LU21
.LU21:
	b .LU18
.LU18:
	add sp, sp, #4
	pop {fp, pc}
	.size printList, .-printList
	.align 2
	.global treeprint
treeprint:
.LU23:
	push {fp, lr}
	add fp, sp, #4
	sub sp, sp, #4
	mov r2, r0
	str r2, [sp, #0]
	ldr r3, [sp, #0]
	mov r2, #0
	cmp r3, #0
	movne r2, #1
	cmp r2, #1
	beq .LU24
	b .LU25
.LU24:
	ldr r2, [sp, #0]
	add r2, r2, #4
	ldr r2, [r2]
	mov r0, r2
	bl treeprint
	ldr r2, [sp, #0]
	ldr r2, [r2]
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #0]
	add r2, r2, #8
	ldr r2, [r2]
	mov r0, r2
	bl treeprint
	b .LU25
.LU25:
	b .LU22
.LU22:
	add sp, sp, #4
	pop {fp, pc}
	.size treeprint, .-treeprint
	.align 2
	.global freeList
freeList:
.LU27:
	push {fp, lr}
	add fp, sp, #4
	sub sp, sp, #4
	mov r3, r0
	str r3, [sp, #0]
	ldr r0, [sp, #0]
	mov r3, #0
	cmp r0, #0
	movne r3, #1
	cmp r3, #1
	beq .LU28
	b .LU29
.LU28:
	ldr r3, [sp, #0]
	add r3, r3, #4
	ldr r3, [r3]
	mov r0, r3
	bl freeList
	ldr r3, [sp, #0]
	mov r0, r3
	bl free
	b .LU29
.LU29:
	b .LU26
.LU26:
	add sp, sp, #4
	pop {fp, pc}
	.size freeList, .-freeList
	.align 2
	.global freeTree
freeTree:
.LU31:
	push {fp, lr}
	add fp, sp, #4
	sub sp, sp, #4
	mov r3, r0
	str r3, [sp, #0]
	ldr r3, [sp, #0]
	mov r0, #0
	cmp r3, #0
	moveq r0, #1
	movw r3, #1
	eor r3, r3, r0
	cmp r3, #1
	beq .LU32
	b .LU33
.LU32:
	ldr r3, [sp, #0]
	add r3, r3, #4
	ldr r3, [r3]
	mov r0, r3
	bl freeTree
	ldr r3, [sp, #0]
	add r3, r3, #8
	ldr r3, [r3]
	mov r0, r3
	bl freeTree
	ldr r3, [sp, #0]
	mov r0, r3
	bl free
	b .LU33
.LU33:
	b .LU30
.LU30:
	add sp, sp, #4
	pop {fp, pc}
	.size freeTree, .-freeTree
	.align 2
	.global postOrder
postOrder:
.LU35:
	push {fp, lr}
	add fp, sp, #4
	push {r4}
	sub sp, sp, #12
	mov r2, r0
	str r2, [sp, #0]
	ldr r0, [sp, #0]
	mov r2, #0
	cmp r0, #0
	movne r2, #1
	cmp r2, #1
	beq .LU36
	b .LU37
.LU36:
	movw r0, #8
	bl malloc
	mov r2, r0
	str r2, [sp, #8]
	ldr r2, [sp, #0]
	ldr r0, [r2]
	ldr r2, [sp, #8]
	str r0, [r2]
	ldr r2, [sp, #8]
	add r2, r2, #4
	movw r0, #0
	str r0, [r2]
	ldr r2, [sp, #0]
	add r2, r2, #4
	ldr r2, [r2]
	mov r0, r2
	bl postOrder
	mov r4, r0
	ldr r2, [sp, #0]
	add r2, r2, #8
	ldr r2, [r2]
	mov r0, r2
	bl postOrder
	mov r2, r0
	mov r1, r2
	mov r0, r4
	bl concatLists
	mov r2, r0
	ldr r0, [sp, #8]
	mov r1, r0
	mov r0, r2
	bl concatLists
	mov r2, r0
	str r2, [sp, #4]
	b .LU34
.LU37:
	movw r2, #0
	str r2, [sp, #4]
	b .LU34
.LU34:
	ldr r2, [sp, #4]
	mov r0, r2
	add sp, sp, #12
	pop {r4}
	pop {fp, pc}
	.size postOrder, .-postOrder
	.align 2
	.global treeadd
treeadd:
.LU39:
	push {fp, lr}
	add fp, sp, #4
	sub sp, sp, #16
	mov r3, r0
	mov r0, r1
	str r3, [sp, #0]
	str r0, [sp, #4]
	ldr r0, [sp, #0]
	mov r3, #0
	cmp r0, #0
	moveq r3, #1
	cmp r3, #1
	beq .LU40
	b .LU41
.LU40:
	movw r0, #12
	bl malloc
	mov r3, r0
	str r3, [sp, #12]
	ldr r0, [sp, #4]
	ldr r3, [sp, #12]
	str r0, [r3]
	ldr r3, [sp, #12]
	add r0, r3, #4
	movw r3, #0
	str r3, [r0]
	ldr r3, [sp, #12]
	add r3, r3, #8
	movw r0, #0
	str r0, [r3]
	ldr r3, [sp, #12]
	str r3, [sp, #8]
	b .LU38
.LU41:
	ldr r2, [sp, #4]
	ldr r3, [sp, #0]
	ldr r0, [r3]
	mov r3, #0
	cmp r2, r0
	movlt r3, #1
	cmp r3, #1
	beq .LU42
	b .LU43
.LU42:
	ldr r3, [sp, #0]
	add r3, r3, #4
	ldr r3, [r3]
	ldr r0, [sp, #4]
	mov r1, r0
	mov r0, r3
	bl treeadd
	ldr r3, [sp, #0]
	add r3, r3, #4
	str r0, [r3]
	b .LU44
.LU43:
	ldr r3, [sp, #0]
	add r3, r3, #8
	ldr r3, [r3]
	ldr r0, [sp, #4]
	mov r1, r0
	mov r0, r3
	bl treeadd
	ldr r3, [sp, #0]
	add r3, r3, #8
	str r0, [r3]
	b .LU44
.LU44:
	ldr r3, [sp, #0]
	str r3, [sp, #8]
	b .LU38
.LU38:
	ldr r3, [sp, #8]
	mov r0, r3
	add sp, sp, #16
	pop {fp, pc}
	.size treeadd, .-treeadd
	.align 2
	.global quickSort
quickSort:
.LU46:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5}
	sub sp, sp, #28
	mov r3, r0
	str r3, [sp, #0]
	movw r3, #0
	str r3, [sp, #16]
	movw r3, #0
	str r3, [sp, #20]
	ldr r3, [sp, #0]
	mov r0, r3
	bl size
	mov r1, r0
	mov r3, #0
	cmp r1, #1
	movle r3, #1
	cmp r3, #1
	beq .LU47
	b .LU48
.LU47:
	ldr r3, [sp, #0]
	str r3, [sp, #4]
	b .LU45
.LU48:
	ldr r3, [sp, #0]
	movw r1, #0
	mov r0, r3
	bl get
	mov r4, r0
	ldr r5, [sp, #0]
	ldr r3, [sp, #0]
	mov r0, r3
	bl size
	mov r3, r0
	sub r3, r3, #1
	mov r1, r3
	mov r0, r5
	bl get
	mov r3, r0
	add r3, r4, r3
	movw r1, #2
	mov r0, r3
	bl __aeabi_idiv
	mov r3, r0
	str r3, [sp, #8]
	ldr r3, [sp, #0]
	str r3, [sp, #24]
	movw r3, #0
	str r3, [sp, #12]
	ldr r3, [sp, #24]
	mov r1, #0
	cmp r3, #0
	movne r1, #1
	cmp r1, #1
	beq .LU49
	b .LU50
.LU49:
	ldr r3, [sp, #0]
	ldr r1, [sp, #12]
	mov r0, r3
	bl get
	mov r1, r0
	ldr r3, [sp, #8]
	mov r4, #0
	cmp r1, r3
	movgt r4, #1
	cmp r4, #1
	beq .LU51
	b .LU52
.LU51:
	ldr r4, [sp, #20]
	ldr r3, [sp, #0]
	ldr r1, [sp, #12]
	mov r0, r3
	bl get
	mov r3, r0
	mov r1, r3
	mov r0, r4
	bl add
	mov r3, r0
	str r3, [sp, #20]
	b .LU53
.LU52:
	ldr r4, [sp, #16]
	ldr r3, [sp, #0]
	ldr r1, [sp, #12]
	mov r0, r3
	bl get
	mov r3, r0
	mov r1, r3
	mov r0, r4
	bl add
	mov r3, r0
	str r3, [sp, #16]
	b .LU53
.LU53:
	ldr r3, [sp, #24]
	add r3, r3, #4
	ldr r3, [r3]
	str r3, [sp, #24]
	ldr r3, [sp, #12]
	add r3, r3, #1
	str r3, [sp, #12]
	ldr r3, [sp, #24]
	mov r1, #0
	cmp r3, #0
	movne r1, #1
	cmp r1, #1
	beq .LU49
	b .LU50
.LU50:
	ldr r3, [sp, #0]
	mov r0, r3
	bl freeList
	ldr r3, [sp, #16]
	mov r0, r3
	bl quickSort
	mov r4, r0
	ldr r3, [sp, #20]
	mov r0, r3
	bl quickSort
	mov r3, r0
	mov r1, r3
	mov r0, r4
	bl concatLists
	mov r3, r0
	str r3, [sp, #4]
	b .LU45
.LU45:
	ldr r3, [sp, #4]
	mov r0, r3
	add sp, sp, #28
	pop {r4, r5}
	pop {fp, pc}
	.size quickSort, .-quickSort
	.align 2
	.global quickSortMain
quickSortMain:
.LU55:
	push {fp, lr}
	add fp, sp, #4
	sub sp, sp, #8
	mov r2, r0
	str r2, [sp, #0]
	ldr r2, [sp, #0]
	mov r0, r2
	bl printList
	movw r0, #0
	movw r2, #999
	sub r2, r0, r2
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #0]
	mov r0, r2
	bl printList
	movw r2, #0
	movw r0, #999
	sub r2, r2, r0
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #0]
	mov r0, r2
	bl printList
	movw r2, #0
	movw r0, #999
	sub r2, r2, r0
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r2, #0
	str r2, [sp, #4]
	b .LU54
.LU54:
	ldr r2, [sp, #4]
	mov r0, r2
	add sp, sp, #8
	pop {fp, pc}
	.size quickSortMain, .-quickSortMain
	.align 2
	.global treesearch
treesearch:
.LU57:
	push {fp, lr}
	add fp, sp, #4
	sub sp, sp, #12
	mov r2, r0
	mov r3, r1
	str r2, [sp, #0]
	str r3, [sp, #4]
	movw r2, #0
	sub r2, r2, #1
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r3, [sp, #0]
	mov r2, #0
	cmp r3, #0
	movne r2, #1
	cmp r2, #1
	beq .LU58
	b .LU59
.LU58:
	ldr r2, [sp, #0]
	ldr r3, [r2]
	ldr r2, [sp, #4]
	mov r0, #0
	cmp r3, r2
	moveq r0, #1
	cmp r0, #1
	beq .LU60
	b .LU61
.LU60:
	movw r2, #1
	str r2, [sp, #8]
	b .LU56
.LU61:
	ldr r2, [sp, #0]
	add r2, r2, #4
	ldr r2, [r2]
	ldr r3, [sp, #4]
	mov r1, r3
	mov r0, r2
	bl treesearch
	mov r3, r0
	mov r2, #0
	cmp r3, #1
	moveq r2, #1
	cmp r2, #1
	beq .LU62
	b .LU63
.LU62:
	movw r2, #1
	str r2, [sp, #8]
	b .LU56
.LU63:
	ldr r2, [sp, #0]
	add r2, r2, #8
	ldr r2, [r2]
	ldr r3, [sp, #4]
	mov r1, r3
	mov r0, r2
	bl treesearch
	mov r2, r0
	mov r3, #0
	cmp r2, #1
	moveq r3, #1
	cmp r3, #1
	beq .LU64
	b .LU65
.LU64:
	movw r2, #1
	str r2, [sp, #8]
	b .LU56
.LU65:
	movw r2, #0
	str r2, [sp, #8]
	b .LU56
.LU66:
	b .LU59
.LU59:
	movw r2, #0
	str r2, [sp, #8]
	b .LU56
.LU56:
	ldr r2, [sp, #8]
	mov r0, r2
	add sp, sp, #12
	pop {fp, pc}
	.size treesearch, .-treesearch
	.align 2
	.global inOrder
inOrder:
.LU68:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5}
	sub sp, sp, #12
	mov r3, r0
	str r3, [sp, #0]
	ldr r0, [sp, #0]
	mov r3, #0
	cmp r0, #0
	movne r3, #1
	cmp r3, #1
	beq .LU69
	b .LU70
.LU69:
	movw r0, #8
	bl malloc
	mov r3, r0
	str r3, [sp, #8]
	ldr r3, [sp, #0]
	ldr r0, [r3]
	ldr r3, [sp, #8]
	str r0, [r3]
	ldr r3, [sp, #8]
	add r0, r3, #4
	movw r3, #0
	str r3, [r0]
	ldr r3, [sp, #0]
	add r3, r3, #4
	ldr r3, [r3]
	mov r0, r3
	bl inOrder
	mov r4, r0
	ldr r5, [sp, #8]
	ldr r3, [sp, #0]
	add r3, r3, #8
	ldr r3, [r3]
	mov r0, r3
	bl inOrder
	mov r3, r0
	mov r1, r3
	mov r0, r5
	bl concatLists
	mov r3, r0
	mov r1, r3
	mov r0, r4
	bl concatLists
	mov r3, r0
	str r3, [sp, #4]
	b .LU67
.LU70:
	movw r3, #0
	str r3, [sp, #4]
	b .LU67
.LU71:
	b .LU67
.LU67:
	ldr r3, [sp, #4]
	mov r0, r3
	add sp, sp, #12
	pop {r4, r5}
	pop {fp, pc}
	.size inOrder, .-inOrder
	.align 2
	.global bintreesearch
bintreesearch:
.LU73:
	push {fp, lr}
	add fp, sp, #4
	sub sp, sp, #12
	mov r2, r0
	mov r3, r1
	str r2, [sp, #0]
	str r3, [sp, #4]
	movw r2, #0
	sub r2, r2, #1
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #0]
	mov r3, #0
	cmp r2, #0
	movne r3, #1
	cmp r3, #1
	beq .LU74
	b .LU75
.LU74:
	ldr r2, [sp, #0]
	ldr r2, [r2]
	ldr r0, [sp, #4]
	mov r3, #0
	cmp r2, r0
	moveq r3, #1
	cmp r3, #1
	beq .LU76
	b .LU77
.LU76:
	movw r2, #1
	str r2, [sp, #8]
	b .LU72
.LU77:
	ldr r0, [sp, #4]
	ldr r2, [sp, #0]
	ldr r2, [r2]
	mov r3, #0
	cmp r0, r2
	movlt r3, #1
	cmp r3, #1
	beq .LU78
	b .LU79
.LU78:
	ldr r2, [sp, #0]
	add r2, r2, #4
	ldr r2, [r2]
	ldr r3, [sp, #4]
	mov r1, r3
	mov r0, r2
	bl bintreesearch
	mov r2, r0
	str r2, [sp, #8]
	b .LU72
.LU79:
	ldr r2, [sp, #0]
	add r2, r2, #8
	ldr r2, [r2]
	ldr r3, [sp, #4]
	mov r1, r3
	mov r0, r2
	bl bintreesearch
	mov r2, r0
	str r2, [sp, #8]
	b .LU72
.LU80:
	b .LU75
.LU75:
	movw r2, #0
	str r2, [sp, #8]
	b .LU72
.LU72:
	ldr r2, [sp, #8]
	mov r0, r2
	add sp, sp, #12
	pop {fp, pc}
	.size bintreesearch, .-bintreesearch
	.align 2
	.global buildTree
buildTree:
.LU82:
	push {fp, lr}
	add fp, sp, #4
	push {r4}
	sub sp, sp, #16
	mov r3, r0
	str r3, [sp, #0]
	movw r3, #0
	str r3, [sp, #12]
	movw r3, #0
	str r3, [sp, #8]
	ldr r4, [sp, #8]
	ldr r3, [sp, #0]
	mov r0, r3
	bl size
	mov r3, r0
	mov r2, #0
	cmp r4, r3
	movlt r2, #1
	cmp r2, #1
	beq .LU83
	b .LU84
.LU83:
	ldr r4, [sp, #12]
	ldr r3, [sp, #0]
	ldr r2, [sp, #8]
	mov r1, r2
	mov r0, r3
	bl get
	mov r3, r0
	mov r1, r3
	mov r0, r4
	bl treeadd
	mov r3, r0
	str r3, [sp, #12]
	ldr r3, [sp, #8]
	add r3, r3, #1
	str r3, [sp, #8]
	ldr r4, [sp, #8]
	ldr r3, [sp, #0]
	mov r0, r3
	bl size
	mov r2, r0
	mov r3, #0
	cmp r4, r2
	movlt r3, #1
	cmp r3, #1
	beq .LU83
	b .LU84
.LU84:
	ldr r3, [sp, #12]
	str r3, [sp, #4]
	b .LU81
.LU81:
	ldr r3, [sp, #4]
	mov r0, r3
	add sp, sp, #16
	pop {r4}
	pop {fp, pc}
	.size buildTree, .-buildTree
	.align 2
	.global treeMain
treeMain:
.LU86:
	push {fp, lr}
	add fp, sp, #4
	sub sp, sp, #16
	mov r2, r0
	str r2, [sp, #0]
	ldr r2, [sp, #0]
	mov r0, r2
	bl buildTree
	mov r2, r0
	str r2, [sp, #4]
	ldr r2, [sp, #4]
	mov r0, r2
	bl treeprint
	movw r2, #0
	movw r0, #999
	sub r2, r2, r0
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	mov r0, r2
	bl inOrder
	mov r2, r0
	str r2, [sp, #8]
	ldr r2, [sp, #8]
	mov r0, r2
	bl printList
	movw r0, #0
	movw r2, #999
	sub r2, r0, r2
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #8]
	mov r0, r2
	bl freeList
	ldr r2, [sp, #4]
	mov r0, r2
	bl postOrder
	mov r2, r0
	str r2, [sp, #12]
	ldr r2, [sp, #12]
	mov r0, r2
	bl printList
	movw r0, #0
	movw r2, #999
	sub r2, r0, r2
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #12]
	mov r0, r2
	bl freeList
	ldr r2, [sp, #4]
	movw r1, #0
	mov r0, r2
	bl treesearch
	mov r2, r0
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r0, #0
	movw r2, #999
	sub r2, r0, r2
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	movw r1, #10
	mov r0, r2
	bl treesearch
	mov r2, r0
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r2, #0
	movw r0, #999
	sub r2, r2, r0
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	movw r0, #0
	sub r0, r0, #2
	mov r1, r0
	mov r0, r2
	bl treesearch
	mov r2, r0
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r0, #0
	movw r2, #999
	sub r2, r0, r2
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	movw r1, #2
	mov r0, r2
	bl treesearch
	mov r2, r0
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r0, #0
	movw r2, #999
	sub r2, r0, r2
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	movw r1, #3
	mov r0, r2
	bl treesearch
	mov r2, r0
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r2, #0
	movw r0, #999
	sub r2, r2, r0
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	movw r1, #9
	mov r0, r2
	bl treesearch
	mov r2, r0
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r2, #0
	movw r0, #999
	sub r2, r2, r0
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	movw r1, #1
	mov r0, r2
	bl treesearch
	mov r2, r0
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r2, #0
	movw r0, #999
	sub r2, r2, r0
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	movw r1, #0
	mov r0, r2
	bl bintreesearch
	mov r2, r0
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r2, #0
	movw r0, #999
	sub r2, r2, r0
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	movw r1, #10
	mov r0, r2
	bl bintreesearch
	mov r2, r0
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r0, #0
	movw r2, #999
	sub r2, r0, r2
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	movw r0, #0
	sub r0, r0, #2
	mov r1, r0
	mov r0, r2
	bl bintreesearch
	mov r2, r0
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r0, #0
	movw r2, #999
	sub r2, r0, r2
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	movw r1, #2
	mov r0, r2
	bl bintreesearch
	mov r2, r0
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r2, #0
	movw r0, #999
	sub r2, r2, r0
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	movw r1, #3
	mov r0, r2
	bl bintreesearch
	mov r2, r0
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r0, #0
	movw r2, #999
	sub r2, r0, r2
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	movw r1, #9
	mov r0, r2
	bl bintreesearch
	mov r2, r0
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r0, #0
	movw r2, #999
	sub r2, r0, r2
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	movw r1, #1
	mov r0, r2
	bl bintreesearch
	mov r2, r0
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r2, #0
	movw r0, #999
	sub r2, r2, r0
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	mov r0, r2
	bl freeTree
	b .LU85
.LU85:
	add sp, sp, #16
	pop {fp, pc}
	.size treeMain, .-treeMain
	.align 2
	.global myCopy
myCopy:
.LU88:
	push {fp, lr}
	add fp, sp, #4
	push {r4}
	sub sp, sp, #8
	mov r3, r0
	str r3, [sp, #0]
	ldr r0, [sp, #0]
	mov r3, #0
	cmp r0, #0
	moveq r3, #1
	cmp r3, #1
	beq .LU89
	b .LU90
.LU89:
	movw r3, #0
	str r3, [sp, #4]
	b .LU87
.LU90:
	ldr r3, [sp, #0]
	ldr r3, [r3]
	mov r1, r3
	movw r0, #0
	bl add
	mov r4, r0
	ldr r3, [sp, #0]
	add r3, r3, #4
	ldr r3, [r3]
	mov r0, r3
	bl myCopy
	mov r3, r0
	mov r1, r3
	mov r0, r4
	bl concatLists
	mov r3, r0
	str r3, [sp, #4]
	b .LU87
.LU87:
	ldr r3, [sp, #4]
	mov r0, r3
	add sp, sp, #8
	pop {r4}
	pop {fp, pc}
	.size myCopy, .-myCopy
	.align 2
	.global main
main:
.LU92:
	push {fp, lr}
	add fp, sp, #4
	sub sp, sp, #28
	movw r2, #0
	str r2, [sp, #12]
	movw r2, #0
	str r2, [sp, #16]
	movw r2, #0
	str r2, [sp, #20]
	movw r2, #0
	str r2, [sp, #4]
	ldr r2, [sp, #4]
	mov r3, #0
	cmp r2, #10
	movlt r3, #1
	cmp r3, #1
	beq .LU93
	b .LU94
.LU93:
	add r1, sp, #8
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	ldr r2, [sp, #12]
	ldr r3, [sp, #8]
	mov r1, r3
	mov r0, r2
	bl add
	mov r2, r0
	str r2, [sp, #12]
	ldr r2, [sp, #12]
	mov r0, r2
	bl myCopy
	mov r2, r0
	str r2, [sp, #16]
	ldr r2, [sp, #12]
	mov r0, r2
	bl myCopy
	mov r2, r0
	str r2, [sp, #20]
	ldr r2, [sp, #16]
	mov r0, r2
	bl quickSortMain
	mov r2, r0
	str r2, [sp, #24]
	ldr r2, [sp, #24]
	mov r0, r2
	bl freeList
	ldr r2, [sp, #20]
	mov r0, r2
	bl treeMain
	ldr r2, [sp, #4]
	add r2, r2, #1
	str r2, [sp, #4]
	ldr r3, [sp, #4]
	mov r2, #0
	cmp r3, #10
	movlt r2, #1
	cmp r2, #1
	beq .LU93
	b .LU94
.LU94:
	ldr r2, [sp, #12]
	mov r0, r2
	bl freeList
	ldr r2, [sp, #16]
	mov r0, r2
	bl freeList
	ldr r2, [sp, #20]
	mov r0, r2
	bl freeList
	movw r2, #0
	str r2, [sp, #0]
	b .LU91
.LU91:
	ldr r2, [sp, #0]
	mov r0, r2
	add sp, sp, #28
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
