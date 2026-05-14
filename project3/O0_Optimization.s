	.file	"project3.c"
	.text
	.globl	getAscii
	.type	getAscii, @function
getAscii:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	cmpl	$31, -4(%rbp)
	jle	.L2
	cmpl	$126, -4(%rbp)
	jg	.L2
	movl	-4(%rbp), %eax
	jmp	.L3
.L2:
	movl	$46, %eax
.L3:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	getAscii, .-getAscii
	.section	.rodata
.LC0:
	.string	"rb"
.LC1:
	.string	"%08X "
.LC2:
	.string	"%02X "
.LC3:
	.string	"   "
	.text
	.globl	hexdump
	.type	hexdump, @function
hexdump:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	-56(%rbp), %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -24(%rbp)
	movl	$1, -4(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L5
.L15:
	movq	-24(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movl	$16, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L16
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	$0, -12(%rbp)
	jmp	.L8
.L11:
	movl	-12(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jge	.L9
	movl	-12(%rbp), %eax
	cltq
	movzbl	-48(%rbp,%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	jmp	.L10
.L9:
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
.L10:
	addl	$1, -12(%rbp)
.L8:
	cmpl	$15, -12(%rbp)
	jle	.L11
	movl	$124, %edi
	call	putchar
	movl	$0, -16(%rbp)
	jmp	.L12
.L14:
	movl	-16(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jge	.L13
	movl	-16(%rbp), %eax
	cltq
	movzbl	-48(%rbp,%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %edi
	call	getAscii
	movsbl	%al, %eax
	movl	%eax, %edi
	call	putchar
.L13:
	addl	$1, -16(%rbp)
.L12:
	cmpl	$15, -16(%rbp)
	jle	.L14
	movl	$124, %edi
	call	putchar
	movl	$10, %edi
	call	putchar
	movl	-4(%rbp), %eax
	addl	%eax, -8(%rbp)
.L5:
	cmpl	$0, -4(%rbp)
	jne	.L15
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	jmp	.L4
.L16:
	nop
.L4:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	hexdump, .-hexdump
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	hexdump
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
	.section	.note.GNU-stack,"",@progbits
