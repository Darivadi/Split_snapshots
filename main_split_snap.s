	.file	"main_split_snap.c"
	.text
.Ltext0:
	.comm	GV,1040,32
	.globl	part
	.bss
	.align 8
	.type	part, @object
	.size	part, 8
part:
	.zero	8
	.globl	copyPart
	.align 8
	.type	copyPart, @object
	.size	copyPart, 8
copyPart:
	.zero	8
	.comm	Header,256,32
	.section	.rodata
.LC0:
	.string	"Inside conf2dump routine"
	.align 8
.LC1:
	.string	"grep -v \"#\" %s | grep -v \"^$\" | gawk -F\"=\" '{print $2}' > %s.dump"
.LC2:
	.string	"Leaving conf2dump routine"
	.text
	.globl	conf2dump
	.type	conf2dump, @function
conf2dump:
.LFB2:
	.file 1 "readWrite.h"
	.loc 1 4 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$1032, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -1032(%rbp)
	.loc 1 4 0
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 8 0
	movl	$.LC0, %edi
	call	puts
	.loc 1 10 0
	movq	-1032(%rbp), %rcx
	movq	-1032(%rbp), %rdx
	leaq	-1024(%rbp), %rax
	movl	$.LC1, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	.loc 1 19 0
	leaq	-1024(%rbp), %rax
	movq	%rax, %rdi
	call	system
	.loc 1 21 0
	movl	$.LC2, %edi
	call	puts
	.loc 1 22 0
	movl	$0, %eax
	.loc 1 23 0
	movq	-24(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L3
	call	__stack_chk_fail
.L3:
	addq	$1032, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	conf2dump, .-conf2dump
	.section	.rodata
.LC3:
	.string	"Filename: %s\n"
.LC4:
	.string	"r"
	.align 8
.LC5:
	.string	"  * The file '%s' doesn't exist!\n"
.LC6:
	.string	"Converting to plain text"
.LC7:
	.string	"%s.dump"
.LC8:
	.string	"%d"
.LC9:
	.string	"%s"
.LC10:
	.string	"Number of files to write: %d"
	.align 8
.LC11:
	.string	"  * The file '%s' has been loaded!\n"
.LC12:
	.string	"rm -rf %s.dump"
	.text
	.globl	read_parameters
	.type	read_parameters, @function
read_parameters:
.LFB3:
	.loc 1 32 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$2048, %rsp
	movq	%rdi, -2040(%rbp)
	.loc 1 32 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 37 0
	movq	-2040(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	.loc 1 38 0
	movq	-2040(%rbp), %rax
	movl	$.LC4, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -2024(%rbp)
	.loc 1 39 0
	cmpq	$0, -2024(%rbp)
	jne	.L5
	.loc 1 41 0
	movq	-2040(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	.loc 1 42 0
	movl	$1, %eax
	jmp	.L7
.L5:
	.loc 1 44 0
	movq	-2024(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	.loc 1 47 0
	movl	$.LC6, %edi
	call	puts
	.loc 1 48 0
	movq	-2040(%rbp), %rax
	movq	%rax, %rdi
	call	conf2dump
	.loc 1 49 0
	movq	-2040(%rbp), %rdx
	leaq	-1008(%rbp), %rax
	movl	$.LC7, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	.loc 1 50 0
	leaq	-1008(%rbp), %rax
	movl	$.LC4, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -2024(%rbp)
	.loc 1 53 0
	movq	-2024(%rbp), %rax
	movl	$GV+12, %edx
	movl	$.LC8, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf
	.loc 1 54 0
	movq	-2024(%rbp), %rax
	movl	$GV+20, %edx
	movl	$.LC9, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf
	.loc 1 55 0
	movl	GV+12(%rip), %eax
	movl	%eax, %esi
	movl	$.LC10, %edi
	movl	$0, %eax
	call	printf
	.loc 1 57 0
	movq	-2024(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	.loc 1 59 0
	movq	-2040(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC11, %edi
	movl	$0, %eax
	call	printf
	.loc 1 61 0
	movq	-2040(%rbp), %rdx
	leaq	-2016(%rbp), %rax
	movl	$.LC12, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	.loc 1 62 0
	leaq	-2016(%rbp), %rax
	movq	%rax, %rdi
	call	system
	.loc 1 64 0
	movl	$0, %eax
.L7:
	.loc 1 65 0
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L8
	call	__stack_chk_fail
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	read_parameters, .-read_parameters
	.section	.rodata
	.align 8
.LC13:
	.string	"############################################################"
.LC14:
	.string	"Reading snapshot %s\n"
.LC15:
	.string	"File %s cannot be open\n"
	.align 8
.LC16:
	.string	"----------------------------------------"
.LC17:
	.string	"Reading snapshot with:"
	.align 8
.LC18:
	.string	"Type %d has Npart=%12d NpartTotal=%12d with mass %16.8lf\n"
	.align 8
.LC19:
	.string	" There is a total %d particles in the snapshot\n\n"
.LC20:
	.string	" * Frame's Time... %16.8f\n"
.LC21:
	.string	" * Redshift... %16.8f\n"
.LC22:
	.string	" * Flagsfr... %d\n"
.LC23:
	.string	" * Flagfed... %d\n"
.LC24:
	.string	" * Flagcool... %d\n"
.LC25:
	.string	" * numfiles... %d\n"
.LC26:
	.string	" * Boxsize... %16.8f\n"
.LC27:
	.string	" * Omega0... %16.8f\n"
.LC28:
	.string	" * OmageLa... %16.8f\n"
.LC29:
	.string	" * Hubbleparam... %16.8f\n"
	.align 8
.LC30:
	.string	"Structure particles could not be allocated"
	.align 8
.LC31:
	.string	" Can not read properly ids %d %lu\n"
	.text
	.globl	readGADGETBinaryFile
	.type	readGADGETBinaryFile, @function
readGADGETBinaryFile:
.LFB4:
	.loc 1 75 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	.loc 1 76 0
	movq	$0, -24(%rbp)
	.loc 1 78 0
	movl	$0, -28(%rbp)
	.loc 1 82 0
	movl	$.LC13, %edi
	call	puts
	.loc 1 83 0
	movl	$GV+20, %esi
	movl	$.LC14, %edi
	movl	$0, %eax
	call	printf
	.loc 1 84 0
	movl	$.LC4, %esi
	movl	$GV+20, %edi
	call	fopen
	movq	%rax, -24(%rbp)
	.loc 1 85 0
	cmpq	$0, -24(%rbp)
	jne	.L10
	.loc 1 87 0
	movl	$GV+20, %esi
	movl	$.LC15, %edi
	movl	$0, %eax
	call	printf
.L10:
	.loc 1 90 0
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 91 0
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$256, %esi
	movl	$Header, %edi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 92 0
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 94 0
	movl	$0, -40(%rbp)
	.loc 1 97 0
	movl	$.LC16, %edi
	call	puts
	.loc 1 98 0
	movl	$.LC17, %edi
	call	puts
	.loc 1 99 0
	movl	$.LC16, %edi
	call	puts
	.loc 1 100 0
	movl	$0, -48(%rbp)
	jmp	.L11
.L12:
	.loc 1 102 0 discriminator 2
	movl	-48(%rbp), %eax
	cltq
	addq	$24, %rax
	movl	Header(,%rax,4), %eax
	addl	%eax, -40(%rbp)
	.loc 1 103 0 discriminator 2
	movl	-48(%rbp), %eax
	cltq
	addq	$2, %rax
	movq	Header+8(,%rax,8), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	addq	$24, %rdx
	movl	Header(,%rdx,4), %ecx
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	movl	Header(,%rdx,4), %edx
	movl	-48(%rbp), %esi
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	movl	$.LC18, %edi
	movl	$1, %eax
	call	printf
	.loc 1 100 0 discriminator 2
	addl	$1, -48(%rbp)
.L11:
	.loc 1 100 0 is_stmt 0 discriminator 1
	cmpl	$5, -48(%rbp)
	jle	.L12
	.loc 1 108 0 is_stmt 1
	movl	-40(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC19, %edi
	movl	$0, %eax
	call	printf
	.loc 1 109 0
	movl	$.LC16, %edi
	call	puts
	.loc 1 110 0
	movq	Header+72(%rip), %rax
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	movl	$.LC20, %edi
	movl	$1, %eax
	call	printf
	.loc 1 111 0
	movq	Header+80(%rip), %rax
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	movl	$.LC21, %edi
	movl	$1, %eax
	call	printf
	.loc 1 112 0
	movl	Header+88(%rip), %eax
	movl	%eax, %esi
	movl	$.LC22, %edi
	movl	$0, %eax
	call	printf
	.loc 1 113 0
	movl	Header+92(%rip), %eax
	movl	%eax, %esi
	movl	$.LC23, %edi
	movl	$0, %eax
	call	printf
	.loc 1 114 0
	movl	Header+120(%rip), %eax
	movl	%eax, %esi
	movl	$.LC24, %edi
	movl	$0, %eax
	call	printf
	.loc 1 115 0
	movl	Header+124(%rip), %eax
	movl	%eax, %esi
	movl	$.LC25, %edi
	movl	$0, %eax
	call	printf
	.loc 1 116 0
	movq	Header+128(%rip), %rax
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	movl	$.LC26, %edi
	movl	$1, %eax
	call	printf
	.loc 1 117 0
	movq	Header+136(%rip), %rax
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	movl	$.LC27, %edi
	movl	$1, %eax
	call	printf
	.loc 1 118 0
	movq	Header+144(%rip), %rax
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	movl	$.LC28, %edi
	movl	$1, %eax
	call	printf
	.loc 1 119 0
	movq	Header+152(%rip), %rax
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	movl	$.LC29, %edi
	movl	$1, %eax
	call	printf
	.loc 1 122 0
	movl	-40(%rbp), %eax
	cltq
	movl	$32, %esi
	movq	%rax, %rdi
	call	calloc
	movq	%rax, part(%rip)
	.loc 1 124 0
	movq	part(%rip), %rax
	testq	%rax, %rax
	jne	.L13
	.loc 1 126 0
	movl	$.LC30, %edi
	call	puts
	.loc 1 127 0
	movl	$0, %edi
	call	exit
.L13:
	.loc 1 133 0
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 134 0
	movl	$0, -48(%rbp)
	jmp	.L14
.L15:
	.loc 1 136 0 discriminator 2
	movq	-24(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$3, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 137 0 discriminator 2
	movq	part(%rip), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$5, %rdx
	addq	%rax, %rdx
	movl	-16(%rbp), %eax
	movl	%eax, 4(%rdx)
	.loc 1 138 0 discriminator 2
	movq	part(%rip), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$5, %rdx
	addq	%rax, %rdx
	movl	-12(%rbp), %eax
	movl	%eax, 8(%rdx)
	.loc 1 139 0 discriminator 2
	movq	part(%rip), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$5, %rdx
	addq	%rax, %rdx
	movl	-8(%rbp), %eax
	movl	%eax, 12(%rdx)
	.loc 1 134 0 discriminator 2
	addl	$1, -48(%rbp)
.L14:
	.loc 1 134 0 is_stmt 0 discriminator 1
	movl	-48(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jl	.L15
	.loc 1 141 0 is_stmt 1
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 143 0
	movl	-60(%rbp), %eax
	movslq	%eax, %rcx
	movl	-40(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	cmpq	%rax, %rcx
	je	.L16
	.loc 1 145 0
	movl	-40(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movl	-60(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC31, %edi
	movl	$0, %eax
	call	printf
	.loc 1 146 0
	movl	$0, %edi
	call	exit
.L16:
	.loc 1 152 0
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 153 0
	movl	$0, -48(%rbp)
	jmp	.L17
.L18:
	.loc 1 155 0 discriminator 2
	movq	-24(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$3, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 156 0 discriminator 2
	movq	part(%rip), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$5, %rdx
	addq	%rax, %rdx
	movl	-16(%rbp), %eax
	movl	%eax, 16(%rdx)
	.loc 1 157 0 discriminator 2
	movq	part(%rip), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$5, %rdx
	addq	%rax, %rdx
	movl	-12(%rbp), %eax
	movl	%eax, 20(%rdx)
	.loc 1 158 0 discriminator 2
	movq	part(%rip), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$5, %rdx
	addq	%rax, %rdx
	movl	-8(%rbp), %eax
	movl	%eax, 24(%rdx)
	.loc 1 153 0 discriminator 2
	addl	$1, -48(%rbp)
.L17:
	.loc 1 153 0 is_stmt 0 discriminator 1
	movl	-48(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jl	.L18
	.loc 1 162 0 is_stmt 1
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 163 0
	movl	-60(%rbp), %eax
	movslq	%eax, %rcx
	movl	-40(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	cmpq	%rax, %rcx
	je	.L19
	.loc 1 165 0
	movl	-40(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movl	-60(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC31, %edi
	movl	$0, %eax
	call	printf
	.loc 1 166 0
	movl	$0, %edi
	call	exit
.L19:
	.loc 1 173 0
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 174 0
	movl	$0, -48(%rbp)
	jmp	.L20
.L21:
	.loc 1 176 0 discriminator 2
	movq	-24(%rbp), %rdx
	leaq	-52(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 177 0 discriminator 2
	movq	part(%rip), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$5, %rdx
	addq	%rax, %rdx
	movl	-52(%rbp), %eax
	movl	%eax, (%rdx)
	.loc 1 174 0 discriminator 2
	addl	$1, -48(%rbp)
.L20:
	.loc 1 174 0 is_stmt 0 discriminator 1
	movl	-48(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jl	.L21
	.loc 1 180 0 is_stmt 1
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 181 0
	movl	-60(%rbp), %eax
	cltq
	movl	-40(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	cmpq	%rdx, %rax
	je	.L22
	.loc 1 183 0
	movl	-40(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movl	-60(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC31, %edi
	movl	$0, %eax
	call	printf
	.loc 1 184 0
	movl	$0, %edi
	call	exit
.L22:
	.loc 1 190 0
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 191 0
	movl	$0, -32(%rbp)
	movl	-32(%rbp), %eax
	movl	%eax, -36(%rbp)
	.loc 1 192 0
	movl	$0, -44(%rbp)
	jmp	.L23
.L32:
	.loc 1 194 0
	movl	-44(%rbp), %eax
	cltq
	addq	$24, %rax
	movl	Header(,%rax,4), %eax
	addl	%eax, -32(%rbp)
	.loc 1 195 0
	movl	-44(%rbp), %eax
	cltq
	addq	$2, %rax
	movsd	Header+8(,%rax,8), %xmm0
	xorpd	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	jp	.L24
	xorpd	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	jne	.L24
	.loc 1 195 0 is_stmt 0 discriminator 1
	movl	-44(%rbp), %eax
	cltq
	addq	$24, %rax
	movl	Header(,%rax,4), %eax
	testl	%eax, %eax
	je	.L24
	.loc 1 196 0 is_stmt 1
	movl	-36(%rbp), %eax
	movl	%eax, -48(%rbp)
	jmp	.L26
.L27:
	.loc 1 197 0 discriminator 2
	movq	-24(%rbp), %rdx
	leaq	-56(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 198 0 discriminator 2
	movq	part(%rip), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$5, %rdx
	addq	%rax, %rdx
	movl	-56(%rbp), %eax
	movl	%eax, 28(%rdx)
	.loc 1 196 0 discriminator 2
	addl	$1, -48(%rbp)
.L26:
	.loc 1 196 0 is_stmt 0 discriminator 1
	movl	-48(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L27
.L24:
	.loc 1 201 0 is_stmt 1
	movl	-44(%rbp), %eax
	cltq
	addq	$2, %rax
	movsd	Header+8(,%rax,8), %xmm0
	xorpd	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	jp	.L35
	xorpd	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	je	.L28
.L35:
	.loc 1 201 0 is_stmt 0 discriminator 1
	movl	-44(%rbp), %eax
	cltq
	addq	$24, %rax
	movl	Header(,%rax,4), %eax
	testl	%eax, %eax
	je	.L28
	.loc 1 202 0 is_stmt 1
	movl	-36(%rbp), %eax
	movl	%eax, -48(%rbp)
	jmp	.L30
.L31:
	.loc 1 203 0 discriminator 2
	movq	part(%rip), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movl	-44(%rbp), %edx
	movslq	%edx, %rdx
	addq	$2, %rdx
	movsd	Header+8(,%rdx,8), %xmm0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, 28(%rax)
	.loc 1 202 0 discriminator 2
	addl	$1, -48(%rbp)
.L30:
	.loc 1 202 0 is_stmt 0 discriminator 1
	movl	-48(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L31
.L28:
	.loc 1 206 0 is_stmt 1
	movl	-32(%rbp), %eax
	movl	%eax, -36(%rbp)
	.loc 1 192 0
	addl	$1, -44(%rbp)
.L23:
	.loc 1 192 0 is_stmt 0 discriminator 1
	cmpl	$5, -44(%rbp)
	jle	.L32
	.loc 1 208 0 is_stmt 1
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 209 0
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	.loc 1 210 0
	movl	-40(%rbp), %eax
	.loc 1 211 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	readGADGETBinaryFile, .-readGADGETBinaryFile
	.section	.rodata
.LC33:
	.string	"Writing in file %s\n"
.LC34:
	.string	"w"
	.align 8
.LC35:
	.string	"File %s is ready to be writen\n"
.LC36:
	.string	"N_tot = %d, GV.NpTot = %d\n"
.LC37:
	.string	"iID=%d, eID=%d\n"
.LC38:
	.string	"Header writen"
.LC39:
	.string	"dummy = %d\n"
.LC40:
	.string	"dummy writen"
.LC41:
	.string	"Positions writen"
.LC42:
	.string	"Velocities writen"
	.text
	.globl	writeGADGETBinaryFile
	.type	writeGADGETBinaryFile, @function
writeGADGETBinaryFile:
.LFB5:
	.loc 1 226 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movl	%esi, -60(%rbp)
	movl	%edx, -64(%rbp)
	movl	%ecx, -68(%rbp)
	.loc 1 227 0
	movq	$0, -24(%rbp)
	.loc 1 229 0
	movl	$0, -28(%rbp)
	.loc 1 233 0
	movl	$.LC13, %edi
	call	puts
	.loc 1 234 0
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC33, %edi
	movl	$0, %eax
	call	printf
	.loc 1 235 0
	movq	-56(%rbp), %rax
	movl	$.LC34, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -24(%rbp)
	.loc 1 238 0
	cmpq	$0, -24(%rbp)
	jne	.L37
	.loc 1 240 0
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC15, %edi
	movl	$0, %eax
	call	printf
.L37:
	.loc 1 242 0
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC35, %edi
	movl	$0, %eax
	call	printf
	.loc 1 245 0
	movl	GV+4(%rip), %edx
	movl	-60(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC36, %edi
	movl	$0, %eax
	call	printf
	.loc 1 246 0
	movl	-68(%rbp), %edx
	movl	-64(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC37, %edi
	movl	$0, %eax
	call	printf
	.loc 1 249 0
	movl	-60(%rbp), %eax
	movl	%eax, Header+4(%rip)
	.loc 1 250 0
	movl	-60(%rbp), %eax
	movl	%eax, Header+100(%rip)
	.loc 1 252 0
	movq	-24(%rbp), %rdx
	leaq	-36(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fwrite
	.loc 1 253 0
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$256, %esi
	movl	$Header, %edi
	call	fwrite
	.loc 1 254 0
	movq	-24(%rbp), %rdx
	leaq	-36(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fwrite
	.loc 1 256 0
	movl	$.LC38, %edi
	call	puts
	.loc 1 261 0
	movl	-60(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, -36(%rbp)
	.loc 1 263 0
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC39, %edi
	movl	$0, %eax
	call	printf
	.loc 1 265 0
	movq	-24(%rbp), %rdx
	leaq	-36(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fwrite
	.loc 1 266 0
	movl	$.LC40, %edi
	call	puts
	.loc 1 269 0
	movl	-64(%rbp), %eax
	movl	%eax, -32(%rbp)
	jmp	.L38
.L39:
	.loc 1 271 0 discriminator 2
	movq	copyPart(%rip), %rax
	movl	-32(%rbp), %edx
	movslq	%edx, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movl	4(%rax), %eax
	movl	%eax, -16(%rbp)
	.loc 1 272 0 discriminator 2
	movq	copyPart(%rip), %rax
	movl	-32(%rbp), %edx
	movslq	%edx, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movl	8(%rax), %eax
	movl	%eax, -12(%rbp)
	.loc 1 273 0 discriminator 2
	movq	copyPart(%rip), %rax
	movl	-32(%rbp), %edx
	movslq	%edx, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movl	12(%rax), %eax
	movl	%eax, -8(%rbp)
	.loc 1 274 0 discriminator 2
	movq	-24(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$3, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fwrite
	.loc 1 269 0 discriminator 2
	addl	$1, -32(%rbp)
.L38:
	.loc 1 269 0 is_stmt 0 discriminator 1
	movl	-68(%rbp), %eax
	addl	$1, %eax
	cmpl	-32(%rbp), %eax
	jg	.L39
	.loc 1 276 0 is_stmt 1
	movq	-24(%rbp), %rdx
	leaq	-36(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fwrite
	movl	%eax, -28(%rbp)
	.loc 1 278 0
	movl	$.LC41, %edi
	call	puts
	.loc 1 282 0
	movq	-24(%rbp), %rdx
	leaq	-36(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fwrite
	.loc 1 284 0
	movl	-64(%rbp), %eax
	movl	%eax, -32(%rbp)
	jmp	.L40
.L41:
	.loc 1 286 0 discriminator 2
	movq	copyPart(%rip), %rax
	movl	-32(%rbp), %edx
	movslq	%edx, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movl	16(%rax), %eax
	movl	%eax, -16(%rbp)
	.loc 1 287 0 discriminator 2
	movq	copyPart(%rip), %rax
	movl	-32(%rbp), %edx
	movslq	%edx, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movl	20(%rax), %eax
	movl	%eax, -12(%rbp)
	.loc 1 288 0 discriminator 2
	movq	copyPart(%rip), %rax
	movl	-32(%rbp), %edx
	movslq	%edx, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movl	24(%rax), %eax
	movl	%eax, -8(%rbp)
	.loc 1 289 0 discriminator 2
	movq	-24(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$3, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fwrite
	.loc 1 284 0 discriminator 2
	addl	$1, -32(%rbp)
.L40:
	.loc 1 284 0 is_stmt 0 discriminator 1
	movl	-68(%rbp), %eax
	addl	$1, %eax
	cmpl	-32(%rbp), %eax
	jg	.L41
	.loc 1 291 0 is_stmt 1
	movl	$.LC42, %edi
	call	puts
	.loc 1 373 0
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	.loc 1 375 0
	movl	$0, %eax
	.loc 1 377 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	writeGADGETBinaryFile, .-writeGADGETBinaryFile
	.section	.rodata
	.align 8
.LC43:
	.string	"Error: Incomplete number of parameters. Execute as follows:"
.LC44:
	.string	"%s Parameters_file\n"
.LC45:
	.string	"Reading parameters"
	.align 8
.LC46:
	.string	"-----------------------------------------------"
.LC47:
	.string	"Cosmological parameters:"
	.align 8
.LC48:
	.string	"OmegaM0=%lf OmegaL0=%lf redshift=%lf HubbleParam=%lf SnapLength=%lf\n"
.LC49:
	.string	"Filename=%s\n"
	.align 8
.LC50:
	.string	"Let's begin with the division of files"
.LC51:
	.string	"PartsCount=%d\n"
.LC52:
	.string	"./Data/Box_400_512_150.%d"
.LC53:
	.string	"Writing file %s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.file 2 "main_split_snap.c"
	.loc 2 15 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$232, %rsp
	.cfi_offset 3, -24
	movl	%edi, -228(%rbp)
	movq	%rsi, -240(%rbp)
	.loc 2 15 0
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 2 16 0
	movq	$0, -192(%rbp)
	.loc 2 31 0
	movq	$0, -184(%rbp)
	.loc 2 33 0
	movl	$0, %eax
	movq	%rax, -176(%rbp)
	movl	$0, %eax
	movq	%rax, -168(%rbp)
	.loc 2 34 0
	movl	$0, -208(%rbp)
	.loc 2 43 0
	cmpl	$1, -228(%rbp)
	jg	.L44
	.loc 2 45 0
	movl	$.LC43, %edi
	call	puts
	.loc 2 46 0
	movq	-240(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC44, %edi
	movl	$0, %eax
	call	printf
	.loc 2 47 0
	movl	$0, %edi
	call	exit
.L44:
	.loc 2 50 0
	movq	-240(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -192(%rbp)
	.loc 2 51 0
	movl	$.LC45, %edi
	call	puts
	.loc 2 52 0
	movq	-192(%rbp), %rax
	movq	%rax, %rdi
	call	read_parameters
	.loc 2 57 0
	movl	$0, %eax
	call	readGADGETBinaryFile
	movl	%eax, GV+4(%rip)
	.loc 2 60 0
	movsd	Header+136(%rip), %xmm0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, GV+1020(%rip)
	.loc 2 61 0
	movsd	Header+144(%rip), %xmm0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, GV+1024(%rip)
	.loc 2 62 0
	movsd	Header+80(%rip), %xmm0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, GV+1028(%rip)
	.loc 2 63 0
	movsd	Header+152(%rip), %xmm0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, GV+1036(%rip)
	.loc 2 66 0
	movsd	Header+128(%rip), %xmm0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, GV(%rip)
	.loc 2 67 0
	movsd	Header+32(%rip), %xmm0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, GV+8(%rip)
	.loc 2 72 0
	movl	$.LC46, %edi
	call	puts
	.loc 2 73 0
	movl	$.LC47, %edi
	call	puts
	.loc 2 79 0
	movss	GV+16(%rip), %xmm0
	.loc 2 74 0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm4
	.loc 2 78 0
	movss	GV+1036(%rip), %xmm0
	.loc 2 74 0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm3
	.loc 2 77 0
	movss	GV+1028(%rip), %xmm0
	.loc 2 74 0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm2
	.loc 2 76 0
	movss	GV+1024(%rip), %xmm0
	.loc 2 74 0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm1
	.loc 2 75 0
	movss	GV+1020(%rip), %xmm0
	.loc 2 74 0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movl	$.LC48, %edi
	movl	$5, %eax
	call	printf
	.loc 2 80 0
	movl	$.LC46, %edi
	call	puts
	.loc 2 82 0
	movl	$GV+20, %esi
	movl	$.LC49, %edi
	movl	$0, %eax
	call	printf
	.loc 2 83 0
	movl	$.LC46, %edi
	call	puts
	.loc 2 90 0
	movl	$.LC50, %edi
	call	puts
	.loc 2 92 0
	movl	GV+4(%rip), %eax
	movl	GV+12(%rip), %ebx
	cltd
	idivl	%ebx
	movl	%eax, -204(%rbp)
	.loc 2 94 0
	movl	-204(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC51, %edi
	movl	$0, %eax
	call	printf
	.loc 2 95 0
	movl	$0, -212(%rbp)
	jmp	.L45
.L46:
	.loc 2 97 0 discriminator 2
	movl	-212(%rbp), %edx
	leaq	-128(%rbp), %rax
	movl	%edx, %ecx
	movl	$.LC52, %edx
	movl	$50, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf
	.loc 2 98 0 discriminator 2
	leaq	-128(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC53, %edi
	movl	$0, %eax
	call	printf
	.loc 2 100 0 discriminator 2
	movl	-212(%rbp), %eax
	imull	-204(%rbp), %eax
	movl	%eax, -200(%rbp)
	.loc 2 101 0 discriminator 2
	movl	-212(%rbp), %eax
	addl	$1, %eax
	imull	-204(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -196(%rbp)
	.loc 2 103 0 discriminator 2
	movl	-196(%rbp), %edx
	movl	-200(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC37, %edi
	movl	$0, %eax
	call	printf
	.loc 2 105 0 discriminator 2
	movl	-196(%rbp), %ecx
	movl	-200(%rbp), %edx
	movl	-204(%rbp), %esi
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	writeGADGETBinaryFile
	.loc 2 95 0 discriminator 2
	addl	$1, -212(%rbp)
.L45:
	.loc 2 95 0 is_stmt 0 discriminator 1
	movl	GV+12(%rip), %eax
	cmpl	-212(%rbp), %eax
	jg	.L46
	.loc 2 208 0 is_stmt 1
	movq	part(%rip), %rax
	movq	%rax, %rdi
	call	free
	.loc 2 210 0
	movl	$0, %eax
	.loc 2 211 0
	movq	-24(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L48
	call	__stack_chk_fail
.L48:
	addq	$232, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
.Letext0:
	.file 3 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 5 "/usr/include/stdio.h"
	.file 6 "/usr/include/libio.h"
	.file 7 "structures.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x9a3
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF120
	.byte	0x1
	.long	.LASF121
	.long	.LASF122
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x3
	.byte	0xd4
	.long	0x38
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x4
	.byte	0x83
	.long	0x69
	.uleb128 0x2
	.long	.LASF9
	.byte	0x4
	.byte	0x84
	.long	0x69
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x95
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x2
	.long	.LASF12
	.byte	0x5
	.byte	0x30
	.long	0xa7
	.uleb128 0x7
	.long	.LASF42
	.byte	0xd8
	.byte	0x6
	.byte	0xf5
	.long	0x227
	.uleb128 0x8
	.long	.LASF13
	.byte	0x6
	.byte	0xf6
	.long	0x62
	.byte	0
	.uleb128 0x8
	.long	.LASF14
	.byte	0x6
	.byte	0xfb
	.long	0x8f
	.byte	0x8
	.uleb128 0x8
	.long	.LASF15
	.byte	0x6
	.byte	0xfc
	.long	0x8f
	.byte	0x10
	.uleb128 0x8
	.long	.LASF16
	.byte	0x6
	.byte	0xfd
	.long	0x8f
	.byte	0x18
	.uleb128 0x8
	.long	.LASF17
	.byte	0x6
	.byte	0xfe
	.long	0x8f
	.byte	0x20
	.uleb128 0x8
	.long	.LASF18
	.byte	0x6
	.byte	0xff
	.long	0x8f
	.byte	0x28
	.uleb128 0x9
	.long	.LASF19
	.byte	0x6
	.value	0x100
	.long	0x8f
	.byte	0x30
	.uleb128 0x9
	.long	.LASF20
	.byte	0x6
	.value	0x101
	.long	0x8f
	.byte	0x38
	.uleb128 0x9
	.long	.LASF21
	.byte	0x6
	.value	0x102
	.long	0x8f
	.byte	0x40
	.uleb128 0x9
	.long	.LASF22
	.byte	0x6
	.value	0x104
	.long	0x8f
	.byte	0x48
	.uleb128 0x9
	.long	.LASF23
	.byte	0x6
	.value	0x105
	.long	0x8f
	.byte	0x50
	.uleb128 0x9
	.long	.LASF24
	.byte	0x6
	.value	0x106
	.long	0x8f
	.byte	0x58
	.uleb128 0x9
	.long	.LASF25
	.byte	0x6
	.value	0x108
	.long	0x25f
	.byte	0x60
	.uleb128 0x9
	.long	.LASF26
	.byte	0x6
	.value	0x10a
	.long	0x265
	.byte	0x68
	.uleb128 0x9
	.long	.LASF27
	.byte	0x6
	.value	0x10c
	.long	0x62
	.byte	0x70
	.uleb128 0x9
	.long	.LASF28
	.byte	0x6
	.value	0x110
	.long	0x62
	.byte	0x74
	.uleb128 0x9
	.long	.LASF29
	.byte	0x6
	.value	0x112
	.long	0x70
	.byte	0x78
	.uleb128 0x9
	.long	.LASF30
	.byte	0x6
	.value	0x116
	.long	0x46
	.byte	0x80
	.uleb128 0x9
	.long	.LASF31
	.byte	0x6
	.value	0x117
	.long	0x54
	.byte	0x82
	.uleb128 0x9
	.long	.LASF32
	.byte	0x6
	.value	0x118
	.long	0x26b
	.byte	0x83
	.uleb128 0x9
	.long	.LASF33
	.byte	0x6
	.value	0x11c
	.long	0x27b
	.byte	0x88
	.uleb128 0x9
	.long	.LASF34
	.byte	0x6
	.value	0x125
	.long	0x7b
	.byte	0x90
	.uleb128 0x9
	.long	.LASF35
	.byte	0x6
	.value	0x12e
	.long	0x8d
	.byte	0x98
	.uleb128 0x9
	.long	.LASF36
	.byte	0x6
	.value	0x12f
	.long	0x8d
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF37
	.byte	0x6
	.value	0x130
	.long	0x8d
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF38
	.byte	0x6
	.value	0x131
	.long	0x8d
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF39
	.byte	0x6
	.value	0x132
	.long	0x2d
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF40
	.byte	0x6
	.value	0x134
	.long	0x62
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF41
	.byte	0x6
	.value	0x136
	.long	0x281
	.byte	0xc4
	.byte	0
	.uleb128 0xa
	.long	.LASF123
	.byte	0x6
	.byte	0x9a
	.uleb128 0x7
	.long	.LASF43
	.byte	0x18
	.byte	0x6
	.byte	0xa0
	.long	0x25f
	.uleb128 0x8
	.long	.LASF44
	.byte	0x6
	.byte	0xa1
	.long	0x25f
	.byte	0
	.uleb128 0x8
	.long	.LASF45
	.byte	0x6
	.byte	0xa2
	.long	0x265
	.byte	0x8
	.uleb128 0x8
	.long	.LASF46
	.byte	0x6
	.byte	0xa6
	.long	0x62
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x22e
	.uleb128 0x6
	.byte	0x8
	.long	0xa7
	.uleb128 0xb
	.long	0x95
	.long	0x27b
	.uleb128 0xc
	.long	0x86
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x227
	.uleb128 0xb
	.long	0x95
	.long	0x291
	.uleb128 0xc
	.long	0x86
	.byte	0x13
	.byte	0
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF47
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF48
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF49
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF50
	.uleb128 0xd
	.long	.LASF51
	.value	0x410
	.byte	0x7
	.byte	0x7
	.long	0x342
	.uleb128 0xe
	.string	"L"
	.byte	0x7
	.byte	0x9
	.long	0x29f
	.byte	0
	.uleb128 0x8
	.long	.LASF52
	.byte	0x7
	.byte	0xa
	.long	0x62
	.byte	0x4
	.uleb128 0x8
	.long	.LASF53
	.byte	0x7
	.byte	0xb
	.long	0x29f
	.byte	0x8
	.uleb128 0x8
	.long	.LASF54
	.byte	0x7
	.byte	0xc
	.long	0x62
	.byte	0xc
	.uleb128 0x8
	.long	.LASF55
	.byte	0x7
	.byte	0xd
	.long	0x29f
	.byte	0x10
	.uleb128 0x8
	.long	.LASF56
	.byte	0x7
	.byte	0xe
	.long	0x342
	.byte	0x14
	.uleb128 0xf
	.long	.LASF57
	.byte	0x7
	.byte	0x11
	.long	0x29f
	.value	0x3fc
	.uleb128 0xf
	.long	.LASF58
	.byte	0x7
	.byte	0x12
	.long	0x29f
	.value	0x400
	.uleb128 0x10
	.string	"zRS"
	.byte	0x7
	.byte	0x13
	.long	0x29f
	.value	0x404
	.uleb128 0x10
	.string	"aSF"
	.byte	0x7
	.byte	0x14
	.long	0x29f
	.value	0x408
	.uleb128 0xf
	.long	.LASF59
	.byte	0x7
	.byte	0x15
	.long	0x29f
	.value	0x40c
	.byte	0
	.uleb128 0xb
	.long	0x95
	.long	0x353
	.uleb128 0x11
	.long	0x86
	.value	0x3e7
	.byte	0
	.uleb128 0x7
	.long	.LASF60
	.byte	0x20
	.byte	0x7
	.byte	0x1a
	.long	0x38f
	.uleb128 0xe
	.string	"id"
	.byte	0x7
	.byte	0x1c
	.long	0x4d
	.byte	0
	.uleb128 0xe
	.string	"pos"
	.byte	0x7
	.byte	0x1e
	.long	0x38f
	.byte	0x4
	.uleb128 0xe
	.string	"vel"
	.byte	0x7
	.byte	0x20
	.long	0x38f
	.byte	0x10
	.uleb128 0x8
	.long	.LASF53
	.byte	0x7
	.byte	0x22
	.long	0x29f
	.byte	0x1c
	.byte	0
	.uleb128 0xb
	.long	0x29f
	.long	0x39f
	.uleb128 0xc
	.long	0x86
	.byte	0x2
	.byte	0
	.uleb128 0xd
	.long	.LASF61
	.value	0x100
	.byte	0x7
	.byte	0x27
	.long	0x455
	.uleb128 0x8
	.long	.LASF62
	.byte	0x7
	.byte	0x29
	.long	0x455
	.byte	0
	.uleb128 0x8
	.long	.LASF53
	.byte	0x7
	.byte	0x2a
	.long	0x465
	.byte	0x18
	.uleb128 0x8
	.long	.LASF63
	.byte	0x7
	.byte	0x2b
	.long	0x2a6
	.byte	0x48
	.uleb128 0x8
	.long	.LASF64
	.byte	0x7
	.byte	0x2c
	.long	0x2a6
	.byte	0x50
	.uleb128 0x8
	.long	.LASF65
	.byte	0x7
	.byte	0x2d
	.long	0x62
	.byte	0x58
	.uleb128 0x8
	.long	.LASF66
	.byte	0x7
	.byte	0x2e
	.long	0x62
	.byte	0x5c
	.uleb128 0x8
	.long	.LASF67
	.byte	0x7
	.byte	0x2f
	.long	0x455
	.byte	0x60
	.uleb128 0x8
	.long	.LASF68
	.byte	0x7
	.byte	0x30
	.long	0x62
	.byte	0x78
	.uleb128 0x8
	.long	.LASF69
	.byte	0x7
	.byte	0x31
	.long	0x62
	.byte	0x7c
	.uleb128 0x8
	.long	.LASF70
	.byte	0x7
	.byte	0x32
	.long	0x2a6
	.byte	0x80
	.uleb128 0x8
	.long	.LASF71
	.byte	0x7
	.byte	0x33
	.long	0x2a6
	.byte	0x88
	.uleb128 0x8
	.long	.LASF72
	.byte	0x7
	.byte	0x34
	.long	0x2a6
	.byte	0x90
	.uleb128 0x8
	.long	.LASF59
	.byte	0x7
	.byte	0x35
	.long	0x2a6
	.byte	0x98
	.uleb128 0x8
	.long	.LASF73
	.byte	0x7
	.byte	0x36
	.long	0x475
	.byte	0xa0
	.byte	0
	.uleb128 0xb
	.long	0x62
	.long	0x465
	.uleb128 0xc
	.long	0x86
	.byte	0x5
	.byte	0
	.uleb128 0xb
	.long	0x2a6
	.long	0x475
	.uleb128 0xc
	.long	0x86
	.byte	0x5
	.byte	0
	.uleb128 0xb
	.long	0x95
	.long	0x485
	.uleb128 0xc
	.long	0x86
	.byte	0x5f
	.byte	0
	.uleb128 0x12
	.long	.LASF74
	.byte	0x1
	.byte	0x3
	.long	0x62
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x4d0
	.uleb128 0x13
	.long	.LASF76
	.byte	0x1
	.byte	0x3
	.long	0x8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1048
	.uleb128 0x14
	.long	.LASF84
	.byte	0x1
	.byte	0x5
	.long	0x62
	.uleb128 0x15
	.string	"cmd"
	.byte	0x1
	.byte	0x6
	.long	0x342
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1040
	.byte	0
	.uleb128 0x12
	.long	.LASF75
	.byte	0x1
	.byte	0x1f
	.long	0x62
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x52e
	.uleb128 0x13
	.long	.LASF76
	.byte	0x1
	.byte	0x1f
	.long	0x8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2056
	.uleb128 0x15
	.string	"cmd"
	.byte	0x1
	.byte	0x21
	.long	0x342
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2032
	.uleb128 0x16
	.long	.LASF77
	.byte	0x1
	.byte	0x21
	.long	0x342
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1024
	.uleb128 0x16
	.long	.LASF78
	.byte	0x1
	.byte	0x22
	.long	0x52e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2040
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x9c
	.uleb128 0x17
	.long	.LASF124
	.byte	0x1
	.byte	0x4b
	.long	0x62
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x5ef
	.uleb128 0x16
	.long	.LASF79
	.byte	0x1
	.byte	0x4c
	.long	0x52e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.byte	0x4d
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x15
	.string	"j"
	.byte	0x1
	.byte	0x4d
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x16
	.long	.LASF80
	.byte	0x1
	.byte	0x4e
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x16
	.long	.LASF81
	.byte	0x1
	.byte	0x4e
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x16
	.long	.LASF82
	.byte	0x1
	.byte	0x4e
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x16
	.long	.LASF83
	.byte	0x1
	.byte	0x4e
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x16
	.long	.LASF84
	.byte	0x1
	.byte	0x4e
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x16
	.long	.LASF85
	.byte	0x1
	.byte	0x4f
	.long	0x29f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x16
	.long	.LASF86
	.byte	0x1
	.byte	0x4f
	.long	0x38f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x16
	.long	.LASF87
	.byte	0x1
	.byte	0x50
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.byte	0
	.uleb128 0x12
	.long	.LASF88
	.byte	0x1
	.byte	0xe1
	.long	0x62
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x6c6
	.uleb128 0x13
	.long	.LASF89
	.byte	0x1
	.byte	0xe1
	.long	0x8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x13
	.long	.LASF80
	.byte	0x1
	.byte	0xe1
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x13
	.long	.LASF90
	.byte	0x1
	.byte	0xe1
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x13
	.long	.LASF91
	.byte	0x1
	.byte	0xe1
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x16
	.long	.LASF79
	.byte	0x1
	.byte	0xe3
	.long	0x52e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.byte	0xe4
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x18
	.string	"j"
	.byte	0x1
	.byte	0xe4
	.long	0x62
	.uleb128 0x14
	.long	.LASF81
	.byte	0x1
	.byte	0xe5
	.long	0x62
	.uleb128 0x14
	.long	.LASF82
	.byte	0x1
	.byte	0xe5
	.long	0x62
	.uleb128 0x16
	.long	.LASF83
	.byte	0x1
	.byte	0xe5
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x16
	.long	.LASF84
	.byte	0x1
	.byte	0xe5
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x14
	.long	.LASF85
	.byte	0x1
	.byte	0xe6
	.long	0x29f
	.uleb128 0x16
	.long	.LASF86
	.byte	0x1
	.byte	0xe6
	.long	0x38f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x14
	.long	.LASF87
	.byte	0x1
	.byte	0xe7
	.long	0x4d
	.byte	0
	.uleb128 0x12
	.long	.LASF92
	.byte	0x2
	.byte	0xe
	.long	0x62
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x917
	.uleb128 0x13
	.long	.LASF93
	.byte	0x2
	.byte	0xe
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -244
	.uleb128 0x13
	.long	.LASF94
	.byte	0x2
	.byte	0xe
	.long	0x917
	.uleb128 0x3
	.byte	0x91
	.sleb128 -256
	.uleb128 0x16
	.long	.LASF95
	.byte	0x2
	.byte	0x10
	.long	0x8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0x18
	.string	"f"
	.byte	0x2
	.byte	0x11
	.long	0x62
	.uleb128 0x18
	.string	"m"
	.byte	0x2
	.byte	0x11
	.long	0x62
	.uleb128 0x16
	.long	.LASF96
	.byte	0x2
	.byte	0x11
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -220
	.uleb128 0x16
	.long	.LASF97
	.byte	0x2
	.byte	0x12
	.long	0x91d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x16
	.long	.LASF98
	.byte	0x2
	.byte	0x13
	.long	0x92d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x14
	.long	.LASF99
	.byte	0x2
	.byte	0x14
	.long	0x2a6
	.uleb128 0x16
	.long	.LASF90
	.byte	0x2
	.byte	0x15
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -216
	.uleb128 0x16
	.long	.LASF91
	.byte	0x2
	.byte	0x15
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -212
	.uleb128 0x14
	.long	.LASF100
	.byte	0x2
	.byte	0x16
	.long	0x2d
	.uleb128 0x15
	.string	"i"
	.byte	0x2
	.byte	0x18
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -228
	.uleb128 0x18
	.string	"j"
	.byte	0x2
	.byte	0x18
	.long	0x62
	.uleb128 0x18
	.string	"k"
	.byte	0x2
	.byte	0x18
	.long	0x62
	.uleb128 0x18
	.string	"l"
	.byte	0x2
	.byte	0x18
	.long	0x62
	.uleb128 0x14
	.long	.LASF101
	.byte	0x2
	.byte	0x18
	.long	0x62
	.uleb128 0x14
	.long	.LASF102
	.byte	0x2
	.byte	0x18
	.long	0x62
	.uleb128 0x18
	.string	"Np"
	.byte	0x2
	.byte	0x18
	.long	0x62
	.uleb128 0x14
	.long	.LASF103
	.byte	0x2
	.byte	0x18
	.long	0x62
	.uleb128 0x18
	.string	"ii"
	.byte	0x2
	.byte	0x19
	.long	0x62
	.uleb128 0x18
	.string	"jj"
	.byte	0x2
	.byte	0x19
	.long	0x62
	.uleb128 0x18
	.string	"kk"
	.byte	0x2
	.byte	0x19
	.long	0x62
	.uleb128 0x18
	.string	"xc"
	.byte	0x2
	.byte	0x1a
	.long	0x2a6
	.uleb128 0x18
	.string	"yc"
	.byte	0x2
	.byte	0x1a
	.long	0x2a6
	.uleb128 0x18
	.string	"zc"
	.byte	0x2
	.byte	0x1a
	.long	0x2a6
	.uleb128 0x18
	.string	"xp"
	.byte	0x2
	.byte	0x1b
	.long	0x2a6
	.uleb128 0x18
	.string	"yp"
	.byte	0x2
	.byte	0x1b
	.long	0x2a6
	.uleb128 0x18
	.string	"zp"
	.byte	0x2
	.byte	0x1b
	.long	0x2a6
	.uleb128 0x18
	.string	"vxp"
	.byte	0x2
	.byte	0x1b
	.long	0x2a6
	.uleb128 0x18
	.string	"vyp"
	.byte	0x2
	.byte	0x1b
	.long	0x2a6
	.uleb128 0x18
	.string	"vzp"
	.byte	0x2
	.byte	0x1b
	.long	0x2a6
	.uleb128 0x14
	.long	.LASF104
	.byte	0x2
	.byte	0x1b
	.long	0x2a6
	.uleb128 0x14
	.long	.LASF105
	.byte	0x2
	.byte	0x1c
	.long	0x2a6
	.uleb128 0x14
	.long	.LASF106
	.byte	0x2
	.byte	0x1d
	.long	0x2a6
	.uleb128 0x15
	.string	"pf"
	.byte	0x2
	.byte	0x1f
	.long	0x52e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x16
	.long	.LASF107
	.byte	0x2
	.byte	0x21
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0x16
	.long	.LASF108
	.byte	0x2
	.byte	0x21
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.uleb128 0x16
	.long	.LASF109
	.byte	0x2
	.byte	0x22
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0x16
	.long	.LASF110
	.byte	0x2
	.byte	0x23
	.long	0x93d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x16
	.long	.LASF111
	.byte	0x2
	.byte	0x23
	.long	0x93d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x14
	.long	.LASF112
	.byte	0x2
	.byte	0x23
	.long	0x2a6
	.uleb128 0x16
	.long	.LASF113
	.byte	0x2
	.byte	0x24
	.long	0x93d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x16
	.long	.LASF114
	.byte	0x2
	.byte	0x24
	.long	0x93d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x16
	.long	.LASF115
	.byte	0x2
	.byte	0x25
	.long	0x93d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x16
	.long	.LASF116
	.byte	0x2
	.byte	0x25
	.long	0x93d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x8f
	.uleb128 0xb
	.long	0x95
	.long	0x92d
	.uleb128 0xc
	.long	0x86
	.byte	0x63
	.byte	0
	.uleb128 0xb
	.long	0x95
	.long	0x93d
	.uleb128 0xc
	.long	0x86
	.byte	0x31
	.byte	0
	.uleb128 0xb
	.long	0x2a6
	.long	0x94d
	.uleb128 0xc
	.long	0x86
	.byte	0x2
	.byte	0
	.uleb128 0x19
	.string	"GV"
	.byte	0x7
	.byte	0x17
	.long	0x2ad
	.uleb128 0x9
	.byte	0x3
	.quad	GV
	.uleb128 0x1a
	.long	.LASF117
	.byte	0x7
	.byte	0x23
	.long	0x976
	.uleb128 0x9
	.byte	0x3
	.quad	part
	.uleb128 0x6
	.byte	0x8
	.long	0x353
	.uleb128 0x1a
	.long	.LASF118
	.byte	0x7
	.byte	0x23
	.long	0x976
	.uleb128 0x9
	.byte	0x3
	.quad	copyPart
	.uleb128 0x1a
	.long	.LASF119
	.byte	0x7
	.byte	0x38
	.long	0x39f
	.uleb128 0x9
	.byte	0x3
	.quad	Header
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF59:
	.string	"HubbleParam"
.LASF61:
	.string	"gadget_head"
.LASF32:
	.string	"_shortbuf"
.LASF123:
	.string	"_IO_lock_t"
.LASF21:
	.string	"_IO_buf_end"
.LASF64:
	.string	"redshift"
.LASF98:
	.string	"buffer"
.LASF88:
	.string	"writeGADGETBinaryFile"
.LASF55:
	.string	"SnapLength"
.LASF19:
	.string	"_IO_write_end"
.LASF3:
	.string	"unsigned int"
.LASF13:
	.string	"_flags"
.LASF108:
	.string	"totMassCIC"
.LASF52:
	.string	"NpTot"
.LASF83:
	.string	"dummy"
.LASF25:
	.string	"_markers"
.LASF120:
	.string	"GNU C 4.8.4 -mtune=generic -march=x86-64 -g -fstack-protector"
.LASF104:
	.string	"vmod"
.LASF90:
	.string	"initID"
.LASF87:
	.string	"uintaux"
.LASF112:
	.string	"sumaVelModule"
.LASF118:
	.string	"copyPart"
.LASF46:
	.string	"_pos"
.LASF119:
	.string	"Header"
.LASF24:
	.string	"_IO_save_end"
.LASF49:
	.string	"float"
.LASF101:
	.string	"index"
.LASF111:
	.string	"sumaVel"
.LASF48:
	.string	"long long unsigned int"
.LASF78:
	.string	"file"
.LASF117:
	.string	"part"
.LASF73:
	.string	"fill"
.LASF75:
	.string	"read_parameters"
.LASF58:
	.string	"OmegaL0"
.LASF122:
	.string	"/home/darivadi/Documents/University/Master/Courses/Investigation_IV/Codes_semester_IV/Split_snapshots"
.LASF23:
	.string	"_IO_backup_base"
.LASF79:
	.string	"fdata"
.LASF34:
	.string	"_offset"
.LASF63:
	.string	"time"
.LASF124:
	.string	"readGADGETBinaryFile"
.LASF70:
	.string	"BoxSize"
.LASF27:
	.string	"_fileno"
.LASF68:
	.string	"flag_cooling"
.LASF7:
	.string	"size_t"
.LASF110:
	.string	"sumaMom"
.LASF57:
	.string	"OmegaM0"
.LASF99:
	.string	"auxFiles"
.LASF16:
	.string	"_IO_read_base"
.LASF93:
	.string	"argc"
.LASF44:
	.string	"_next"
.LASF51:
	.string	"globalVariables"
.LASF95:
	.string	"infile"
.LASF11:
	.string	"char"
.LASF72:
	.string	"OmegaLambda"
.LASF40:
	.string	"_mode"
.LASF76:
	.string	"filename"
.LASF103:
	.string	"idPart"
.LASF43:
	.string	"_IO_marker"
.LASF14:
	.string	"_IO_read_ptr"
.LASF62:
	.string	"Npart"
.LASF89:
	.string	"FileNum"
.LASF105:
	.string	"Window_fn"
.LASF17:
	.string	"_IO_write_base"
.LASF47:
	.string	"long long int"
.LASF121:
	.string	"main_split_snap.c"
.LASF56:
	.string	"FILENAME"
.LASF113:
	.string	"sumaMomPart"
.LASF22:
	.string	"_IO_save_base"
.LASF54:
	.string	"NFiles"
.LASF77:
	.string	"filenamedump"
.LASF116:
	.string	"auxVel"
.LASF100:
	.string	"aux_size"
.LASF35:
	.string	"__pad1"
.LASF36:
	.string	"__pad2"
.LASF37:
	.string	"__pad3"
.LASF38:
	.string	"__pad4"
.LASF39:
	.string	"__pad5"
.LASF53:
	.string	"mass"
.LASF31:
	.string	"_vtable_offset"
.LASF94:
	.string	"argv"
.LASF115:
	.string	"auxMom"
.LASF15:
	.string	"_IO_read_end"
.LASF5:
	.string	"short int"
.LASF86:
	.string	"faux"
.LASF6:
	.string	"long int"
.LASF67:
	.string	"npartTotal"
.LASF82:
	.string	"N_max"
.LASF91:
	.string	"endID"
.LASF65:
	.string	"flag_sfr"
.LASF66:
	.string	"flag_feedback"
.LASF106:
	.string	"norm_factor"
.LASF33:
	.string	"_lock"
.LASF10:
	.string	"sizetype"
.LASF102:
	.string	"indexaux"
.LASF0:
	.string	"long unsigned int"
.LASF60:
	.string	"particle"
.LASF29:
	.string	"_old_offset"
.LASF42:
	.string	"_IO_FILE"
.LASF97:
	.string	"NFilename"
.LASF96:
	.string	"partsCount"
.LASF81:
	.string	"N_min"
.LASF109:
	.string	"sumaPart"
.LASF1:
	.string	"unsigned char"
.LASF74:
	.string	"conf2dump"
.LASF45:
	.string	"_sbuf"
.LASF71:
	.string	"Omega0"
.LASF18:
	.string	"_IO_write_ptr"
.LASF114:
	.string	"sumaVelPart"
.LASF8:
	.string	"__off_t"
.LASF84:
	.string	"nread"
.LASF4:
	.string	"signed char"
.LASF2:
	.string	"short unsigned int"
.LASF92:
	.string	"main"
.LASF50:
	.string	"double"
.LASF85:
	.string	"Maux"
.LASF26:
	.string	"_chain"
.LASF12:
	.string	"FILE"
.LASF28:
	.string	"_flags2"
.LASF69:
	.string	"num_files"
.LASF30:
	.string	"_cur_column"
.LASF107:
	.string	"totalMass"
.LASF80:
	.string	"N_tot"
.LASF9:
	.string	"__off64_t"
.LASF41:
	.string	"_unused2"
.LASF20:
	.string	"_IO_buf_base"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
