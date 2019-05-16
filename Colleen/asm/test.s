section .rodata
	content: db "section .rodata%1$c%2$ccontent: db %3$c%4$s%3$c%1$c%1$csection .text%1$c%2$cglobal _main%1$c%2$cglobal _fonction_supplementaire%1$c%2$cextern _printf%1$c%1$c%5$c%1$c%5$c%2$cCommentaire hors fonction%1$c%5$c%1$c%1$c_fonction_supplementaire:%1$c%2$cpush rbp%1$c%2$cmov rbp, rsp%1$c%2$cleave%1$c%2$cret%1$c%1$c_main:%1$c%2$cpush rbp%1$c%2$cmov rbp, rsp%1$c%1$c%2$c%5$c%1$c%2$c%5$c%2$cCommentaire dans fonction%1$c%2$c%5$c%1$c%1$c%2$ccall _fonction_supplementaire%1$c%1$c%2$clea rdi, [rel content]%1$c%2$cmov rsi, 10%1$c%2$cmov rdx, 9%1$c%2$cmov rcx, 34%1$c%2$clea r8, [rel content]%1$c%2$cmov r9, 59%1$c%2$ccall _printf%1$c%1$c%2$cleave%1$c%2$cret%1$c"

section .text
	global _main
	global _fonction_supplementaire
	extern _printf

;
;	Commentaire hors fonction
;

_fonction_supplementaire:
	push rbp
	mov rbp, rsp
	leave
	ret

_main:
	push rbp
	mov rbp, rsp

	;
	;	Commentaire dans fonction
	;

	call _fonction_supplementaire

	lea rdi, [rel content]
	mov rsi, 10
	mov rdx, 9
	mov rcx, 34
	lea r8, [rel content]
	mov r9, 59
	call _printf

	leave
	ret
