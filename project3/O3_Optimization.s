	.file	"project3.c"
	.text
	.p2align 4
	.globl	getAscii
	.type	getAscii, @function
getAscii:
.LFB11:
	.cfi_startproc
	leal	-32(%rdi), %eax
	cmpl	$95, %eax
	movl	$46, %eax
	cmovb	%edi, %eax
	ret
	.cfi_endproc
.LFE11:
	.size	getAscii, .-getAscii
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"rb"
.LC1:
	.string	"%08X "
.LC2:
	.string	"%02X "
.LC3:
	.string	"   "
	.text
	.p2align 4
	.globl	hexdump
	.type	hexdump, @function
hexdump:
.LFB12:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$.LC0, %esi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	xorl	%r14d, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	$46, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	call	fopen
	movq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L5:
	movq	%r15, %rcx
	movl	$16, %edx
	movl	$1, %esi
	movq	%rsp, %rdi
	call	fread
	movq	%rax, %r13
	movl	%eax, %ebp
	testl	%eax, %eax
	je	.L19
	movl	%r14d, %esi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	printf
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L21:
	movzbl	(%rsp,%rbx), %esi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	addq	$1, %rbx
	call	printf
	cmpq	$16, %rbx
	je	.L20
.L8:
	cmpl	%ebx, %ebp
	jg	.L21
	movl	$.LC3, %edi
	xorl	%eax, %eax
	addq	$1, %rbx
	call	printf
	cmpq	$16, %rbx
	jne	.L8
.L20:
	movl	$124, %edi
	xorl	%ebx, %ebx
	call	putchar
	.p2align 4,,10
	.p2align 3
.L11:
	cmpl	%ebx, %ebp
	jle	.L9
	movzbl	(%rsp,%rbx), %eax
	movl	%eax, %edi
	subl	$32, %eax
	movsbl	%dil, %edi
	cmpl	$95, %eax
	cmovnb	%r12d, %edi
	call	putchar
.L9:
	addq	$1, %rbx
	cmpq	$16, %rbx
	jne	.L11
	movl	$124, %edi
	addl	%r13d, %r14d
	call	putchar
	movl	$10, %edi
	call	putchar
	jmp	.L5
.L19:
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE12:
	.size	hexdump, .-hexdump
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB13:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	8(%rsi), %rdi
	call	hexdump
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE13:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
	.section	.note.GNU-stack,"",@progbits
