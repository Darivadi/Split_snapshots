	.file	"main_split_snap.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Inside conf2dump routine"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"grep -v \"#\" %s | grep -v \"^$\" | gawk -F\"=\" '{print $2}' > %s.dump"
	.section	.rodata.str1.1
.LC2:
	.string	"Leaving conf2dump routine"
	.text
	.p2align 4,,15
	.globl	conf2dump
	.type	conf2dump, @function
conf2dump:
.LFB64:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movl	$.LC0, %edi
	subq	$1008, %rsp
	.cfi_def_cfa_offset 1024
	movq	%fs:40, %rax
	movq	%rax, 1000(%rsp)
	xorl	%eax, %eax
	call	puts
	movl	$1000, %edx
	movq	%rbx, %r9
	movq	%rbx, %r8
	movl	$.LC1, %ecx
	movl	$1, %esi
	movq	%rsp, %rdi
	xorl	%eax, %eax
	call	__sprintf_chk
	movq	%rsp, %rdi
	call	system
	movl	$.LC2, %edi
	call	puts
	xorl	%eax, %eax
	movq	1000(%rsp), %rdx
	xorq	%fs:40, %rdx
	jne	.L5
	addq	$1008, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L5:
	.cfi_restore_state
	call	__stack_chk_fail
	.cfi_endproc
.LFE64:
	.size	conf2dump, .-conf2dump
	.section	.rodata.str1.1
.LC3:
	.string	"Filename: %s\n"
.LC4:
	.string	"r"
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"  * The file '%s' doesn't exist!\n"
	.section	.rodata.str1.1
.LC6:
	.string	"Converting to plain text"
.LC7:
	.string	"%s.dump"
.LC8:
	.string	"%d"
.LC9:
	.string	"%s"
	.section	.rodata.str1.8
	.align 8
.LC10:
	.string	"  * The file '%s' has been loaded!\n"
	.section	.rodata.str1.1
.LC11:
	.string	"rm -rf %s.dump"
	.text
	.p2align 4,,15
	.globl	read_parameters
	.type	read_parameters, @function
read_parameters:
.LFB65:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rdx
	movl	$.LC3, %esi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	movl	$1, %edi
	subq	$2024, %rsp
	.cfi_def_cfa_offset 2048
	movq	%fs:40, %rax
	movq	%rax, 2008(%rsp)
	xorl	%eax, %eax
	call	__printf_chk
	movl	$.LC4, %esi
	movq	%rbx, %rdi
	call	fopen
	testq	%rax, %rax
	je	.L11
	movq	%rax, %rdi
	call	fclose
	movl	$.LC6, %edi
	call	puts
	movl	$.LC0, %edi
	call	puts
	leaq	1008(%rsp), %rdi
	movq	%rbx, %r9
	movq	%rbx, %r8
	movl	$.LC1, %ecx
	movl	$1000, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__sprintf_chk
	leaq	1008(%rsp), %rdi
	call	system
	movl	$.LC2, %edi
	call	puts
	leaq	1008(%rsp), %rdi
	movq	%rbx, %r8
	movl	$.LC7, %ecx
	movl	$1000, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__sprintf_chk
	leaq	1008(%rsp), %rdi
	movl	$.LC4, %esi
	call	fopen
	movl	$GV+20, %edx
	movq	%rax, %rbp
	movq	%rax, %rdi
	movl	$.LC8, %esi
	xorl	%eax, %eax
	call	__isoc99_fscanf
	movl	$GV+24, %edx
	movl	$.LC9, %esi
	movq	%rbp, %rdi
	xorl	%eax, %eax
	call	__isoc99_fscanf
	cvtsi2sd	GV+20(%rip), %xmm1
	movapd	%xmm1, %xmm0
	movq	%rbp, %rdi
	mulsd	%xmm1, %xmm0
	mulsd	%xmm1, %xmm0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm2
	movss	%xmm2, GV+12(%rip)
	call	fclose
	movq	%rbx, %rdx
	movl	$.LC10, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movq	%rbx, %r8
	movl	$.LC11, %ecx
	movl	$1000, %edx
	movl	$1, %esi
	movq	%rsp, %rdi
	xorl	%eax, %eax
	call	__sprintf_chk
	movq	%rsp, %rdi
	call	system
	xorl	%eax, %eax
.L8:
	movq	2008(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L12
	addq	$2024, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L11:
	.cfi_restore_state
	movq	%rbx, %rdx
	movl	$.LC5, %esi
	movl	$1, %edi
	call	__printf_chk
	movl	$1, %eax
	jmp	.L8
.L12:
	call	__stack_chk_fail
	.cfi_endproc
.LFE65:
	.size	read_parameters, .-read_parameters
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"############################################################"
	.section	.rodata.str1.1
.LC13:
	.string	"Reading snapshot %s\n"
.LC14:
	.string	"File %s cannot be open\n"
	.section	.rodata.str1.8
	.align 8
.LC15:
	.string	"----------------------------------------"
	.section	.rodata.str1.1
.LC16:
	.string	"Reading snapshot with:"
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"Type %d has Npart=%12d NpartTotal=%12d with mass %16.8lf\n"
	.align 8
.LC18:
	.string	" There is a total %d particles in the snapshot\n\n"
	.section	.rodata.str1.1
.LC19:
	.string	" * Frame's Time... %16.8f\n"
.LC20:
	.string	" * Redshift... %16.8f\n"
.LC21:
	.string	" * Flagsfr... %d\n"
.LC22:
	.string	" * Flagfed... %d\n"
.LC23:
	.string	" * Flagcool... %d\n"
.LC24:
	.string	" * numfiles... %d\n"
.LC25:
	.string	" * Boxsize... %16.8f\n"
.LC26:
	.string	" * Omega0... %16.8f\n"
.LC27:
	.string	" * OmageLa... %16.8f\n"
.LC28:
	.string	" * Hubbleparam... %16.8f\n"
	.section	.rodata.str1.8
	.align 8
.LC29:
	.string	"Structure particles could not be allocated"
	.align 8
.LC30:
	.string	" Can not read properly ids %d %lu\n"
	.text
	.p2align 4,,15
	.globl	readGADGETBinaryFile
	.type	readGADGETBinaryFile, @function
readGADGETBinaryFile:
.LFB66:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$.LC12, %edi
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
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	call	puts
	movl	$GV+24, %edx
	movl	$.LC13, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movl	$.LC4, %esi
	movl	$GV+24, %edi
	call	fopen
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L56
.L14:
	leaq	20(%rsp), %rdi
	movq	%rbx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	xorl	%ebp, %ebp
	xorl	%r12d, %r12d
	call	fread
	movq	%rbx, %rcx
	movl	$1, %edx
	movl	$256, %esi
	movl	$Header, %edi
	call	fread
	leaq	20(%rsp), %rdi
	movq	%rbx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	call	fread
	movl	$.LC15, %edi
	call	puts
	movl	$.LC16, %edi
	call	puts
	movl	$.LC15, %edi
	call	puts
	.p2align 4,,10
	.p2align 3
.L16:
	movl	Header+96(,%rbp,4), %r8d
	movl	Header(,%rbp,4), %ecx
	movl	%ebp, %edx
	movsd	Header+24(,%rbp,8), %xmm0
	movl	$.LC17, %esi
	movl	$1, %edi
	movl	$1, %eax
	addq	$1, %rbp
	addl	%r8d, %r12d
	call	__printf_chk
	cmpq	$6, %rbp
	jne	.L16
	movl	%r12d, %edx
	movl	$.LC18, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movl	$.LC15, %edi
	call	puts
	movsd	Header+72(%rip), %xmm0
	movl	$.LC19, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	movsd	Header+80(%rip), %xmm0
	movl	$.LC20, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	movl	Header+88(%rip), %edx
	movl	$.LC21, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movl	Header+92(%rip), %edx
	movl	$.LC22, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movl	Header+120(%rip), %edx
	movl	$.LC23, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movl	Header+124(%rip), %edx
	movl	$.LC24, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movsd	Header+128(%rip), %xmm0
	movl	$.LC25, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	movsd	Header+136(%rip), %xmm0
	movl	$.LC26, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	movsd	Header+144(%rip), %xmm0
	movl	$.LC27, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	movsd	Header+152(%rip), %xmm0
	movl	$.LC28, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	movslq	%r12d, %rax
	movl	$32, %esi
	movq	%rax, %rdi
	movq	%rax, (%rsp)
	call	calloc
	testq	%rax, %rax
	movq	%rax, part(%rip)
	je	.L57
	leaq	20(%rsp), %rdi
	movq	%rbx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	call	fread
	testl	%r12d, %r12d
	jle	.L21
	leal	-1(%r12), %r15d
	leaq	32(%rsp), %rbp
	xorl	%r13d, %r13d
	addq	$1, %r15
	salq	$5, %r15
	.p2align 4,,10
	.p2align 3
.L22:
	movq	%rbx, %rcx
	movl	$3, %edx
	movl	$4, %esi
	movq	%rbp, %rdi
	call	fread
	movq	%r13, %rax
	addq	part(%rip), %rax
	addq	$32, %r13
	movss	32(%rsp), %xmm0
	cmpq	%r15, %r13
	movss	%xmm0, 4(%rax)
	movss	36(%rsp), %xmm0
	movss	%xmm0, 8(%rax)
	movss	40(%rsp), %xmm0
	movss	%xmm0, 12(%rax)
	jne	.L22
.L21:
	leaq	20(%rsp), %rdi
	movq	%rbx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	call	fread
	movl	20(%rsp), %edx
	leal	(%r12,%r12,2), %ecx
	movslq	%ecx, %rcx
	movslq	%edx, %r15
	salq	$2, %rcx
	cmpq	%rcx, %r15
	jne	.L55
	leaq	20(%rsp), %rdi
	movq	%rbx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	call	fread
	testl	%r12d, %r12d
	jle	.L26
	leal	-1(%r12), %r13d
	leaq	32(%rsp), %rbp
	xorl	%r14d, %r14d
	addq	$1, %r13
	salq	$5, %r13
	.p2align 4,,10
	.p2align 3
.L27:
	movq	%rbx, %rcx
	movl	$3, %edx
	movl	$4, %esi
	movq	%rbp, %rdi
	call	fread
	movq	%r14, %rax
	addq	part(%rip), %rax
	addq	$32, %r14
	movss	32(%rsp), %xmm0
	cmpq	%r13, %r14
	movss	%xmm0, 16(%rax)
	movss	36(%rsp), %xmm0
	movss	%xmm0, 20(%rax)
	movss	40(%rsp), %xmm0
	movss	%xmm0, 24(%rax)
	jne	.L27
.L26:
	leaq	20(%rsp), %rdi
	movl	$1, %edx
	movq	%rbx, %rcx
	movl	$4, %esi
	call	fread
	movl	20(%rsp), %edx
	movslq	%edx, %rax
	cmpq	%rax, %r15
	jne	.L58
	leaq	20(%rsp), %rdi
	movq	%rbx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	call	fread
	testl	%r12d, %r12d
	jle	.L31
	leal	-1(%r12), %r13d
	xorl	%ebp, %ebp
	addq	$1, %r13
	salq	$5, %r13
	.p2align 4,,10
	.p2align 3
.L32:
	leaq	28(%rsp), %rdi
	movl	$1, %edx
	movq	%rbx, %rcx
	movl	$4, %esi
	call	fread
	movl	28(%rsp), %edx
	movq	part(%rip), %rax
	movl	%edx, (%rax,%rbp)
	addq	$32, %rbp
	cmpq	%r13, %rbp
	jne	.L32
.L31:
	leaq	20(%rsp), %rdi
	movq	%rbx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	call	fread
	movl	20(%rsp), %edx
	movq	(%rsp), %rcx
	movslq	%edx, %rax
	salq	$2, %rcx
	cmpq	%rcx, %rax
	jne	.L55
	leaq	20(%rsp), %rdi
	movq	%rbx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	xorl	%ebp, %ebp
	call	fread
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L44:
	xorpd	%xmm1, %xmm1
	movl	Header+96(%rbp), %edx
	movsd	Header+24(%rbp,%rbp), %xmm0
	ucomisd	%xmm1, %xmm0
	leal	(%rdx,%rax), %r14d
	jp	.L33
	jne	.L33
	testl	%edx, %edx
	je	.L38
	cmpl	%eax, %r14d
	.p2align 4,,6
	jle	.L38
	movslq	%eax, %rsi
	notl	%eax
	movl	%eax, (%rsp)
	addl	%r14d, %eax
	movq	%rsi, %r15
	leaq	1(%rax,%rsi), %r13
	movq	%rsi, 8(%rsp)
	salq	$5, %r15
	salq	$5, %r13
	.p2align 4,,10
	.p2align 3
.L40:
	leaq	24(%rsp), %rdi
	movl	$1, %edx
	movq	%rbx, %rcx
	movl	$4, %esi
	call	fread
	movq	part(%rip), %rdx
	movss	24(%rsp), %xmm0
	movss	%xmm0, 28(%rdx,%r15)
	addq	$32, %r15
	cmpq	%r13, %r15
	jne	.L40
	xorpd	%xmm2, %xmm2
	movsd	Header+24(%rbp,%rbp), %xmm0
	ucomisd	%xmm2, %xmm0
	jp	.L46
	jne	.L46
.L38:
	addq	$4, %rbp
	cmpq	$24, %rbp
	je	.L59
.L36:
	movl	%r14d, %eax
	jmp	.L44
	.p2align 4,,10
	.p2align 3
.L33:
	testl	%edx, %edx
	je	.L38
	cmpl	%eax, %r14d
	.p2align 4,,3
	jle	.L38
	movq	part(%rip), %rdx
	movslq	%eax, %rcx
	notl	%eax
	movq	%rcx, 8(%rsp)
	movl	%eax, (%rsp)
.L42:
	unpcklpd	%xmm0, %xmm0
	movl	(%rsp), %esi
	movq	8(%rsp), %r15
	cvtpd2ps	%xmm0, %xmm0
	leal	(%rsi,%r14), %ecx
	movq	%r15, %rax
	salq	$5, %rax
	addq	%rcx, %r15
	leaq	28(%rdx,%rax), %rax
	salq	$5, %r15
	leaq	60(%rdx,%r15), %rdx
	.p2align 4,,10
	.p2align 3
.L43:
	movss	%xmm0, (%rax)
	addq	$32, %rax
	cmpq	%rdx, %rax
	jne	.L43
	addq	$4, %rbp
	cmpq	$24, %rbp
	jne	.L36
.L59:
	leaq	20(%rsp), %rdi
	movq	%rbx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	call	fread
	movq	%rbx, %rdi
	call	fclose
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r12d, %eax
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
.L56:
	.cfi_restore_state
	movl	$GV+24, %edx
	movl	$.LC14, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	jmp	.L14
.L57:
	movl	$.LC29, %edi
	call	puts
	xorl	%edi, %edi
	call	exit
.L46:
	movl	Header+96(%rbp), %eax
	testl	%eax, %eax
	jne	.L42
	jmp	.L38
.L58:
	movq	%r15, %rcx
.L55:
	movl	$1, %edi
	movl	$.LC30, %esi
	xorl	%eax, %eax
	call	__printf_chk
	xorl	%edi, %edi
	call	exit
	.cfi_endproc
.LFE66:
	.size	readGADGETBinaryFile, .-readGADGETBinaryFile
	.section	.rodata.str1.1
.LC32:
	.string	"Writing in file %s\n"
.LC33:
	.string	"w"
	.section	.rodata.str1.8
	.align 8
.LC34:
	.string	"File %s is ready to be writen\n"
	.section	.rodata.str1.1
.LC35:
	.string	"Header writen"
.LC36:
	.string	"dummy = %d\n"
.LC37:
	.string	"dummy writen"
.LC38:
	.string	"IDs writen"
.LC39:
	.string	"Positions writen"
.LC40:
	.string	"Velocities writen"
	.text
	.p2align 4,,15
	.globl	writeGADGETBinaryFile
	.type	writeGADGETBinaryFile, @function
writeGADGETBinaryFile:
.LFB67:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %rbx
	movl	$.LC12, %edi
	subq	$48, %rsp
	.cfi_def_cfa_offset 96
	call	puts
	movq	%rbx, %rdx
	movl	$.LC32, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movl	$.LC33, %esi
	movq	%rbx, %rdi
	call	fopen
	testq	%rax, %rax
	movq	%rax, %rbp
	je	.L91
.L61:
	movq	%rbx, %rdx
	movl	$.LC34, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movl	GV+4(%rip), %r14d
	leaq	28(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$4, %esi
	call	fwrite
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$256, %esi
	movl	$Header, %edi
	leal	(%r14,%r14,2), %r13d
	call	fwrite
	leaq	28(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$4, %esi
	sall	$2, %r13d
	call	fwrite
	movl	$.LC35, %edi
	call	puts
	movl	%r13d, %edx
	movl	$.LC36, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	movl	%r13d, 28(%rsp)
	call	__printf_chk
	leaq	28(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$4, %esi
	call	fwrite
	movl	$.LC37, %edi
	call	puts
	testl	%r14d, %r14d
	jle	.L62
	leal	-1(%r14), %r12d
	xorl	%ebx, %ebx
	addq	$1, %r12
	salq	$5, %r12
	.p2align 4,,10
	.p2align 3
.L64:
	movq	%rbx, %rax
	addq	copyPart(%rip), %rax
	leaq	32(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$3, %edx
	movl	$4, %esi
	addq	$32, %rbx
	movss	4(%rax), %xmm0
	movss	%xmm0, 32(%rsp)
	movss	8(%rax), %xmm0
	movss	%xmm0, 36(%rsp)
	movss	12(%rax), %xmm0
	movss	%xmm0, 40(%rsp)
	call	fwrite
	cmpq	%r12, %rbx
	jne	.L64
	leaq	28(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$4, %esi
	xorl	%ebx, %ebx
	call	fwrite
	movl	$.LC39, %edi
	call	puts
	leaq	28(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$4, %esi
	call	fwrite
	.p2align 4,,10
	.p2align 3
.L79:
	movq	%rbx, %rax
	addq	copyPart(%rip), %rax
	leaq	32(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$3, %edx
	movl	$4, %esi
	addq	$32, %rbx
	movss	16(%rax), %xmm0
	movss	%xmm0, 32(%rsp)
	movss	20(%rax), %xmm0
	movss	%xmm0, 36(%rsp)
	movss	24(%rax), %xmm0
	movss	%xmm0, 40(%rsp)
	call	fwrite
	cmpq	%r12, %rbx
	jne	.L79
	movl	$.LC40, %edi
	sall	$2, %r14d
	xorl	%ebx, %ebx
	call	puts
	leaq	28(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movl	%r14d, 28(%rsp)
	call	fwrite
	.p2align 4,,10
	.p2align 3
.L81:
	movq	copyPart(%rip), %rax
	leaq	16(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movl	(%rax,%rbx), %eax
	addq	$32, %rbx
	movl	%eax, 16(%rsp)
	call	fwrite
	cmpq	%r12, %rbx
	jne	.L81
.L80:
	movl	$.LC38, %edi
	xorl	%r12d, %r12d
	call	puts
	leaq	28(%rsp), %rdi
	movl	$1, %edx
	movq	%rbp, %rcx
	movl	$4, %esi
	movl	%r13d, 28(%rsp)
	call	fwrite
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L78:
	xorpd	%xmm1, %xmm1
	movl	Header+96(%r12), %eax
	movsd	Header+24(%r12,%r12), %xmm0
	ucomisd	%xmm1, %xmm0
	leal	(%rax,%rdx), %r14d
	jp	.L68
	jne	.L68
	testl	%eax, %eax
	je	.L73
	cmpl	%edx, %r14d
	.p2align 4,,6
	jle	.L73
	movslq	%edx, %rax
	notl	%edx
	addl	%r14d, %edx
	movq	%rax, %rbx
	leaq	1(%rax,%rdx), %r13
	salq	$5, %rbx
	salq	$5, %r13
	.p2align 4,,10
	.p2align 3
.L75:
	movq	copyPart(%rip), %rax
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rsp, %rdi
	movss	28(%rax,%rbx), %xmm0
	addq	$32, %rbx
	movss	%xmm0, (%rsp)
	call	fwrite
	cmpq	%r13, %rbx
	jne	.L75
	xorpd	%xmm2, %xmm2
	movsd	Header+24(%r12,%r12), %xmm0
	ucomisd	%xmm2, %xmm0
	jp	.L83
	jne	.L83
.L73:
	addq	$4, %r12
	cmpq	$24, %r12
	je	.L92
.L71:
	movl	%r14d, %edx
	jmp	.L78
	.p2align 4,,10
	.p2align 3
.L68:
	testl	%eax, %eax
	je	.L73
	cmpl	%edx, %r14d
	.p2align 4,,3
	jle	.L73
.L77:
	unpcklpd	%xmm0, %xmm0
	addq	$4, %r12
	cmpq	$24, %r12
	cvtpd2ps	%xmm0, %xmm3
	movss	%xmm3, (%rsp)
	jne	.L71
.L92:
	leaq	28(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$4, %esi
	call	fwrite
	movq	%rbp, %rdi
	call	fclose
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L62:
	.cfi_restore_state
	leaq	28(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$4, %esi
	sall	$2, %r14d
	call	fwrite
	movl	$.LC39, %edi
	call	puts
	leaq	28(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$4, %esi
	call	fwrite
	movl	$.LC40, %edi
	call	puts
	leaq	28(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movl	%r14d, 28(%rsp)
	call	fwrite
	jmp	.L80
.L91:
	movq	%rbx, %rdx
	movl	$.LC14, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	jmp	.L61
.L83:
	movl	Header+96(%r12), %eax
	testl	%eax, %eax
	jne	.L77
	jmp	.L73
	.cfi_endproc
.LFE67:
	.size	writeGADGETBinaryFile, .-writeGADGETBinaryFile
	.section	.rodata.str1.8
	.align 8
.LC41:
	.string	"Error: Incomplete number of parameters. Execute as follows:"
	.section	.rodata.str1.1
.LC42:
	.string	"%s Parameters_file\n"
.LC43:
	.string	"Reading parameters"
	.section	.rodata.str1.8
	.align 8
.LC46:
	.string	"-----------------------------------------------"
	.section	.rodata.str1.1
.LC47:
	.string	"Cosmological parameters:"
	.section	.rodata.str1.8
	.align 8
.LC48:
	.string	"OmegaM0=%lf OmegaL0=%lf redshift=%lf HubbleParam=%lf\n"
	.section	.rodata.str1.1
.LC49:
	.string	"Filename=%s\n"
	.section	.rodata.str1.8
	.align 8
.LC50:
	.string	"Let's begin with the division of files"
	.section	.rodata.str1.1
.LC51:
	.string	"./Box_400_512_150.%d"
.LC52:
	.string	"Writing file %d\n"
	.section	.rodata.str1.8
	.align 8
.LC53:
	.string	"Allocating memory for copyPart"
	.section	.rodata.str1.1
.LC54:
	.string	"Memory allocated for copyPart"
.LC55:
	.string	"Particle %d\n"
	.section	.rodata.str1.8
	.align 8
.LC56:
	.string	"Reallocating memory for copyPart!"
	.section	.rodata.str1.1
.LC57:
	.string	"File %d was writen\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB68:
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
	movq	%rsi, %rbx
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	movq	%fs:40, %rax
	movq	%rax, 120(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L123
	movq	8(%rsi), %rbx
	movl	$.LC43, %edi
	call	puts
	movq	%rbx, %rdi
	call	read_parameters
	movss	GV+12(%rip), %xmm0
	movsd	.LC44(%rip), %xmm1
	cvtps2pd	%xmm0, %xmm0
	call	pow
	movsd	.LC45(%rip), %xmm1
	xorl	%eax, %eax
	movsd	%xmm0, 8(%rsp)
	divsd	%xmm0, %xmm1
	unpcklpd	%xmm1, %xmm1
	cvtpd2ps	%xmm1, %xmm5
	movss	%xmm5, GV+16(%rip)
	call	readGADGETBinaryFile
	movsd	Header+136(%rip), %xmm6
	movsd	Header+144(%rip), %xmm7
	movl	$.LC46, %edi
	movsd	Header+80(%rip), %xmm5
	movl	%eax, GV+4(%rip)
	cvtpd2ps	%xmm6, %xmm6
	cvtpd2ps	%xmm7, %xmm7
	cvtpd2ps	%xmm5, %xmm5
	movss	%xmm6, GV+1024(%rip)
	movsd	Header+152(%rip), %xmm6
	movss	%xmm7, GV+1028(%rip)
	movsd	Header+128(%rip), %xmm7
	cvtpd2ps	%xmm6, %xmm6
	movss	%xmm5, GV+1032(%rip)
	movsd	Header+32(%rip), %xmm5
	cvtpd2ps	%xmm7, %xmm7
	cvtpd2ps	%xmm5, %xmm5
	movss	%xmm6, GV+1040(%rip)
	movss	%xmm7, GV(%rip)
	movss	%xmm5, GV+8(%rip)
	call	puts
	movl	$.LC47, %edi
	call	puts
	movss	GV+1024(%rip), %xmm0
	movss	GV+1040(%rip), %xmm3
	movl	$.LC48, %esi
	movss	GV+1032(%rip), %xmm2
	movss	GV+1028(%rip), %xmm1
	movl	$1, %edi
	cvtps2pd	%xmm0, %xmm0
	movl	$4, %eax
	cvtps2pd	%xmm3, %xmm3
	cvtps2pd	%xmm2, %xmm2
	cvtps2pd	%xmm1, %xmm1
	call	__printf_chk
	movl	$.LC46, %edi
	call	puts
	movl	$GV+24, %edx
	movl	$.LC49, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movl	$.LC46, %edi
	call	puts
	movl	$.LC50, %edi
	call	puts
	movsd	8(%rsp), %xmm4
	cvttsd2si	%xmm4, %eax
	testl	%eax, %eax
	movl	%eax, 36(%rsp)
	jle	.L95
	movl	$1, %r14d
	movq	$0, 48(%rsp)
	movl	$1441151881, %r15d
.L96:
	movq	48(%rsp), %rax
	movl	%r14d, 60(%rsp)
	xorl	%r13d, %r13d
	movl	%eax, 24(%rsp)
	salq	$5, %rax
	movq	%rax, 40(%rsp)
.L114:
	leal	1(%r13), %eax
	movl	$1, %ebp
	movl	%eax, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L113:
	leal	-1(%rbp), %eax
	movl	24(%rsp), %ebx
	leaq	64(%rsp), %rdi
	movl	$1, %edx
	movl	$.LC51, %r8d
	movl	$50, %esi
	movl	%eax, %ecx
	movl	%eax, 28(%rsp)
	movl	GV+20(%rip), %eax
	imull	%eax, %ebx
	addl	%r13d, %ebx
	imull	%eax, %ebx
	xorl	%eax, %eax
	addl	%ecx, %ebx
	movl	$50, %ecx
	movl	%ebx, %r9d
	call	__snprintf_chk
	movss	GV+12(%rip), %xmm0
	movl	%ebx, %eax
	cvttss2si	%xmm0, %ecx
	cltd
	idivl	%ecx
	testl	%edx, %edx
	je	.L124
	cmpq	$0, copyPart(%rip)
	je	.L125
.L98:
	movl	GV+4(%rip), %eax
	movl	%ebp, 20(%rsp)
	testl	%eax, %eax
	jle	.L100
	xorl	%r12d, %r12d
	cvtsi2ss	24(%rsp), %xmm3
	jmp	.L109
	.p2align 4,,10
	.p2align 3
.L101:
	movq	%r12, %rdx
	movaps	%xmm3, %xmm2
	salq	$5, %rdx
	movss	GV+16(%rip), %xmm0
	movq	%rdx, %rax
	addq	part(%rip), %rax
	mulss	%xmm0, %xmm2
	movss	4(%rax), %xmm1
	ucomiss	%xmm2, %xmm1
	jb	.L102
	cvtsi2ss	%r14d, %xmm2
	mulss	%xmm0, %xmm2
	ucomiss	%xmm1, %xmm2
	jbe	.L102
	cvtsi2ss	%r13d, %xmm1
	movss	8(%rax), %xmm2
	mulss	%xmm0, %xmm1
	ucomiss	%xmm1, %xmm2
	jb	.L102
	cvtsi2ss	32(%rsp), %xmm1
	mulss	%xmm0, %xmm1
	ucomiss	%xmm2, %xmm1
	jbe	.L102
	cvtsi2ss	28(%rsp), %xmm1
	mulss	%xmm0, %xmm1
	movss	12(%rax), %xmm2
	ucomiss	%xmm1, %xmm2
	jb	.L102
	cvtsi2ss	%ebp, %xmm1
	mulss	%xmm0, %xmm1
	ucomiss	%xmm2, %xmm1
	ja	.L126
	.p2align 4,,10
	.p2align 3
.L102:
	leal	1(%r12), %eax
	addq	$1, %r12
	cmpl	%eax, GV+4(%rip)
	jle	.L100
.L109:
	movl	%r12d, %eax
	imull	%r15d
	movl	%r12d, %eax
	sarl	$31, %eax
	sarl	$24, %edx
	subl	%eax, %edx
	imull	$50000000, %edx, %edx
	cmpl	%edx, %r12d
	jne	.L101
	movl	%r12d, %edx
	movl	$.LC55, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	movss	%xmm3, 8(%rsp)
	call	__printf_chk
	movss	8(%rsp), %xmm3
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L100:
	movl	%ebx, %edx
	movl	$.LC52, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	leaq	64(%rsp), %rdi
	call	writeGADGETBinaryFile
	movq	copyPart(%rip), %rdi
	call	free
	movss	GV+12(%rip), %xmm0
	movl	%ebx, %eax
	cvttss2si	%xmm0, %ecx
	cltd
	idivl	%ecx
	testl	%edx, %edx
	je	.L127
.L110:
	addl	$1, %ebp
	movl	20(%rsp), %eax
	cmpl	%eax, 36(%rsp)
	jg	.L113
	movl	36(%rsp), %eax
	movl	32(%rsp), %r13d
	cmpl	%eax, %r13d
	jne	.L114
	addq	$1, 48(%rsp)
	addl	$1, %r14d
	movl	60(%rsp), %eax
	cmpl	%eax, 36(%rsp)
	jg	.L96
.L95:
	movq	part(%rip), %rdi
	call	free
	xorl	%eax, %eax
	movq	120(%rsp), %rsi
	xorq	%fs:40, %rsi
	jne	.L128
	addq	$136, %rsp
	.cfi_remember_state
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
	.p2align 4,,10
	.p2align 3
.L124:
	.cfi_restore_state
	xorl	%eax, %eax
	movl	%ebx, %edx
	movl	$.LC52, %esi
	movl	$1, %edi
	call	__printf_chk
	cmpq	$0, copyPart(%rip)
	jne	.L98
.L125:
	movl	$.LC53, %edi
	call	puts
	xorl	%edi, %edi
	movl	$32, %esi
	call	calloc
	movl	$.LC54, %edi
	movq	%rax, copyPart(%rip)
	call	puts
	jmp	.L98
	.p2align 4,,10
	.p2align 3
.L127:
	movl	%ebx, %edx
	movl	$.LC57, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	jmp	.L110
.L126:
	movl	$.LC56, %edi
	movss	%xmm3, 56(%rsp)
	movq	%rdx, 8(%rsp)
	call	puts
	movq	copyPart(%rip), %rdi
	movl	$9, %esi
	call	realloc
	movq	part(%rip), %rsi
	movq	8(%rsp), %rdx
	movq	%rax, copyPart(%rip)
	movq	40(%rsp), %rdi
	movss	56(%rsp), %xmm3
	leaq	(%rax,%rdx), %rcx
	addq	%rsi, %rdx
	movss	4(%rdx), %xmm0
	addq	%rdi, %rax
	movss	%xmm0, 4(%rcx)
	movss	8(%rdx), %xmm0
	movss	%xmm0, 8(%rcx)
	movss	12(%rdx), %xmm0
	movss	%xmm0, 12(%rcx)
	movss	16(%rdx), %xmm0
	movss	%xmm0, 16(%rcx)
	movss	20(%rdx), %xmm0
	movss	%xmm0, 20(%rcx)
	movss	24(%rdx), %xmm0
	movss	%xmm0, 24(%rcx)
	movl	(%rsi,%rdi), %ecx
	movss	28(%rdx), %xmm0
	movss	%xmm0, 28(%rax)
	movl	%ecx, (%rax)
	jmp	.L102
.L123:
	movl	$.LC41, %edi
	call	puts
	movq	(%rbx), %rdx
	movl	$1, %edi
	movl	$.LC42, %esi
	xorl	%eax, %eax
	call	__printf_chk
	xorl	%edi, %edi
	call	exit
.L128:
	call	__stack_chk_fail
	.cfi_endproc
.LFE68:
	.size	main, .-main
	.comm	Header,256,32
	.globl	copyPart
	.bss
	.align 16
	.type	copyPart, @object
	.size	copyPart, 8
copyPart:
	.zero	8
	.globl	part
	.align 16
	.type	part, @object
	.size	part, 8
part:
	.zero	8
	.comm	GV,1044,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC44:
	.long	1431655765
	.long	1070945621
	.align 8
.LC45:
	.long	0
	.long	1072693248
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
