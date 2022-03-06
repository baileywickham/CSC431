	.arch armv7-a
	.comm	.read_scratch,4,4
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
	push {r4, r5, r6}
	mov r2, r0
	mov r0, r1
	mov r1, #0
	cmp r2, #0
	moveq r1, #1
	cmp r1, #1
	beq .LU2
	b .LU3
.LU2:
	mov r2, r0
	b .LU0
.LU3:
	b .LU4
.LU4:
	add r1, r2, #4
	ldr r1, [r1]
	mov r6, #0
	cmp r1, #0
	movne r6, #1
	mov r5, r0
	mov r4, r2
	mov r3, r2
	mov r1, r2
	cmp r6, #1
	beq .LU5
	b .LU6
.LU5:
	add r1, r1, #4
	ldr r1, [r1]
	add r3, r1, #4
	ldr r3, [r3]
	mov r6, #0
	cmp r3, #0
	movne r6, #1
	mov r5, r0
	mov r4, r1
	mov r3, r2
	cmp r6, #1
	beq .LU5
	b .LU6
.LU6:
	mov r2, r3
	mov r1, r4
	mov r0, r5
	add r1, r1, #4
	str r0, [r1]
	b .LU0
.LU0:
	mov r0, r2
	pop {r4, r5, r6}
	pop {fp, pc}
	.size concatLists, .-concatLists
	.align 2
	.global add
add:
.LU8:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5}
	mov r4, r0
	mov r5, r1
	movw r0, #8
	bl malloc
	mov r2, r0
	mov r0, r2
	mov r2, r0
	str r5, [r2]
	add r2, r0, #4
	str r4, [r2]
	b .LU7
.LU7:
	pop {r4, r5}
	pop {fp, pc}
	.size add, .-add
	.align 2
	.global size
size:
.LU10:
	push {fp, lr}
	add fp, sp, #4
	mov r3, r0
	mov r0, #0
	cmp r3, #0
	moveq r0, #1
	cmp r0, #1
	beq .LU11
	b .LU12
.LU11:
	movw r3, #0
	b .LU9
.LU12:
	b .LU13
.LU13:
	add r3, r3, #4
	ldr r3, [r3]
	mov r0, r3
	bl size
	mov r3, r0
	movw r0, #1
	add r3, r0, r3
	b .LU9
.LU9:
	mov r0, r3
	pop {fp, pc}
	.size size, .-size
	.align 2
	.global get
get:
.LU15:
	push {fp, lr}
	add fp, sp, #4
	mov r2, #0
	cmp r1, #0
	moveq r2, #1
	cmp r2, #1
	beq .LU16
	b .LU17
.LU16:
	ldr r0, [r0]
	b .LU14
.LU17:
	b .LU18
.LU18:
	add r0, r0, #4
	ldr r0, [r0]
	sub r2, r1, #1
	mov r1, r2
	bl get
	b .LU14
.LU14:
	pop {fp, pc}
	.size get, .-get
	.align 2
	.global pop
pop:
.LU20:
	push {fp, lr}
	add fp, sp, #4
	mov r3, r0
	add r3, r3, #4
	ldr r3, [r3]
	b .LU19
.LU19:
	mov r0, r3
	pop {fp, pc}
	.size pop, .-pop
	.align 2
	.global printList
printList:
.LU22:
	push {fp, lr}
	add fp, sp, #4
	push {r4}
	mov r4, r0
	mov r2, #0
	cmp r4, #0
	movne r2, #1
	cmp r2, #1
	beq .LU23
	b .LU24
.LU23:
	mov r2, r4
	ldr r2, [r2]
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	add r2, r4, #4
	ldr r2, [r2]
	mov r0, r2
	bl printList
	b .LU25
.LU24:
	b .LU25
.LU25:
	b .LU21
.LU21:
	pop {r4}
	pop {fp, pc}
	.size printList, .-printList
	.align 2
	.global treeprint
treeprint:
.LU27:
	push {fp, lr}
	add fp, sp, #4
	push {r4}
	mov r4, r0
	mov r2, #0
	cmp r4, #0
	movne r2, #1
	cmp r2, #1
	beq .LU28
	b .LU29
.LU28:
	add r2, r4, #4
	ldr r2, [r2]
	mov r0, r2
	bl treeprint
	mov r2, r4
	ldr r2, [r2]
	mov r1, r2
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	add r2, r4, #8
	ldr r2, [r2]
	mov r0, r2
	bl treeprint
	b .LU30
.LU29:
	b .LU30
.LU30:
	b .LU26
.LU26:
	pop {r4}
	pop {fp, pc}
	.size treeprint, .-treeprint
	.align 2
	.global freeList
freeList:
.LU32:
	push {fp, lr}
	add fp, sp, #4
	push {r4}
	mov r4, r0
	mov r2, #0
	cmp r4, #0
	movne r2, #1
	cmp r2, #1
	beq .LU33
	b .LU34
.LU33:
	add r2, r4, #4
	ldr r2, [r2]
	mov r0, r2
	bl freeList
	mov r2, r4
	mov r0, r2
	bl free
	b .LU35
.LU34:
	b .LU35
.LU35:
	b .LU31
.LU31:
	pop {r4}
	pop {fp, pc}
	.size freeList, .-freeList
	.align 2
	.global freeTree
freeTree:
.LU37:
	push {fp, lr}
	add fp, sp, #4
	push {r4}
	mov r4, r0
	mov r3, #0
	cmp r4, #0
	moveq r3, #1
	movw r2, #1
	eor r2, r2, r3
	cmp r2, #1
	beq .LU38
	b .LU39
.LU38:
	add r2, r4, #4
	ldr r2, [r2]
	mov r0, r2
	bl freeTree
	add r2, r4, #8
	ldr r2, [r2]
	mov r0, r2
	bl freeTree
	mov r2, r4
	mov r0, r2
	bl free
	b .LU40
.LU39:
	b .LU40
.LU40:
	b .LU36
.LU36:
	pop {r4}
	pop {fp, pc}
	.size freeTree, .-freeTree
	.align 2
	.global postOrder
postOrder:
.LU42:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6}
	mov r6, r0
	mov r0, #0
	cmp r6, #0
	movne r0, #1
	cmp r0, #1
	beq .LU43
	b .LU44
.LU43:
	movw r0, #8
	bl malloc
	mov r4, r0
	mov r0, r6
	ldr r2, [r0]
	mov r0, r4
	str r2, [r0]
	add r2, r4, #4
	movw r0, #0
	str r0, [r2]
	add r0, r6, #4
	ldr r0, [r0]
	bl postOrder
	mov r5, r0
	add r0, r6, #8
	ldr r0, [r0]
	bl postOrder
	mov r1, r0
	mov r0, r5
	bl concatLists
	mov r1, r4
	bl concatLists
	b .LU41
.LU44:
	b .LU45
.LU45:
	movw r0, #0
	b .LU41
.LU41:
	pop {r4, r5, r6}
	pop {fp, pc}
	.size postOrder, .-postOrder
	.align 2
	.global treeadd
treeadd:
.LU47:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5}
	mov r4, r0
	mov r5, r1
	mov r3, #0
	cmp r4, #0
	moveq r3, #1
	cmp r3, #1
	beq .LU48
	b .LU49
.LU48:
	movw r0, #12
	bl malloc
	mov r3, r0
	mov r0, r3
	mov r3, r0
	str r5, [r3]
	add r3, r0, #4
	movw r2, #0
	str r2, [r3]
	add r3, r0, #8
	movw r2, #0
	str r2, [r3]
	mov r3, r0
	b .LU46
.LU49:
	b .LU50
.LU50:
	mov r3, r4
	ldr r0, [r3]
	mov r3, #0
	cmp r5, r0
	movlt r3, #1
	cmp r3, #1
	beq .LU51
	b .LU52
.LU51:
	add r3, r4, #4
	ldr r3, [r3]
	mov r1, r5
	mov r0, r3
	bl treeadd
	mov r3, r0
	add r0, r4, #4
	str r3, [r0]
	mov r3, r4
	b .LU53
.LU52:
	add r3, r4, #8
	ldr r3, [r3]
	mov r1, r5
	mov r0, r3
	bl treeadd
	mov r3, r0
	add r0, r4, #8
	str r3, [r0]
	mov r3, r4
	b .LU53
.LU53:
	b .LU46
.LU46:
	mov r0, r3
	pop {r4, r5}
	pop {fp, pc}
	.size treeadd, .-treeadd
	.align 2
	.global quickSort
quickSort:
.LU55:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9}
	mov r6, r0
	mov r0, r6
	bl size
	mov r4, r0
	mov r3, #0
	cmp r4, #1
	movle r3, #1
	cmp r3, #1
	beq .LU56
	b .LU57
.LU56:
	mov r4, r6
	b .LU54
.LU57:
	b .LU58
.LU58:
	movw r1, #0
	mov r0, r6
	bl get
	mov r4, r0
	mov r0, r6
	bl size
	mov r3, r0
	sub r3, r3, #1
	mov r1, r3
	mov r0, r6
	bl get
	mov r3, r0
	add r4, r4, r3
	movw r1, #2
	mov r0, r4
	bl __aeabi_idiv
	mov r7, r0
	mov r4, #0
	cmp r6, #0
	movne r4, #1
	mov r9, r6
	movw r8, #0
	movw r5, #0
	mov r0, r6
	movw r3, #0
	mov r2, r7
	movw r1, #0
	movw r7, #0
	cmp r4, #1
	beq .LU59
	b .LU60
.LU59:
	mov r4, r6
	mov r5, r7
	mov r6, r1
	mov r7, r2
	mov r8, r3
	mov r9, r0
	mov r1, r8
	mov r0, r9
	bl get
	mov r3, r0
	mov r0, #0
	cmp r3, r7
	movgt r0, #1
	cmp r0, #1
	beq .LU61
	b .LU62
.LU61:
	mov r1, r8
	mov r0, r9
	bl get
	mov r3, r0
	mov r1, r3
	mov r0, r6
	bl add
	mov r6, r0
	mov r3, r8
	mov r0, r9
	b .LU63
.LU62:
	mov r1, r8
	mov r0, r9
	bl get
	mov r3, r0
	mov r1, r3
	mov r0, r5
	bl add
	mov r5, r0
	mov r3, r8
	mov r0, r9
	b .LU63
.LU63:
	mov r2, r7
	mov r1, r6
	mov r7, r5
	add r4, r4, #4
	ldr r6, [r4]
	add r3, r3, #1
	mov r4, #0
	cmp r6, #0
	movne r4, #1
	mov r9, r0
	mov r8, r7
	mov r5, r1
	cmp r4, #1
	beq .LU59
	b .LU60
.LU60:
	mov r4, r5
	mov r5, r8
	mov r3, r9
	mov r0, r3
	bl freeList
	mov r0, r5
	bl quickSort
	mov r5, r0
	mov r0, r4
	bl quickSort
	mov r4, r0
	mov r1, r4
	mov r0, r5
	bl concatLists
	mov r4, r0
	b .LU54
.LU54:
	mov r0, r4
	pop {r4, r5, r6, r7, r8, r9}
	pop {fp, pc}
	.size quickSort, .-quickSort
	.align 2
	.global quickSortMain
quickSortMain:
.LU65:
	push {fp, lr}
	add fp, sp, #4
	push {r4}
	mov r4, r0
	mov r0, r4
	bl printList
	movw r0, #0
	movw r3, #999
	sub r3, r0, r3
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r4
	bl printList
	movw r0, #0
	movw r3, #999
	sub r3, r0, r3
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r4
	bl printList
	movw r3, #0
	movw r0, #999
	sub r3, r3, r0
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .LU64
.LU64:
	movw r0, #0
	pop {r4}
	pop {fp, pc}
	.size quickSortMain, .-quickSortMain
	.align 2
	.global treesearch
treesearch:
.LU67:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5}
	mov r4, r0
	mov r5, r1
	movw r0, #0
	sub r0, r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #0
	cmp r4, #0
	movne r0, #1
	cmp r0, #1
	beq .LU68
	b .LU69
.LU68:
	mov r0, r4
	ldr r2, [r0]
	mov r0, #0
	cmp r2, r5
	moveq r0, #1
	cmp r0, #1
	beq .LU71
	b .LU72
.LU71:
	movw r0, #1
	b .LU66
.LU72:
	b .LU73
.LU73:
	add r0, r4, #4
	ldr r0, [r0]
	mov r1, r5
	bl treesearch
	mov r2, #0
	cmp r0, #1
	moveq r2, #1
	cmp r2, #1
	beq .LU74
	b .LU75
.LU74:
	movw r0, #1
	b .LU66
.LU75:
	b .LU76
.LU76:
	add r0, r4, #8
	ldr r0, [r0]
	mov r1, r5
	bl treesearch
	mov r2, #0
	cmp r0, #1
	moveq r2, #1
	cmp r2, #1
	beq .LU77
	b .LU78
.LU77:
	movw r0, #1
	b .LU66
.LU78:
	movw r0, #0
	b .LU66
.LU69:
	b .LU70
.LU70:
	movw r0, #0
	b .LU66
.LU66:
	pop {r4, r5}
	pop {fp, pc}
	.size treesearch, .-treesearch
	.align 2
	.global inOrder
inOrder:
.LU81:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6}
	mov r5, r0
	mov r3, #0
	cmp r5, #0
	movne r3, #1
	cmp r3, #1
	beq .LU82
	b .LU83
.LU82:
	movw r0, #8
	bl malloc
	mov r3, r0
	mov r6, r3
	mov r3, r5
	ldr r0, [r3]
	mov r3, r6
	str r0, [r3]
	add r3, r6, #4
	movw r0, #0
	str r0, [r3]
	add r3, r5, #4
	ldr r3, [r3]
	mov r0, r3
	bl inOrder
	mov r4, r0
	add r3, r5, #8
	ldr r3, [r3]
	mov r0, r3
	bl inOrder
	mov r3, r0
	mov r1, r3
	mov r0, r6
	bl concatLists
	mov r3, r0
	mov r1, r3
	mov r0, r4
	bl concatLists
	mov r3, r0
	b .LU80
.LU83:
	movw r3, #0
	b .LU80
.LU80:
	mov r0, r3
	pop {r4, r5, r6}
	pop {fp, pc}
	.size inOrder, .-inOrder
	.align 2
	.global bintreesearch
bintreesearch:
.LU86:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5}
	mov r4, r0
	mov r5, r1
	movw r0, #0
	sub r0, r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #0
	cmp r4, #0
	movne r0, #1
	cmp r0, #1
	beq .LU87
	b .LU88
.LU87:
	mov r0, r4
	ldr r0, [r0]
	mov r3, #0
	cmp r0, r5
	moveq r3, #1
	cmp r3, #1
	beq .LU90
	b .LU91
.LU90:
	movw r0, #1
	b .LU85
.LU91:
	b .LU92
.LU92:
	mov r0, r4
	ldr r0, [r0]
	mov r3, #0
	cmp r5, r0
	movlt r3, #1
	cmp r3, #1
	beq .LU93
	b .LU94
.LU93:
	add r0, r4, #4
	ldr r0, [r0]
	mov r1, r5
	bl bintreesearch
	b .LU85
.LU94:
	add r0, r4, #8
	ldr r0, [r0]
	mov r1, r5
	bl bintreesearch
	b .LU85
.LU88:
	b .LU89
.LU89:
	movw r0, #0
	b .LU85
.LU85:
	pop {r4, r5}
	pop {fp, pc}
	.size bintreesearch, .-bintreesearch
	.align 2
	.global buildTree
buildTree:
.LU97:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6}
	mov r4, r0
	mov r0, r4
	bl size
	mov r2, r0
	movw r3, #0
	mov r1, #0
	cmp r3, r2
	movlt r1, #1
	movw r2, #0
	movw r3, #0
	movw r5, #0
	cmp r1, #1
	beq .LU98
	b .LU99
.LU98:
	mov r6, r5
	mov r5, r4
	mov r4, r3
	mov r1, r6
	mov r0, r5
	bl get
	mov r2, r0
	mov r1, r2
	mov r0, r4
	bl treeadd
	mov r4, r0
	add r6, r6, #1
	mov r0, r5
	bl size
	mov r2, r0
	mov r1, #0
	cmp r6, r2
	movlt r1, #1
	mov r2, r4
	mov r3, r4
	mov r4, r5
	mov r5, r6
	cmp r1, #1
	beq .LU98
	b .LU99
.LU99:
	mov r4, r2
	b .LU96
.LU96:
	mov r0, r4
	pop {r4, r5, r6}
	pop {fp, pc}
	.size buildTree, .-buildTree
	.align 2
	.global treeMain
treeMain:
.LU101:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5}
	mov r3, r0
	mov r0, r3
	bl buildTree
	mov r4, r0
	mov r0, r4
	bl treeprint
	movw r0, #0
	movw r3, #999
	sub r3, r0, r3
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r4
	bl inOrder
	mov r5, r0
	mov r0, r5
	bl printList
	movw r3, #0
	movw r0, #999
	sub r3, r3, r0
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r5
	bl freeList
	mov r0, r4
	bl postOrder
	mov r5, r0
	mov r0, r5
	bl printList
	movw r3, #0
	movw r0, #999
	sub r3, r3, r0
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r5
	bl freeList
	movw r1, #0
	mov r0, r4
	bl treesearch
	mov r3, r0
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r3, #0
	movw r0, #999
	sub r3, r3, r0
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r1, #10
	mov r0, r4
	bl treesearch
	mov r3, r0
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r3, #0
	movw r0, #999
	sub r3, r3, r0
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r3, #0
	sub r3, r3, #2
	mov r1, r3
	mov r0, r4
	bl treesearch
	mov r3, r0
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r0, #0
	movw r3, #999
	sub r3, r0, r3
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r1, #2
	mov r0, r4
	bl treesearch
	mov r3, r0
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r3, #0
	movw r0, #999
	sub r3, r3, r0
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r1, #3
	mov r0, r4
	bl treesearch
	mov r3, r0
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r0, #0
	movw r3, #999
	sub r3, r0, r3
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r1, #9
	mov r0, r4
	bl treesearch
	mov r3, r0
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r3, #0
	movw r0, #999
	sub r3, r3, r0
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r1, #1
	mov r0, r4
	bl treesearch
	mov r3, r0
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r0, #0
	movw r3, #999
	sub r3, r0, r3
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r1, #0
	mov r0, r4
	bl bintreesearch
	mov r3, r0
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r0, #0
	movw r3, #999
	sub r3, r0, r3
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r1, #10
	mov r0, r4
	bl bintreesearch
	mov r3, r0
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r0, #0
	movw r3, #999
	sub r3, r0, r3
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r3, #0
	sub r3, r3, #2
	mov r1, r3
	mov r0, r4
	bl bintreesearch
	mov r3, r0
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r3, #0
	movw r0, #999
	sub r3, r3, r0
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r1, #2
	mov r0, r4
	bl bintreesearch
	mov r3, r0
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r3, #0
	movw r0, #999
	sub r3, r3, r0
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r1, #3
	mov r0, r4
	bl bintreesearch
	mov r3, r0
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r0, #0
	movw r3, #999
	sub r3, r0, r3
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r1, #9
	mov r0, r4
	bl bintreesearch
	mov r3, r0
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r0, #0
	movw r3, #999
	sub r3, r0, r3
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r1, #1
	mov r0, r4
	bl bintreesearch
	mov r3, r0
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r3, #0
	movw r0, #999
	sub r3, r3, r0
	mov r1, r3
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r4
	bl freeTree
	b .LU100
.LU100:
	pop {r4, r5}
	pop {fp, pc}
	.size treeMain, .-treeMain
	.align 2
	.global myCopy
myCopy:
.LU103:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5}
	mov r4, r0
	mov r3, #0
	cmp r4, #0
	moveq r3, #1
	cmp r3, #1
	beq .LU104
	b .LU105
.LU104:
	movw r3, #0
	b .LU102
.LU105:
	b .LU106
.LU106:
	mov r3, r4
	ldr r3, [r3]
	mov r1, r3
	movw r0, #0
	bl add
	mov r5, r0
	add r3, r4, #4
	ldr r3, [r3]
	mov r0, r3
	bl myCopy
	mov r3, r0
	mov r1, r3
	mov r0, r5
	bl concatLists
	mov r3, r0
	b .LU102
.LU102:
	mov r0, r3
	pop {r4, r5}
	pop {fp, pc}
	.size myCopy, .-myCopy
	.align 2
	.global main
main:
.LU108:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7}
	movw r3, #0
	mov r0, #0
	cmp r3, #10
	movlt r0, #1
	movw r3, #0
	movw r1, #0
	movw r4, #0
	movw r6, #0
	movw r5, #0
	cmp r0, #1
	beq .LU109
	b .LU110
.LU109:
	mov r4, r6
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r3, #:lower16:.read_scratch
	movt r3, #:upper16:.read_scratch
	ldr r3, [r3]
	mov r1, r3
	mov r0, r4
	bl add
	mov r6, r0
	mov r0, r6
	bl myCopy
	mov r4, r0
	mov r0, r6
	bl myCopy
	mov r7, r0
	mov r0, r4
	bl quickSortMain
	mov r3, r0
	mov r0, r3
	bl freeList
	mov r0, r7
	bl treeMain
	add r5, r5, #1
	mov r0, #0
	cmp r5, #10
	movlt r0, #1
	mov r3, r6
	mov r1, r4
	mov r4, r7
	cmp r0, #1
	beq .LU109
	b .LU110
.LU110:
	mov r5, r1
	mov r0, r3
	bl freeList
	mov r0, r5
	bl freeList
	mov r0, r4
	bl freeList
	b .LU107
.LU107:
	movw r0, #0
	pop {r4, r5, r6, r7}
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
