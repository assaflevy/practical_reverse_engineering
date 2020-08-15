global _main
extern _printf

section .data
string: db 'The quick brown fox jump over the lazy schnauzer', 0
format_1: db 'string before: %s', 10, 0
format_2: db 'string after : %s', 10, 0

section .text

my_strset:
	mov edi, [esp + 4]
	mov al, [esp + 8h]
my_strset_loop:
	mov cl, byte [edi]
	test cl, cl
	jz my_strset_exit
	mov byte [edi], al
	inc edi
	jmp my_strset_loop
my_strset_exit:
	mov eax, [esp+4]
	ret
	
_main:
	push string
	push format_1
	call _printf
	add esp, 8
	
	push '#'
	push string
	call my_strset
	add esp, 8
	
	push eax 
	push format_2
	call _printf
	add esp, 8
	
	ret
	
