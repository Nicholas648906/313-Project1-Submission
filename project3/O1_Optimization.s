	.file	"project3.c"
	.text
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
	.globl	hexdump
	.type	hexdump, @function
hexdump:
.LFB12:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	$.LC0, %esi
	call	fopen
	movq	%rax, %r15
	movl	$0, %r14d
	movl	$46, %r13d
	jmp	.L12
.L6:
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
.L7:
	addq	$1, %rbx
	cmpq	$16, %rbx
	je	.L18
.L8:
	cmpl	%ebx, %ebp
	jle	.L6
	movzbl	(%rsp,%rbx), %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	jmp	.L7
.L18:
	movl	$124, %edi
	call	putchar
	movl	$0, %ebx
	jmp	.L11
.L9:
	addq	$1, %rbx
	cmpq	$16, %rbx
	je	.L19
.L11:
	cmpl	%ebx, %ebp
	jle	.L9
	movzbl	(%rsp,%rbx), %edi
	movzbl	%dil, %eax
	subl	$32, %eax
	cmpl	$95, %eax
	cmovnb	%r13d, %edi
	movsbl	%dil, %edi
	call	putchar
	jmp	.L9
.L19:
	movl	$124, %edi
	call	putchar
	movl	$10, %edi
	call	putchar
	addl	%r12d, %r14d
.L12:
	movq	%r15, %rcx
	movl	$16, %edx
	movl	$1, %esi
	movq	%rsp, %rdi
	call	fread
	movq	%rax, %r12
	movl	%eax, %ebp
	testl	%eax, %eax
	je	.L16
	movl	%r14d, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %ebx
	jmp	.L8
.L16:
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
	.globl	main
	.type	main, @function
main:
.LFB13:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	8(%rsi), %rdi
	call	hexdump
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE13:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
	.section	.note.GNU-stack,"",@progbits
