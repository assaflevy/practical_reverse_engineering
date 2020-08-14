global _main
extern _printf

section .data
hello_str: db 'Hello world!', 0
char: equ 'w'
format:	db 'Char %c found at: %s', 10, 0
not_found: db 'Character not found', 10, 0

section .text

my_strlen:
	push    ebp
	mov     ebp, esp
	mov edi, [ebp+8]
	xor al, al
	or ecx, 0xFFFFFFFF
	repnz scasb
	add ecx, 2
	neg ecx
	mov eax, ecx
	mov esp, ebp
	pop ebp
	ret
	
my_strchr:
	push ebp
	mov ebp, esp
	mov eax, [ebp+8]
	push eax
	call my_strlen
	add esp, 4
	mov ecx, eax
	inc ecx
	mov edi, [ebp + 8]
	mov al, [ebp + 0Ch]
	repne scasb
	mov eax, 0
	dec edi
	mov cl, byte [edi]
	test cl, cl
	cmovnz eax, edi
	mov esp, ebp
	pop ebp
	ret

_main:
	push char
	push hello_str
	call my_strchr
	add esp, 8
	test eax, eax
	jnz _main_found
	push not_found
	call _printf
	add esp, 4
	ret
_main_found:
	push eax
	push char
	push format
	call _printf
	add esp, 12
	ret
	
