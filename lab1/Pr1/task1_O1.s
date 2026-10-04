	.file	"Code_1.c"
	.text
	.section .rdata,"dr"
.LC2:
	.ascii "Enter N: \0"
.LC3:
	.ascii "%d\0"
.LC4:
	.ascii "0\0"
.LC5:
	.ascii "Sum = %.0lf\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	call	__main
	leaq	.LC2(%rip), %rcx
	call	printf
	leaq	44(%rsp), %rdx
	leaq	.LC3(%rip), %rcx
	call	scanf
	cmpl	$1, %eax
	jne	.L2
	movl	44(%rsp), %ecx
	testl	%ecx, %ecx
	jle	.L2
	addl	$1, %ecx
	pxor	%xmm1, %xmm1
.L3:
	testl	%eax, %eax
	jle	.L13
	movl	$0, %edx
	movsd	.LC0(%rip), %xmm0
	pxor	%xmm2, %xmm2
	cvtsi2sdl	%eax, %xmm2
	.p2align 4
.L5:
	mulsd	%xmm2, %xmm0
	addl	$1, %edx
	cmpl	%eax, %edx
	jne	.L5
	addsd	%xmm0, %xmm1
	addl	$1, %eax
	cmpl	%eax, %ecx
	jne	.L3
	movq	%xmm1, %rdx
	leaq	.LC5(%rip), %rcx
	call	printf
	jmp	.L11
.L2:
	leaq	.LC4(%rip), %rcx
	call	puts
.L11:
	movl	$0, %eax
	addq	$56, %rsp
	ret
.L13:
	addsd	.LC0(%rip), %xmm1
	addl	$1, %eax
	jmp	.L3
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev8, Built by MSYS2 project) 15.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
