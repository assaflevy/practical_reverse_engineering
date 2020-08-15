global _main
extern _printf

section .data
char: db 'A'
msg_ok: db 'memset() works as expected.', 10, 0
msg_fail: db 'memset() doesnt work as expected.', 10, 0

section .text

my_memset:
	mov edi, [esp + 4]
	mov al, byte [esp + 8h]
	mov ecx, [esp + 0Ch]
	rep stosb
	mov eax, [esp + 4]
	ret
	
_main:
	push ebp
	mov ebp, esp
	sub esp, 0Ah
	push 0Ah
	mov al, byte [char]
	push eax
	lea eax, [ebp-0Ah]
	push eax
	call my_memset
	add esp, 0Ch

	lea edi, [ebp-0Ah]
	mov al, [char]
	mov ecx, 0Ah
	repe scasb
	test ecx, ecx
	jnz _main_fail
	push msg_ok
	jmp _main_exit
_main_fail:	
	push msg_fail
_main_exit:
	call _printf
	add esp, 4
	add esp, 0Ah
	mov esp, ebp
	pop ebp
	ret
	
