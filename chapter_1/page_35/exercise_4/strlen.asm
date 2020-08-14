global _main
extern _printf

section .data

hello_str: db 'Hello world!', 0
format:	db 'my_strlen() returned %d', 10, 0

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

_main:
	push hello_str
	call my_strlen
	add esp, 4
	push eax
	push format
	call _printf
	add esp, 8
	ret
	
