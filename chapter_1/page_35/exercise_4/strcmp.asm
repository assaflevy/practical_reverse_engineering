global _main
extern _printf

section .data
string_1: db 'The quick brown fox jump over the lazy dog', 0
string_2: db 'The quick brown fox jump over the lazy dog', 0
format: db 'strcmp() returned %d.', 10, 0


section .text

my_strcmp:
	mov edi, [esp + 4]
	mov esi, [esp + 8h]
my_strcmp_loop:
	mov al, byte [edi]
	cmp al, byte [esi]
	jb my_strcmp_below
	ja my_strcmp_above
	test al, al
	jnz my_strcmp_iterate
	xor eax, eax
	ret
my_strcmp_iterate:
	inc edi
	inc esi
	dec ecx
	jmp my_strcmp_loop
my_strcmp_below:
	or eax, 0xffffffff
	ret
my_strcmp_above:
	mov eax, 1
	ret
	
_main:
	lea eax, string_2
	push eax
	lea eax, string_1
	push eax
	call my_strcmp
	add esp, 8
	push eax
	push format
	call _printf
	add esp, 8
	ret
	
