	.file	"Code_1.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Enter N: \0"
.LC1:
	.ascii "%d\0"
.LC2:
	.ascii "0\0"
.LC5:
	.ascii "Sum = %.0lf\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	call	__main
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-32(%rbp), %rax
	leaq	.LC1(%rip), %rcx
	movq	%rax, %rdx
	call	scanf
	cmpl	$1, %eax
	jne	.L2
	movl	-32(%rbp), %eax
	testl	%eax, %eax
	jg	.L3
.L2:
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$0, %eax
	jmp	.L9
.L3:
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -8(%rbp)
	movl	$1, -12(%rbp)
	jmp	.L5
.L8:
	movsd	.LC4(%rip), %xmm0
	movsd	%xmm0, -24(%rbp)
	movl	$0, -28(%rbp)
	jmp	.L6
.L7:
	pxor	%xmm0, %xmm0
	cvtsi2sdl	-12(%rbp), %xmm0
	movsd	-24(%rbp), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	addl	$1, -28(%rbp)
.L6:
	movl	-28(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jl	.L7
	movsd	-8(%rbp), %xmm0
	addsd	-24(%rbp), %xmm0
	movsd	%xmm0, -8(%rbp)
	addl	$1, -12(%rbp)
.L5:
	movl	-32(%rbp), %eax
	cmpl	%eax, -12(%rbp)
	jle	.L8
	movsd	-8(%rbp), %xmm0
	movq	-8(%rbp), %rdx
	leaq	.LC5(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %rcx
	call	printf
	movl	$0, %eax
.L9:
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC4:
	.long	0
	.long	1072693248
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev8, Built by MSYS2 project) 15.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
