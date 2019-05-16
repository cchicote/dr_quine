%macro PROGRAM 0

;
;	Commentaire hors fonction
;

%define MACH_SYSCALL(nb) 0x2000000 | nb

section .rodata
	filename: db "Grace_kid.s", 0
	content: db "%6$cmacro PROGRAM 0%1$c%1$c%5$c%1$c%5$c%2$cCommentaire hors fonction%1$c%5$c%1$c%1$c%6$cdefine MACH_SYSCALL(nb) 0x2000000 | nb%1$c%1$csection .rodata%1$c%2$cfilename: db %3$cGrace_kid.s%3$c, 0%1$c%2$ccontent: db %3$c%4$s%3$c, 0%1$c%1$csection .text%1$c%2$cglobal start%1$c%2$cglobal _main%1$c%2$cextern _dprintf%1$c%1$cstart:%1$c%2$ccall _main%1$c%2$cret%1$c%1$c_main:%1$c%2$cpush rbp%1$c%2$cmov rbp, rsp%1$c%2$csub rsp, 16%1$c%1$c%2$clea rdi, [rel filename]%1$c%2$cmov rsi, 0x0001|0x0200%1$c%2$cmov rdx, 0644o%1$c%2$cmov rax, MACH_SYSCALL(0x5)%1$c%2$csyscall%1$c%1$c%2$ccmp rax, 0%1$c%2$cjl exit_process%1$c%1$c%2$cmov [rsp], rax%1$c%1$c%2$cmov rdi, rax%1$c%2$clea rsi, [rel content]%1$c%2$cmov rdx, 10%1$c%2$cmov rcx, 9%1$c%2$cmov r8, 34%1$c%2$clea r9, [rel content]%1$c%2$cpush 37%1$c%2$cpush 59%1$c%2$ccall _dprintf%1$c%1$c%2$cmov rdi, [rsp]%1$c%2$cmov rax, MACH_SYSCALL(0x6)%1$c%2$csyscall%1$c%1$c%2$cexit_process:%1$c%2$c%2$cleave%1$c%2$c%2$cret%1$c%6$cendmacro%1$c%1$cPROGRAM%1$c", 0

section .text
	global start
	global _main
	extern _dprintf

start:
	call _main
	ret

_main:
	push rbp
	mov rbp, rsp
	sub rsp, 16

	lea rdi, [rel filename]
	mov rsi, 0x0001|0x0200
	mov rdx, 0644o
	mov rax, MACH_SYSCALL(0x5)
	syscall

	cmp rax, 0
	jl exit_process

	mov [rsp], rax

	mov rdi, rax
	lea rsi, [rel content]
	mov rdx, 10
	mov rcx, 9
	mov r8, 34
	lea r9, [rel content]
	push 37
	push 59
	call _dprintf

	mov rdi, [rsp]
	mov rax, MACH_SYSCALL(0x6)
	syscall

	exit_process:
		leave
		ret
%endmacro

PROGRAM
