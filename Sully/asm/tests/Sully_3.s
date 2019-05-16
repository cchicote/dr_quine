%define MACH_SYSCALL(nb) 0x2000000 | nb

section .rodata
	filename: db "Sully_%d.s", 0
	command: db "nasm -D NB -f macho64 Sully_%1$d.s -o Sully_%1$d.o %2$c clang Sully_%1$d.o -o Sully_%1$d %2$c ./Sully_%1$d", 0
	content: db "%6$cdefine MACH_SYSCALL(nb) 0x2000000 | nb%1$c%1$csection .rodata%1$c%2$cfilename: db %3$cSully_%6$cd.s%3$c, 0%1$c%2$ccommand: db %3$cnasm -D NB -f macho64 Sully_%6$c1$d.s -o Sully_%6$c1$d.o %6$c2$c clang Sully_%6$c1$d.o -o Sully_%6$c1$d %6$c2$c ./Sully_%6$c1$d%3$c, 0%1$c%2$ccontent: db %3$c%4$s%3$c, 0%1$c%1$csection .text%1$c%2$cglobal start%1$c%2$cglobal _main%1$c%2$cextern _dprintf%1$c%2$cextern _sprintf%1$c%2$cextern _system%1$c%2$cextern _printf%1$c%1$cstart:%1$c%2$ccall _main%1$c%2$cret%1$c%1$c_main:%1$c%2$cpush rbp%1$c%2$cmov rbp, rsp%1$c%2$csub rsp, 128%1$c%1$c%2$cmov qword [rsp], %7$d%1$c%1$c%2$ccmp qword [rsp], 0%1$c%2$cjle exit_process%1$c%1$c%2$c%6$cifdef NB%1$c%2$c%2$cmov rcx, qword [rsp]%1$c%2$c%2$cdec rcx%1$c%2$c%2$cmov qword [rsp], rcx%1$c%2$c%6$cendif%1$c%1$c%2$clea rdi, [rsp + 8]%1$c%2$clea rsi, [rel filename]%1$c%2$cmov rdx, qword [rsp]%1$c%2$ccall _sprintf%1$c%1$c%2$clea rdi, [rsp + 8]%1$c%2$cmov rsi, 0x0001|0x0200%1$c%2$cmov rdx, 0644o%1$c%2$cmov rax, MACH_SYSCALL(0x5)%1$c%2$csyscall%1$c%1$c%2$ccmp rax, 0%1$c%2$cjl exit_process%1$c%1$c%2$cmov [rsp + 16], rax%1$c%1$c%2$cmov rdi, rax%1$c%2$clea rsi, [rel content]%1$c%2$cmov rdx, 10%1$c%2$cmov rcx, 9%1$c%2$cmov r8, 34%1$c%2$clea r9, [rel content]%1$c%2$cpush 37%1$c%2$cpush 59%1$c%2$ccall _dprintf%1$c%1$c%2$cadd rsp, 16%1$c%1$c%2$clea rdi, [rsp + 24]%1$c%2$clea rsi, [rel command]%1$c%2$cmov rdx, qword [rsp]%1$c%2$cmov rcx, 59%1$c%2$ccall _sprintf%1$c%1$c%2$clea rdi, [rsp + 24]%1$c%2$ccall _system%1$c%1$c%2$cmov rdi, [rsp]%1$c%2$cmov rax, MACH_SYSCALL(0x6)%1$c%2$csyscall%1$c%1$c%2$cexit_process:%1$c%2$c%2$cleave%1$c%2$c%2$cret%1$c", 0

section .text
	global start
	global _main
	extern _dprintf
	extern _sprintf
	extern _system
	extern _printf

start:
	call _main
	ret

_main:
	push rbp
	mov rbp, rsp
	sub rsp, 128

	mov qword [rsp], 3

	cmp qword [rsp], 0
	jle exit_process

	%ifdef NB
		mov rcx, qword [rsp]
		dec rcx
		mov qword [rsp], rcx
	%endif

	lea rdi, [rsp + 8]
	lea rsi, [rel filename]
	mov rdx, qword [rsp]
	call _sprintf

	lea rdi, [rsp + 8]
	mov rsi, 0x0001|0x0200
	mov rdx, 0644o
	mov rax, MACH_SYSCALL(0x5)
	syscall

	cmp rax, 0
	jl exit_process

	mov [rsp + 16], rax

	mov rdi, rax
	lea rsi, [rel content]
	mov rdx, 10
	mov rcx, 9
	mov r8, 34
	lea r9, [rel content]
	push 37
	push 59
	call _dprintf

	add rsp, 16

	lea rdi, [rsp + 24]
	lea rsi, [rel command]
	mov rdx, qword [rsp]
	mov rcx, 59
	call _sprintf

	lea rdi, [rsp + 24]
	call _system

	mov rdi, [rsp]
	mov rax, MACH_SYSCALL(0x6)
	syscall

	exit_process:
		leave
		ret
